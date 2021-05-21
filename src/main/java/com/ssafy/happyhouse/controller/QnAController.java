package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnAController {

	@GetMapping("/qna")
	public String qna() {
		System.out.println(">>>>>>>>>>>>>>>>>>>>QnA");
		return "qna";
	}


}
