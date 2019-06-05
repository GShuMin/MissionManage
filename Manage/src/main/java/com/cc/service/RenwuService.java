package com.cc.service;

import com.cc.util.ManageResult;

public interface RenwuService {

	ManageResult loadZX();

	ManageResult loadCompany();

	ManageResult addRenwu(String mname, int mtime, String mstime, String metime, int uid, int cid, String mjieshao, int fuid, String speed);

	ManageResult loadRenwu();

	ManageResult findByUid(int uid);

	ManageResult loadXQ(int mid);

	ManageResult delRenwu(int mid);

	ManageResult updateRenwu(int mid, String mname, int mtime, String mstime, String metime, int uid, int cid,
			String mjieshao, int fuid, String speed);

	ManageResult chaxun(int uid);

}
