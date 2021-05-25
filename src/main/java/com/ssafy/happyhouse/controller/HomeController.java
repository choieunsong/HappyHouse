package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		System.out.println(">>>>>>>>>>>>>>>>>>>>home");
		return "home";
	}
	
	@GetMapping("/tradingInformation")
	public String searchPage() {
		System.out.println(">>>>>>>>>>>>>>trading information");
		return "tradingInformation";
	}

	@GetMapping("/confirmPassword")
	public String confirmPassword() {
		System.out.println(">>>>>>>>>>>>>>>>>>>>confirmPassword");
		return "confirmPassword";
	}
	
	@GetMapping("/qna")
	public String qna() {
		System.out.println(">>>>>>>>>>>>>>>>>>>>QnA");
		return "qna";
	}
	
	@GetMapping("/favoriteLocation")
	public String favorite() {
		System.out.println(">>>>>>>>>>>>>>>>>>>>favorite");
		return "favoriteLocation";
	}
	
	@GetMapping("/favorite")
	public String goFav() {
		System.out.println(">>>>>>>>>>>>>>>>>>>>favorite page");
		return "favoriteLocation";
	}
	
	@GetMapping("/favorite/list")
	public String goFavList() {
		System.out.println(">>>>>>>>>>>>>>>>>>>>favorite list page");
		return "favoriteLocation";
	}
	
	@GetMapping("/favorite/detail")
	public String goFavDetail() {
		System.out.println(">>>>>>>>>>>>>>>>>>>>favorite detail page");
		return "favoriteLocation";
	}
}
