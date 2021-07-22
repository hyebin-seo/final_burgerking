package com.burger.event.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/*
 * MultipartHttpServletRequest
 * - 스프링이 제공하는 인터페이스.
 * - Multipart 요청이 들어올 때 내부적으로 HttpServletRequest 객체를 대신하여
 *   사용이 되는 객체(인터페이스)임.
 * - HttpServletRequest 인터페이스와 MultipartRequest 인터페이스를 상속받고 있음.
 * - getParameter() 메서드나 getHeader() 와 같은 메서드를 사용할 수 있으며,
 *   추가적으로 MultipartRequest 인터페이스가 제공하는 Multipart 관련 메서드를
 *   사용할 수 있음.
 */

/*
 * MultipartRequest 인터페이스의 파일 관련 주요 메서드.
 * - Iterator<String> getFilenames()
 *   ==> 업로드된 파일들의 이름 목록을 제공하는 Iterator를 구하는 메서드.
 * - MultipartFile getFile(String name)
 *   ==> 파라미터 이름 name의 업로드 파일 관련 정보를 구하는 메서드.
 * - List<MutipartFile> getFiles(String name)
 *   ==> 파라미터 이름 name의 업로드 파일 정보 목록을 구하는 메서드.
 */

/*
 * Iterator 객체
 * - 자바 컬렉션 프레임워크에서 컬렉션에 저장되어 있는 요소들을 읽어 오는 방법을 표준화한 객체.
 * - 컬렉션으로부터 정보를 얻어 내는 객체.
 * - Iterator 객체를 사용하게 되면 어떤 컬렉션이라도 동일한 방식으로 접근이 가능하며,
 *   그 안에 있는 데이터들에게 쉽게 접근할 수 있는 방법을 제공하는 객체임.
 * - Iterator 객체의 주요 메서드.
 *   * hasNext() : 읽어올 요소가 남아 있는지 확인하는 메서드.
 *                 요소가 있으면 true, 요소가 없으면 false 값을 반환함.
 *   * next() : 다음 데이터를 반환해 주는 메서드.
 *   * remove() : next() 메서드로 읽어온 요소를 삭제하는 메서드.
 */

@Service    // 해당 Upload 라는 클래스는 비지니스 로직을 수행하는 클래스
public class Store_upload {

	public String fileUpload(MultipartHttpServletRequest mRequest) {
		String originalFileName = "";
		boolean isUpload = false;
		
		String uploadPath = 
				"C:\\NCS\\download\\workspace(spring)\\final_burgerking\\BurgerKing\\src\\main\\webapp\\resources\\img\\nstore\\";		
		

		/*
		 * String uploadPath =
		 * "C:\\NCS\\download\\workspace(spring)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BurgerKing\\resources\\img\\nstore\\";
		 */
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			// 톰캣에 있는 임시 파일임.
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드
			originalFileName = mFile.getOriginalFilename();
			
			
			
			// 실제적으로 물리적인 파일의 저장이 필요함. - 일단은 폴더를 만들자.
			// homedir = ........\\resources\\upload\\2021-07-06
			 String homedir = uploadPath;
			
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			// 실제적으로 파일을 만들어 보자.
			String saveFileName = originalFileName;
			
			if(saveFileName != null && !saveFileName.equals("")) {
				saveFileName = saveFileName;
				
				
				try {
					// ........\\resources\\upload\\2021-07-06\\실제파일
					File origin = new File(homedir+"/"+saveFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
					mFile.transferTo(origin);
					
					isUpload = true;
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			System.out.println("upload>>"+originalFileName);
		}  // while 문 end
		
		
		return originalFileName;
	}
}
