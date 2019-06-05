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
		//�ȶ��û����������Ƿ���ȷ
				//1.��AuthenticationToken����ת����UsernamePasswordToken����
				UsernamePasswordToken uptoken=(UsernamePasswordToken) token;
				String name=uptoken.getUsername();
				//��service�е��÷���,��ø��û�����Ϣ
				User user = ls.checkLogin(name);
				//��ֵ����
				ByteSource salt=ByteSource.Util.bytes(name);
			/*	Object result = new SimpleHash("MD5","123456","С��",1024);
				System.out.println(result);*/
				//�Զ��������ȶ�
				SimpleAuthenticationInfo info=new SimpleAuthenticationInfo(name,user.getUpwd(),salt,getName());
				SecurityUtils.getSubject().getSession().setAttribute("uid", user.getUid());
				return info;
	}

}
