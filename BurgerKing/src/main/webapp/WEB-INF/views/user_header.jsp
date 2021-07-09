<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버거킹</title>
<!-- top nav부분 css -->
<style type="text/css">
.top_menu_ul{
	   text-align: right;
	   margin: 10px;
	   padding: 0;
}
.top_menu_ul li{
	list-style: none;
	margin-left: 15px;
	display: inline-block;
}
.top_menu_ul li a{
   color: #aaa;
   text-decoration: none;
}
.shopName{
	font-size: 34px;
	font-weight: bold;
}
</style>
<!-- top nav부분 css end-->
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body>
<header>
	<c:if test="${user_id == null}">
	<!-- id가 없는 경우 = 로그인 전 -->
      <div class="top_menu">
         <ul class="top_menu_ul">
            <li><a href="user_login.do">LOGIN</a></li>
            <li><a href="user_join.do">JOIN</a></li>
            <li><a href="javascript:alert('회원 전용 서비스입니다.');">CART</a></li>
            <li><a href="javascript:alert('회원 전용 서비스입니다.');">MYPAGE</a></li>
         </ul>
       </div>
    </c:if>
     <c:if test="${user_id != null}">
	<!-- id가 있는 경우 = 로그인 후 -->
		<div class="top_menu">
	      <ul class="top_menu_ul">
	      	 <li><a href="#">${user_id }님 </a></li>
	         <li><a href="user_logout.do">LOGOUT</a></li>
	         <li><a href="<%=request.getContextPath() %>/user_cartList.do">CART</a></li>
	         <li><a href="user_mypage.do">MYPAGE</a></li>
	      </ul>
	    </div>
    </c:if>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
  	<i class="fas fa-socks"></i>&nbsp;&nbsp;
    <a class="navbar-brand shopName" href="<%=request.getContextPath() %>/userMain.do">SOCKS ON</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_productList.do?categoryNo=0">ALL</a>
        </li>
       <!--  <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li> -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            MAN
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="user_productList.do?categoryNo=1">LONG</a></li>
            <li><a class="dropdown-item" href="user_productList.do?categoryNo=2">SHORT</a></li>
            <li><a class="dropdown-item" href="user_productList.do?categoryNo=3">FAKE SOCKS</a></li>
           <!-- 선넣기  <li><hr class="dropdown-divider"></li> -->
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            WOMAN
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="user_productList.do?categoryNo=4">LONG</a></li>
            <li><a class="dropdown-item" href="user_productList.do?categoryNo=5">SHORT</a></li>
            <li><a class="dropdown-item" href="user_productList.do?categoryNo=6">FAKE SOCKS</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            KIDS
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="user_productList.do?categoryNo=7">LONG</a></li>
            <li><a class="dropdown-item" href="user_productList.do?categoryNo=8">SHORT</a></li>
            <li><a class="dropdown-item" href="user_productList.do?categoryNo=9">FAKE SOCKS</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            COMMUNITY
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/user_noticeList.do">NOTICE</a></li>
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/user_faq.do">FAQ</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="user_review_list.do?user_id=${user_id }">REVIEW</a></li>
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/user_Allqna.do">QNA</a></li>
          </ul>
        </li>
        <!-- disabled 메뉴가 왜 필요할까? 근데 그냥 냅둬봐야지 ㅋㅋㅋ<li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li> -->
      </ul>
        <form class="d-flex" method="post" action="<%=request.getContextPath()%>/user_searchProductList.do">
        <input class="form-control me-2" name="searchTxt" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
</header>
</body>
</html>