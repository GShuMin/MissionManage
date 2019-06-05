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
	 * ��ת���������ҳ��
	 * @return
	 */
	@RequestMapping("toAddrw.do")
	private String toAddrw(){
		return "renwu/addrw";
	}
	/**
	 * ����ִ����
	 */
	@RequestMapping("loadZX.do")
	@ResponseBody
	private ManageResult loadZX(){
		ManageResult result = rs.loadZX();
		return result;
	}
	/**
	 * ���ؿͻ���˾
	 */
	@RequestMapping("loadCompany.do")
	@ResponseBody
	private ManageResult loadCompany(){
		ManageResult result = rs.loadCompany();
		return result;
	}
	/**
	 * �������
	 */
	@RequestMapping("addRenwu.do")
	@ResponseBody
	private ManageResult addRenwu(String mname,int mtime,String mstime,String metime,int uid,int cid, String mjieshao,int fuid,String speed){
		ManageResult result = rs.addRenwu(mname,mtime,mstime,metime,uid,cid,mjieshao,fuid,speed);
		return result;
	}
	/**
	 * ��ת������ҳ��
	 */
	@RequestMapping("toRenwu.do")
	private String toRenwu(){
		return"renwu/renwu";
	}
	/**
	 * ��ʾ��������	
	 */
	@RequestMapping("loadRenwu.do")
	@ResponseBody
	private ManageResult loadRenwu(){
		ManageResult result = rs.loadRenwu();
		return result;
	}
	/**
	 * ����uid��������
	 */
	@RequestMapping("findByUid.do")
	@ResponseBody
	private ManageResult findByUid(int uid){
		ManageResult result = rs.findByUid(uid);
		return result;
	}
	/**
	 * ��ת������ҳ��
	 */
	@RequestMapping("toListRenwu.do")
	private String toListRenwu(){
		return "renwu/listrenwu";
	}
	/**
	 * ��������
	 */
	@RequestMapping("loadXQ.do")
	@ResponseBody
	private ManageResult loadXQ(int mid){
		ManageResult result = rs.loadXQ(mid);
		return result;
	}
	/**
	 * ɾ������
	 */
	@RequestMapping("delRenwu.do")
	@ResponseBody
	private ManageResult delRenwu(int mid){
		ManageResult result = rs.delRenwu(mid);
		return result;
	}
	/**
	 * ��ת���������ҳ��
	 * @return
	 */
	@RequestMapping("toUpdate.do")
	private String toUpdate(){
		return "renwu/updaterw";
	}
	/**
	 * �޸�����
	 */
	@RequestMapping("updateRenwu.do")
	@ResponseBody
	private ManageResult updateRenwu(int mid,String mname,int mtime,String mstime,String metime,int uid,int cid, String mjieshao,int fuid,String speed){
		ManageResult result = rs.updateRenwu(mid,mname,mtime,mstime,metime,uid,cid,mjieshao,fuid,speed);
		return result;
	}
	/**
	 * ��ѯ����
	 */
	@RequestMapping("chaxun.do")
	@ResponseBody
	private ManageResult chaxun(int uid){
		ManageResult result = rs.chaxun(uid);
		return result;
	}
}
