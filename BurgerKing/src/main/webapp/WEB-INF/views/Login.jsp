<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>로그인</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/main/fab.ico">

<!-- 눈 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Lgoin.css 연결 -->
<link rel="stylesheet" href="resources/css/Login.css">




<script type="text/javascript">

</script>

</head>
<body>
	<!-- 로그인페이지 header 및 상단고정 필수 -->
	<header class="head_main">
		<div class="head_menuWrap"></div>

	</header>
	<div class="head_nav">
		<nav></nav>
	</div>


	<!-- 아이디/비밀번호 입력하는 공간 -->

	<section class="login_section">
		<div>
			<h1>
				<b>WHERE TASTE IS KING</b>
			</h1>
			<h1>
				<b>어서오세요! 버거킹입니다.</b>
			</h1>
			<div class="middle_web_container">

				<div class="email_login">
					<h3>
						<img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAlCAYAAADFniADAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MEFBNEU4QzdGQzRCMTFFOEI5MUI4NzE2NzRGRTUyOUMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MEFBNEU4QzhGQzRCMTFFOEI5MUI4NzE2NzRGRTUyOUMiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowQUE0RThDNUZDNEIxMUU4QjkxQjg3MTY3NEZFNTI5QyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowQUE0RThDNkZDNEIxMUU4QjkxQjg3MTY3NEZFNTI5QyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pizf/y4AAAQ2SURBVHjavFhtSJRZFD4zjklaiVLm/lALtWJ/qGmZkJK7IxIa6SKK5rJhgRAaCoIFIYhRyCIYyhqi0sLSjmD+qRRJckt/lIGprOIkhqQYCAZOtq6GOT3n8s7g18z7Nc4DD/d9Z+455+He895z7zVUV1eTFgwMDASgOQYeAQNBE2gDP4LWlJSUT6QRJpVCItH8Cp4HT7mzR993aJ6BFgh85XFRCJCApgq8CBoU+j4u8Trsh9HeBTsh0C5naJQRcwBsxuMbMEuFoK04CXaAz+EvSrMoGMeiGQGL5cSrwE/gW/jOVy0KRmzcDx4lz2M/+DdiVCgWhc5n0DwFD9DugdOgDrGuyYpCpwg0T0B/8g7+QMzzLkXhT1b/F3iIvAcRE7FDXY3UFTCFvI+DPJXb1iko3Yvmth7PISEhlJeXR0lJSeJ5cXGRhoeHqb29naanp+XML0FDHdawkY0j9Rv4g1ZBsbGx1NraStnZ2RQaGkpGo5GCg4PJbDZTU1MTpaenK5nGm1un76pWQRy8pqaG/P13/jZ8fX2poqKCIiMj5Vz9gtEKFqLwwGvRaa2icnJyKCAgwPk+OztLnZ2dNDk56fzNx8eHCgoK5FztkaqGyCmznlyKi4tzPttsNiopKaHl5WUymUzU0tJCYWFh4r+YmBgl7n4GH/D0JegRFRgY6Hyen58Xghhra2ti1BzYOJpukODIqSg9omZmZpzP0dHRIqn9/PwoOTmZEhMTd+znBlFIJxNP32E9oqamppzBDQYDVVZWCm5FT0+PEne+XBuNUoHUhLS0NMrPz5ftx+tVV1eX4oLNI7WkRVBGRgaVl5eLNckV7HY79fb2UmNjo8gxhVhmUYtqBWVlZVFpaamYLgf6+/upra2N4uPjKSgoSKzoQ0NDNDc3p8b1Og8Si5pSU/Nyc3OpuLh4k6C+vj6qra2l9fV1tSK24gNKzSqLGlVqUVhYSEVFRdt+X1paElPlAYw6Fs9/lPRmMSzK1XRyOamvr9crrs+xTv0LvpfrvbKysul9fHx8W+JnZmbqEcT59FiIko48f8pZWCwWam5uFiPB25GysjKxM3CAv7Lu7m49ol5Ay4eN57774A1wnzurjo4OGhsbo4mJCfHO4lZXVyk8PJwaGhr0Tt3vzgKemppKERER/6MM8EbvnJzlwsLCpner1UqDg4N6E/wlRqlqp+1wrZLc2gV8BUt23KNDKZf3S1Inb+IGYo+7PGLhzzfSAcLuJUH3EfOe7GEUnR5Kw/ltlwXxce664mM7hPHXyOX/yy6IsUs3MJcR55uqCw4YPJL27q89KIgL4wX4vuXuSsjtbQoMrWjOSnk2rUPMZ/AOeAI+ZVdY2UszOOHl/wG2qZwD2dJNnlluoeVtujTKFvAh/Ng8fr0IpxyEp/QR76Ol68UfpeuifZKv/3g7DvL5ahA2mjaQ3wUYAHqBZELLoSo8AAAAAElFTkSuQmCC">
						일반로그인
					</h3>
					<div class="main">
					 <!-- 아이디/비밀번호 작성한는곳 -->
					 <form action="login_Ok.do" method="post">
						<input type="text" name="formtext1" placeholder="아이디[이메일]" id="userId"> <br>

					    <input type="password" name="user_pwd" placeholder="비밀번호" id="myInput" size="30%" height="50px">
					    <!-- 비밀번호 보이기/안보이기 기능 -->
						<span class="buttonText" onclick="passwordShow()"> show </span><br>
						<!-- 로그인 버튼 -->
						<input type="submit" value="로그인">
						<!-- 회원가입버튼 -->
					
						<input type="image" value="로그인" src="resources/img/login/login_t.png">
						</form>
						<button onclick="location.href='join.do'"><img src="resources/img/login/join.png"></button>
						 <input type="checkbox"
						id="idSaveCheck">아이디 기억하기
						
						
					</div>
					
				</div>
				
				<div class="sns_login">
					<h3>
						<img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QTE2NDkzODkwMzc3MTFFOTk5RDFFRjFEMEQzRUIyMDgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QTE2NDkzOEEwMzc3MTFFOTk5RDFFRjFEMEQzRUIyMDgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBMTY0OTM4NzAzNzcxMUU5OTlEMUVGMUQwRDNFQjIwOCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBMTY0OTM4ODAzNzcxMUU5OTlEMUVGMUQwRDNFQjIwOCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PpuJpi0AAAMsSURBVHjazJlLiFJhFMe/iQoaZwrEqDY9SDTaRE2hEi2qWbQIRDSJHAoLghhauSioRZsiQqiNDM1GYbDABJvKoLQnUeYiGiLIHkRB7RoqMyhspv+5cyQfN72f19eBH37c63fu3++c+z2OfbOzs6KXbZ7ocZtfagwPDzfrwwAsYDVYwj6/gc/gFfjSrON0Ov1PoKStBSNgF9hc/kNVLAdug8vgSbtDPASugjfgFLA3EEdmBUfBY/AMeEBfqwUuBhdBFjhlHlBlG8EVcAeYWyVwA3gODrfwpdrOo7lXr0By9BCsacMLOggugUCzAm3gBoe3XUapEgRHZAWuAtdBf4emuxDPCJoE0q+aAEs7OB+Xnrn8vxN1mR0E22S8OxwO4Xa7hdVqnZv4cjkRj8dFJpORcWPicI9UKC+txbySLALvwAqtXv1+v/D5fKr3otGoCIfDMiJJzCaeNZSVpDrE+2XE2e12RVyxWBShUEi4XC4FatM1ukejKxnq4/Vy8JCMN4/Ho3yOj4+LRCIh8vm8ArUjkYhyj0IvaS5gVBNIc90WGU8Wi0X5TKVSNfeSyWTFdyRsIa9WNS/JTllP/f1zsxCNWrXRNR07pB0gXD2CQz20DRxSG0Gz1t6Tk5PCYDBU7NsaWaFQEE6nU+sjzKytWD6CyzTvUMvEtanPAl6rK0I82GO7/RqBeT3estms8Hq9CtRugf2sFvhVj7dgMCimp6cVqK3TZkoDVi7wbQ+F9wP4VS1wSo/HQCAgjEajMJlMSlunTalNM/f0eLTZbCIWi7VqBO+qLXUveCfTbaP8u6YmkLY6ES0eaNKVNYk+9zkHVTesY+AYGKjnQWJFaMbO1dtuUZnifBfD+wDcanQmOdulXPwNRrUcmmgG38cdOmmUWi+1HjuzfHjqVPGQcv+C7ME9ykP+p83iJri41FTpY4zrJz/aIIyicwYcqDcIWopBcT6rZFoo7hPYDU40SiOt1SqqlG7lvHyvQ9h3cBqsAze1dJApp83wQYaOaXto568x9EXwiPN5JTgpkzLNlICLHPY496cS8Ho+tg7wNVrXPoLX4KmezXBfr/8N8VeAAQDWJtDHnaHaNgAAAABJRU5ErkJggg==">
						간편로그인
					</h3>
				</div>
			</div>
		</div>

		<!-- 비회원 주문  -->
		<div class="noid_order">asdf</div>
	</section>


	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

<!-- js파일에 연결  -->
<script type="text/javascript" src="resources/js/login/login.js"></script> 
</body>
</html>