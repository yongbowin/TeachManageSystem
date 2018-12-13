package com.backstage;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.Dao.ApplyEntranceDao;
import com.base.BaseSupport;

public class CheckApply extends BaseSupport {

	private String applyStuID;
	private String userName;
	private String passWord;
	
	List<Map<String, Object>> CheckApplyArr;
	
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	/**
	 * 管理员拒绝 该生的 小升初报名
	 * @return
	 * @throws Exception
	 */
	public String RefuseApplyIn() throws Exception {
		
		ApplyEntranceDao.editApplyIn(applyStuID, "2");
		
		return SUCCESS;
	}
	
	/**
	 * 管理员通过 该生的 小升初报名
	 * @return
	 * @throws Exception
	 */
	public String PassApplyIn() throws Exception {
		
		ApplyEntranceDao.editApplyIn(applyStuID, "1");
		
		return SUCCESS;
	}
	
	/**
	 * 审核结果
	 * @return
	 * @throws Exception
	 */
	public String checkResultEntrance() throws Exception {
		
		return SUCCESS;
	}
	
	/**
	 * 结果
	 * @return
	 * @throws Exception
	 */
	public String checkResultEntr() throws Exception {
		
		CheckApplyArr = ApplyEntranceDao.getAllApplyEntr(userName, passWord);

		String apply_status = (String) CheckApplyArr.get(0).get("apply_status");
		
		HttpServletResponse response = ServletActionContext.getResponse();
        PrintWriter outer = response.getWriter();
		
		if(apply_status.equals("1")){
			String str1 = "审核通过！";
			String str2 = new String(str1.getBytes(), "ISO-8859-1");
			outer.write(str2);
		} else if(apply_status.equals("2")){
			String str1 = "审核未通过！";
			String str2 = new String(str1.getBytes(), "ISO-8859-1");
			outer.write(str2);
		} else if(apply_status.equals("") || apply_status == null){
			String str1 = "还没审核，请耐心等待！";
			String str2 = new String(str1.getBytes(), "ISO-8859-1");
			outer.write(str2);
		}
		
		return null;
	}
	
	public String getApplyStuID() {
		return applyStuID;
	}

	public void setApplyStuID(String applyStuID) {
		this.applyStuID = applyStuID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public List<Map<String, Object>> getCheckApplyArr() {
		return CheckApplyArr;
	}

	public void setCheckApplyArr(List<Map<String, Object>> checkApplyArr) {
		CheckApplyArr = checkApplyArr;
	}
}
