package com.cc.controller.main;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	/**
	 * ��ת����ҳ��
	 * @return
	 */
	@RequestMapping("toMain.do")
	private String toLogin(){
		return "main/main";
	}
	/**
	 * ��ҳ��ϳ�ҳ��֮һ
	 * @return
	 */
	@RequestMapping("toTop.do")
	private String toTop(){
		return "main/top";
	}
	/**
	 * ��ҳ��ϳ�ҳ��֮һ
	 * @return
	 */
	@RequestMapping("toLeft.do")
	private String toLeft(){
		return "main/left";
	}
	/**
	 * ��ҳ��ϳ�ҳ��֮һ
	 * @return
	 */
	@RequestMapping("toMainfre.do")
	private String toMainfre(){
		return "main/mainfre";
	}
	
	
	
}
