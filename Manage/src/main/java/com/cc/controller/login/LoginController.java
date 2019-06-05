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
	 * ��ת����¼ҳ��
	 * @return
	 */
	@RequestMapping("toLogin.do")
	private String toLogin(){
		return "login/login";
	}
	/**
	 * ��֤��¼
	 * @return
	 */
	@RequestMapping("CheckLogin.do")
	@ResponseBody
	public ManageResult CheckLogin(String name,String password){
		//��ȡSubject����
		Subject currentUser=SecurityUtils.getSubject();
		if(!currentUser.isAuthenticated()){
			//��û�б���֤������£���Ҫ��ȡ�û������������̨�����ݽ���ƥ��
			UsernamePasswordToken token=new UsernamePasswordToken(name,password);
			try {
	                currentUser.login(token);
	            }catch (IncorrectCredentialsException ice) {
	                throw new IncorrectCredentialsException("�������");
	            }catch (UnknownAccountException i) {
	                throw new UnknownAccountException("�û�������");
	            }   
	            catch (AuthenticationException ae) {
	            	System.out.println(ae.getMessage());
	            }
	        }
		
		return new ManageResult();
	}
	
}
