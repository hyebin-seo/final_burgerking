package com.burger.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.burger.login.model.LoginDAO;
import com.burger.login.model.NaverLoginBO;
import com.burger.login.model.UserDTO;
import com.burger.login.model.kakao_restapi;
import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.exceptions.OAuthSignatureException;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class SNSController {
	
	@Autowired
    LoginDAO dao;

	private kakao_restapi kakao_restapi = new kakao_restapi();

	@RequestMapping(value = "/oauth", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
		System.out.println("로그인 할때 임시 코드값");
		// 카카오 홈페이지에서 받은 결과 코드
		System.out.println("code>>" + code);
		System.out.println("로그인 후 결과값");

		String access_Token = kakao_restapi.getAccessToken(code);
		System.out.println("controller access_token : " + access_Token);
		
		System.out.println("============================================");
		
		HashMap<String, Object> userInfo = kakao_restapi.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);

//	      클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("email") != null) {
			
			UserDTO dto = new UserDTO();
	        String user_id = (String) userInfo.get("email");
	        String user_name = (String) userInfo.get("nickname");
	        //저장하기 
	        
	        dto.setUser_id(user_id);
	        dto.setUser_name(user_name);
	        
	        System.out.println(dto);
	        
            UserDTO kakaoDTO = this.dao.kakaoidCheck(dto);
	        
            if(kakaoDTO == null) {
             int check = this.dao.kakaoJoin(dto);
            }
	       
	        
	        
	       
	        
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("nickname", userInfo.get("nickname"));
			session.setAttribute("access_Token", access_Token);
			
			
		}
		return "logininfo";
		
	}

	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "naverlogin.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "user/Login";
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws Exception {
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);
        
        /* 네이버 로그인 성공 페이지 View 호출 */
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject) obj;
        
        JSONObject response_obj = (JSONObject)jsonObj.get("response");
        String nickname = (String)response_obj.get("nickname");
        String gender = (String)response_obj.get("gender");
      
      System.out.println("gender >>"+gender);
    
//      UserVO vo = new UserVO();
//      vo.setUser_snsId(snsId);
//      vo.setUser_name(name);
//
//      System.out.println(name);
//      try {
//          vo = service.naverLogin(vo);
//      } catch (Exception e) {
//          // TODO Auto-generated catch block
//          e.printStackTrace();
//      }


//      session.setAttribute("login",vo);
//      return new ModelAndView("user/loginPost", "result", vo);
        
        return "logininfo";
    }

}
