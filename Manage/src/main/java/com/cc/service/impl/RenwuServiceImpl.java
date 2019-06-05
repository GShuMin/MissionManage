package com.cc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cc.dao.RenwuDao;
import com.cc.entity.Company;
import com.cc.entity.Mission;
import com.cc.entity.User;
import com.cc.service.RenwuService;
import com.cc.util.ManageResult;


@Service
public class RenwuServiceImpl implements RenwuService {
	@Resource
	private RenwuDao rd;
	public ManageResult loadZX() {
		ManageResult result = new ManageResult();
		List<User> list = rd.loadZX();
		result.setData(list);
		result.setStatus(0);
		result.setMsg("查找执行人成功");
		return result;
	}
	public ManageResult loadCompany() {
		ManageResult result = new ManageResult();
		List<Company> list = rd.loadCompany();
		result.setData(list);
		result.setStatus(0);
		result.setMsg("查找客户公司成功");
		return result;
	}
	public ManageResult addRenwu(String mname, int mtime, String mstime, String metime, int uid, int cid,
			String mjieshao, int fuid, String speed) {
		 rd.addRenwu(mname,mtime,mstime,metime,uid,cid,mjieshao,fuid,speed);
		 ManageResult result = new ManageResult();
		 result.setStatus(0);
		 result.setMsg("添加任务成功");
		 return result;
	}
	public ManageResult loadRenwu() {
		ManageResult result = new ManageResult();
		List<Mission> list = rd.loadRenwu();
		result.setData(list);
		result.setStatus(0);
		result.setMsg("查找任务成功");
		return result;
	}
	public ManageResult findByUid(int uid) {
		String uname = rd.findByUid(uid);
		ManageResult result = new ManageResult();
		result.setData(uname);
		result.setStatus(0);
		result.setMsg("查找姓名成功");
		return result;
	}
	public ManageResult loadXQ(int mid) {
		Mission mission = rd.loadXQ(mid);
		ManageResult result = new ManageResult();
		result.setData(mission);
		result.setStatus(0);
		result.setMsg("加载详情成功");
		return result;
	}
	public ManageResult delRenwu(int mid) {
		rd.delRenwu(mid);
		ManageResult result = new ManageResult();
		result.setStatus(0);
		result.setMsg("删除成功");
		return result;
	}
	public ManageResult updateRenwu(int mid, String mname, int mtime, String mstime, String metime, int uid, int cid,
			String mjieshao, int fuid, String speed) {
		rd.updateRenwu(mid,mname,mtime,mstime,metime,uid,cid,mjieshao,fuid,speed);
		ManageResult result = new ManageResult();
		result.setStatus(0);
		result.setMsg("删除成功");
		return result;
	}
	public ManageResult chaxun(int uid) {
		List<Mission> mission = rd.chaxun(uid);
		ManageResult result = new ManageResult();
		result.setStatus(0);
		result.setData(mission);
		result.setMsg("chaxun成功");
		return result;
	}

}
