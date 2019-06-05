package com.cc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cc.entity.Company;
import com.cc.entity.Mission;
import com.cc.entity.User;


public interface RenwuDao {

	List<User> loadZX();

	List<Company> loadCompany();

	void addRenwu(@Param("mname")String mname, @Param("mtime")int mtime, @Param("mstime")String mstime, @Param("metime")String metime, @Param("uid")int uid, @Param("cid")int cid, @Param("mjieshao")String mjieshao, @Param("fuid")int fuid,
			@Param("speed")String speed);

	List<Mission> loadRenwu();

	String findByUid(int uid);

	Mission loadXQ(int mid);

	void delRenwu(int mid);

	void updateRenwu(@Param("mid")int mid, @Param("mname")String mname, @Param("mtime")int mtime, @Param("mstime")String mstime, @Param("metime")String metime, @Param("uid")int uid, @Param("cid")int cid, @Param("mjieshao")String mjieshao,
			@Param("fuid")int fuid, @Param("speed")String speed);

	List<Mission> chaxun(int uid);

}
