package com.cc.controller.main;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	/**
	 * 跳转至主页面
	 * @return
	 */
	@RequestMapping("toMain.do")
	private String toLogin(){
		return "main/main";
	}
	/**
	 * 主页面合成页面之一
	 * @return
	 */
	@RequestMapping("toTop.do")
	private String toTop(){
		return "main/top";
	}
	/**
	 * 主页面合成页面之一
	 * @return
	 */
	@RequestMapping("toLeft.do")
	private String toLeft(){
		return "main/left";
	}
	/**
	 * 主页面合成页面之一
	 * @return
	 */
	@RequestMapping("toMainfre.do")
	private String toMainfre(){
		return "main/mainfre";
	}
	
	
	
}
