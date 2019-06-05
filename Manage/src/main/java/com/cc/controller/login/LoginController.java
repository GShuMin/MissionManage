package com.cc.controller.login;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cc.service.LoginService;
import com.cc.util.ManageResult;

@Controller
public class LoginController {
	@Resource
	private LoginService ls;
	
	/**
	 * 跳转至登录页面
	 * @return
	 */
	@RequestMapping("toLogin.do")
	private String toLogin(){
		return "login/login";
	}
	/**
	 * 验证登录
	 * @return
	 */
	@RequestMapping("CheckLogin.do")
	@ResponseBody
	public ManageResult CheckLogin(String name,String password){
		//获取Subject对象
		Subject currentUser=SecurityUtils.getSubject();
		if(!currentUser.isAuthenticated()){
			//在没有被验证的情况下，需要获取用户名和密码与后台的数据进行匹配
			UsernamePasswordToken token=new UsernamePasswordToken(name,password);
			try {
	                currentUser.login(token);
	            }catch (IncorrectCredentialsException ice) {
	                throw new IncorrectCredentialsException("密码错误！");
	            }catch (UnknownAccountException i) {
	                throw new UnknownAccountException("用户名错误！");
	            }   
	            catch (AuthenticationException ae) {
	            	System.out.println(ae.getMessage());
	            }
	        }
		
		return new ManageResult();
	}
	
}
