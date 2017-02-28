package com.spring.unde;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@RequestMapping("home.do")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/popup/popup_page")
	public String popup(){
		return "popup/popup_page";
	}
	
	@RequestMapping("/popup/nopopup")
	public String noPopup(){
		return "popup/nopopup";
	}
	@RequestMapping("contact")
	public String contact(){
		return "contact/contact";
	}
	
}
