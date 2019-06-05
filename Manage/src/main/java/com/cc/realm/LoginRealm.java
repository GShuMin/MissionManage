package com.cc.realm;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.util.ByteSource;

import com.cc.entity.User;
import com.cc.service.LoginService;


public class LoginRealm extends AuthenticatingRealm{

	@Resource
	private LoginService ls;
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//比对用户名和密码是否正确
				//1.把AuthenticationToken对象转换成UsernamePasswordToken对象
				UsernamePasswordToken uptoken=(UsernamePasswordToken) token;
				String name=uptoken.getUsername();
				//从service中调用方法,获得该用户的信息
				User user = ls.checkLogin(name);
				//盐值加密
				ByteSource salt=ByteSource.Util.bytes(name);
			/*	Object result = new SimpleHash("MD5","123456","小明",1024);
				System.out.println(result);*/
				//自动完成密码比对
				SimpleAuthenticationInfo info=new SimpleAuthenticationInfo(name,user.getUpwd(),salt,getName());
				SecurityUtils.getSubject().getSession().setAttribute("uid", user.getUid());
				return info;
	}

}
