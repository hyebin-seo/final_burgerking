<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장등록</title>
<link  href="resources/css/cs/notice.css"  rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7l0mvlbzl6&submodules=geocoder"></script>
<script type="text/javascript">

function addrChange() {
	
	var addr = $("#store_addr").val();
	var x = "";
	var y = "";
	
	//키값 랜덤 문자열 생성
	var randStr = Math.random().toString(36).substr(2,11);
	$("#store_key").val(randStr);
	console.log($("#store_key").val());
	
	var form = document.sform;
	
	var input1 = document.createElement('input');
	var input2 = document.createElement('input'); 
	
	// 도로명 주소를 좌표 값으로 변환(API)
	naver.maps.Service.geocode({
        query: addr
    }, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            return alert('Something wrong!');
        }

        var result = response.v2, // 검색 결과의 컨테이너
            items = result.addresses; // 검색 결과의 배열
            
        if(items[0] == undefined) {
        	alert("주소가 잘못되었습니다!");
        	return;
        }
            
        // 리턴 받은 좌표 값 변수에 저장
        x = parseFloat(items[0].x);
        y = parseFloat(items[0].y);
        
        console.log("api inner:"+y);
        console.log("api inner:"+x);
        $("#pi_x").val(y);
        $("#pi_y").val(x);
        
       /* input1.setAttribute("type", "hidden"); 
		input1.setAttribute("name", "pi_x"); 
		input1.setAttribute("value", y); 
		
		input2.setAttribute("type", "hidden"); 
		input2.setAttribute("name", "pi_y"); 
		input2.setAttribute("value", x);
		
		form.appendChild(input1); 
		form.appendChild(input2);*/
		
		form.action = "store_register_ok.do";
		
		form.submit();
        
        //console.log($("#pi_x").val());
        //console.log($("#pi_y").val());

    });
	
}

</script>
</head>
<body>
	   <form method="post" name="sform">
		  <input type="hidden" name="pi_x" id="pi_x" required>
		  <input type="hidden" name="pi_y" id="pi_y" required>
	     <table>
	     
	         <tr>
	         	<th>매장코드</th>
	         	<td> 
		         	
		         	<input type="text" name="store_key" id="store_key" required>
	         	</td>
	      	 </tr>
	      	 
	      	 <tr>
	         	<th>매장명</th>
	         	<td> <input type="text" name="store_name" required> </td>
	      	 </tr> 
	      	 
	      	 <tr>
	         	<th>매장주소</th>
	         	<td> <input type="text" name="store_addr" id="store_addr" required> </td>
	      	 </tr> 
	      	 
	      	 <tr>
	         	<th>매장연락처</th>
	         	<td> <input type="text" name="store_contact" required> </td>
	      	 </tr>
	      	 
	      	 <tr>
	         	<th>오픈시간</th>
	         	<td> <input type="text" name="open_time" required> </td>
	      	 </tr> 
	      	 
	      	 <tr>
	         	<th>딜리버리시간</th>
	         	<td> <input type="text" name="delivery_time"> </td>
	      	 </tr> 
	      	 
	      	 <tr>
	         	<th>킹오더시간</th>
	         	<td> <input type="text" name="kingorder_time"> </td>
	      	 </tr> 
	      	 
	      	 <tr>
	         	<th>딜리버리</th>
	         	<td> <input type="text" name="delivery" value="1" required> </td>
	      	 </tr> 
	      	 
	      	 <tr>
	         	<th>킹오더</th>
	         	<td> <input type="text" name="kingorder" value="1" required> </td>
	      	 </tr> 
	      	 
	      	 <tr>
	         	<th>24시간</th>
	         	<td> <input type="text" name="allday" value="0" required> </td>
	      	 </tr> 	
	      	 
	      	 <tr>
	         	<th>아침</th>
	         	<td> <input type="text" name="morning" value="0" required> </td>
	      	 </tr> 
	      	 
	      	 <tr>
	         	<th>주차</th>
	         	<td> <input type="text" name="parking" value="0" required> </td>
	      	 </tr> 	
	      	 
	      	 <tr>
	         	<th>드라이브</th>
	         	<td> <input type="text" name="drivethru" value="0" required> </td>
	      	 </tr> 						
	
	     </table>
	     <input type="button" value="등록" onclick="addrChange()">
	   </form>
</body>
</html>