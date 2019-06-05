package com.cc.service.impl;

import javax.annotation.Resource;

import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Service;

import com.cc.dao.LoginDao;
import com.cc.entity.User;
import com.cc.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Resource
	private LoginDao ld;

	public User checkLogin(String name) {
		if(name==null){
			throw new NullPointerException("�û�������Ϊ�գ�");
		}
		int i = ld.isExist(name);
		if(i!=1){
			throw new UnknownAccountException("���û������ڣ�");
		}
		//�����û����ҵ��û���Ϣ
			User user = ld.findUserByName(name);
			return user;
	}
	
}
