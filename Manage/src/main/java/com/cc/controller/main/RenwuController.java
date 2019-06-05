package com.cc.controller.main;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cc.service.RenwuService;
import com.cc.util.ManageResult;

@Controller
public class RenwuController {
	@Resource
	private RenwuService rs;
	/**
	 * 跳转至添加任务页面
	 * @return
	 */
	@RequestMapping("toAddrw.do")
	private String toAddrw(){
		return "renwu/addrw";
	}
	/**
	 * 加载执行人
	 */
	@RequestMapping("loadZX.do")
	@ResponseBody
	private ManageResult loadZX(){
		ManageResult result = rs.loadZX();
		return result;
	}
	/**
	 * 加载客户公司
	 */
	@RequestMapping("loadCompany.do")
	@ResponseBody
	private ManageResult loadCompany(){
		ManageResult result = rs.loadCompany();
		return result;
	}
	/**
	 * 添加任务
	 */
	@RequestMapping("addRenwu.do")
	@ResponseBody
	private ManageResult addRenwu(String mname,int mtime,String mstime,String metime,int uid,int cid, String mjieshao,int fuid,String speed){
		ManageResult result = rs.addRenwu(mname,mtime,mstime,metime,uid,cid,mjieshao,fuid,speed);
		return result;
	}
	/**
	 * 跳转至任务页面
	 */
	@RequestMapping("toRenwu.do")
	private String toRenwu(){
		return"renwu/renwu";
	}
	/**
	 * 显示所有任务	
	 */
	@RequestMapping("loadRenwu.do")
	@ResponseBody
	private ManageResult loadRenwu(){
		ManageResult result = rs.loadRenwu();
		return result;
	}
	/**
	 * 根据uid查找姓名
	 */
	@RequestMapping("findByUid.do")
	@ResponseBody
	private ManageResult findByUid(int uid){
		ManageResult result = rs.findByUid(uid);
		return result;
	}
	/**
	 * 跳转至详情页面
	 */
	@RequestMapping("toListRenwu.do")
	private String toListRenwu(){
		return "renwu/listrenwu";
	}
	/**
	 * 加载详情
	 */
	@RequestMapping("loadXQ.do")
	@ResponseBody
	private ManageResult loadXQ(int mid){
		ManageResult result = rs.loadXQ(mid);
		return result;
	}
	/**
	 * 删除任务
	 */
	@RequestMapping("delRenwu.do")
	@ResponseBody
	private ManageResult delRenwu(int mid){
		ManageResult result = rs.delRenwu(mid);
		return result;
	}
	/**
	 * 跳转至添加任务页面
	 * @return
	 */
	@RequestMapping("toUpdate.do")
	private String toUpdate(){
		return "renwu/updaterw";
	}
	/**
	 * 修改任务
	 */
	@RequestMapping("updateRenwu.do")
	@ResponseBody
	private ManageResult updateRenwu(int mid,String mname,int mtime,String mstime,String metime,int uid,int cid, String mjieshao,int fuid,String speed){
		ManageResult result = rs.updateRenwu(mid,mname,mtime,mstime,metime,uid,cid,mjieshao,fuid,speed);
		return result;
	}
	/**
	 * 查询任务
	 */
	@RequestMapping("chaxun.do")
	@ResponseBody
	private ManageResult chaxun(int uid){
		ManageResult result = rs.chaxun(uid);
		return result;
	}
}
