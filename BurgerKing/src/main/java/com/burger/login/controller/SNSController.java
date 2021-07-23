package com.burger.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.burger.login.model.GoogleLogin;
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
		if (userInfo.get("id") != null) {

			UserDTO dto = new UserDTO();
			String user_id = (String) userInfo.get("id");
			String user_name = (String) userInfo.get("nickname");
			// 저장하기

			dto.setUser_id(user_id);
			dto.setUser_name(user_name);
			dto.setSns_flag("kakao");

			System.out.println(dto);

			UserDTO kakaoDTO = this.dao.snsidCheck(dto);

			if (kakaoDTO == null) {
				int check = this.dao.snsJoin(dto);
			}

			session.setMaxInactiveInterval(60*120); // 120분간유효
			session.setAttribute("access_Token", access_Token);
			session.setAttribute("memberSession", dto);

		}
		return "delivery/deliveryHome";

	}

	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session) {
		kakao_restapi.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		session.invalidate();
		return "home";
	}

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "naverlogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "user/bk_login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.

		apiResult = naverLoginBO.getUserProfile(oauthToken);

		model.addAttribute("result", apiResult);

		/* 네이버 로그인 성공 페이지 View 호출 */
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		
		if ((String) response_obj.get("id") != null) {

			UserDTO dto = new UserDTO();
			String user_name = (String) response_obj.get("name");
			String user_id = (String) response_obj.get("id");
			// 저장하기

			dto.setUser_id(user_id);
			dto.setUser_name(user_name);
			dto.setSns_flag("naver");

			System.out.println(dto);

			UserDTO kakaoDTO = this.dao.snsidCheck(dto);

			if (kakaoDTO == null) {
				int check = this.dao.snsJoin(dto);
			}
			session.setMaxInactiveInterval(60*120); // 120분간유효
			session.setAttribute("memberSession", dto);

		}

		return "delivery/deliveryHome";
	}

	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;

	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	// 로그인 페이지로 이동하는 컨트롤러
	@RequestMapping(value = "googlelogin.do")
	public String initLogin(Model model, HttpSession session) throws Exception {

		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();

		/* 로그인페이지 이동 url생성 */
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		model.addAttribute("google_url", url);

		System.out.println(url);

		/* 생성한 인증 URL을 Model에 담아서 전달 */
		return "delivery/deliveryHome";
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "googlecallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code, HttpSession session,
			HttpServletResponse response) throws Exception {

	

		// Access Token 발급
		JsonNode jsonToken = GoogleLogin.getAccessToken(code);
		String accessToken = jsonToken.get("access_token").toString();
		String refreshToken = "";
		if (jsonToken.has("refresh_token")) {
			refreshToken = jsonToken.get("refresh_token").toString();
		}
		String expiresTime = jsonToken.get("expires_in").toString();
	

		// Access Token으로 사용자 정보 반환
		JsonNode userInfo = GoogleLogin.getGoogleUserInfo(accessToken);
		System.out.println(userInfo.toString());

		if (userInfo.get("id") != null) {

			UserDTO dto = new UserDTO();
			String user_name = userInfo.get("name").asText();
			String user_id = userInfo.get("id").asText();
			// 저장하기

			dto.setUser_id(user_id);
			dto.setUser_name(user_name);
			dto.setSns_flag("google");

			System.out.println(dto);

			UserDTO kakaoDTO = this.dao.snsidCheck(dto);

			if (kakaoDTO == null) {
				int check = this.dao.snsJoin(dto);
			}

			session.setMaxInactiveInterval(60*120); // 120분간유효
			session.setAttribute("memberSession", dto);
			

		}

		// 사용자 정보 출력

		// 받아온 사용자 정보를 view에 전달
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");

		// 저는 성공하면 메인페이지로 리다이렉트합니다.
		return "delivery/deliveryHome";
	}

}
