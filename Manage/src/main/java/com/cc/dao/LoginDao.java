package com.cc.dao;

import com.cc.entity.User;

public interface LoginDao {

	int isExist(String name);

	User findUserByName(String name);

}
