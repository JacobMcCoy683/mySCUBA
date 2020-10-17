package edu.osu.cse5234.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class Home {
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewHome(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "Home";
	}
	
	@RequestMapping(path = "/aboutus", method = RequestMethod.GET)
	public String viewAboutUs(HttpServletRequest request, HttpServletResponse respone) {
		
		return "AboutUs";
	}
	@RequestMapping(path = "/contactus", method = RequestMethod.GET)
	public String viewContactUs(HttpServletRequest request, HttpServletResponse respone) {
		
		return "ContactUs";
	}
}
