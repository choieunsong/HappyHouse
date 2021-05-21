package com.ssafy.happyhouse.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

import io.swagger.annotations.ApiParam;

@Controller
@RequestMapping("/user")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session,
			HttpServletResponse response) {
		try {
			MemberDto memberDto = memberService.login(map);
			System.out.println(map.get("userid"));
			System.out.println(map.get("password"));
			System.out.println(memberDto.toString());
			if (memberDto != null) {
				session.setAttribute("userinfo", memberDto);

				Cookie cookie = new Cookie("ssafy_id", memberDto.getUserid());
				cookie.setPath("/");
				if ("saveok".equals(map.get("idsave"))) {
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);// 40년간 저장.
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);

			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "redirect:/";
	}

	// 회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ResponseEntity<List<MemberDto>> registMember(@RequestBody MemberDto memberDto) {
		int cnt = memberService.registMember(memberDto);
		if (cnt != 0) {
			List<MemberDto> list = memberService.userList();
			System.out.println(memberDto.toString());
			return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
		} else
			return new ResponseEntity(HttpStatus.NO_CONTENT);
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/findpassword", method = RequestMethod.POST)
	public String findPassword(@RequestParam Map<String, String> map, Model model) {
		try {
			MemberDto memberDto = memberService.findPassword(map);
			System.out.println(map.get("userid"));
			System.out.println(map.get("email"));
			System.out.println(memberDto.toString());
			if (memberDto != null) {
				model.addAttribute("userinfo", memberDto);
				return "findpassword";
			} else {
				model.addAttribute("msg", "아이디 또는 이메일을 확인해 주세요.");
				return "redirect:/";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "비민번호를 찾는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "list";
	}

	// myPage가기 위해 비밀번호 확인
	@RequestMapping(value = "/myPage", method = RequestMethod.POST)
	public String myPage(@RequestParam Map<String, String> map, Model model, HttpSession session,
			HttpServletResponse response) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>user/myPage");
		System.out.println("map출력하세용" + map);
		try {
			MemberDto memberDto = memberService.login(map);
			System.out.println(map.get("userid"));
			System.out.println(map.get("password"));
			System.out.println(memberDto.toString());
			if (memberDto != null) {
				return "modifyMypage";
			} else {
				model.addAttribute("msg", "비밀번호를 확인해주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "문제가 발생했습니다.");
			return "error/error";
		}
		return "confirmPassword";
	}

	// myPage 회원정보 수정
	@RequestMapping(value = "/modifyMypage", method = RequestMethod.POST)
	public String modifyMypage(@RequestBody MemberDto memberDto, Model model) {
		int cnt = memberService.modifyMember(memberDto);
		try {
			if (cnt != 0) {
				List<MemberDto> list = memberService.userList();
				System.out.println(memberDto.toString());
				return "home";
			} else {
				model.addAttribute("msg", "회원정보 수정에 문제가 발생했습니다.");
			}
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "문제가 발생했습니다.");
			return "error/error";
		}
		return "modifyMypage";
	}
}
