package com.backstage;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.Dao.ApplyEntranceDao;
import com.base.BaseSupport;

public class BApplyEntrance extends BaseSupport {

	List<Map<String, Object>> BApplyEntranceArr;
	
	//小升初 学生 ID
	private String applyEntranceID;
	private String apply_name;
	private String apply_sex;
	private String apply_birthday;
	private String apply_phone;
	private String apply_graduate;
	private String apply_address;
	
	private JSONObject apply_entrance_detail;
	
	public String execute() throws Exception {
		
		//获取所有 小升初 学生列表
		BApplyEntranceArr = ApplyEntranceDao.getAllApplyEntrance();
		
		return SUCCESS;
	}
	
	/**
	 * 删除 小升初 学生信息
	 * @return
	 * @throws Exception
	 */
	public String DeleteApplyEntrance() throws Exception {
		
		ApplyEntranceDao.delApplyEntrance(applyEntranceID);
		
		return SUCCESS;
	}
	
	public String AdminEditApplyEntranceDetail() throws Exception {
		
		if (ApplyEntranceDao.editApplyEntranceDetail(applyEntranceID, apply_name, 
				apply_sex, apply_birthday, apply_phone, apply_graduate, apply_address)) {
			successMessage = "编辑成功！";
		} else {
			errorMessage = "编辑失败！";
		}
		// 获取 小升初 学生信息
		apply_entrance_detail = ApplyEntranceDao.getApplyEntranceDetail(applyEntranceID);
		
		return SUCCESS;
	}
	
	public String GetApplyEntranceDetail() throws Exception {
		
		// 获取 小升初 学生信息
		apply_entrance_detail = ApplyEntranceDao.getApplyEntranceDetail(applyEntranceID);
		
		return SUCCESS;
	}

	public List<Map<String, Object>> getBApplyEntranceArr() {
		return BApplyEntranceArr;
	}

	public void setBApplyEntranceArr(List<Map<String, Object>> bApplyEntranceArr) {
		BApplyEntranceArr = bApplyEntranceArr;
	}

	public String getApplyEntranceID() {
		return applyEntranceID;
	}

	public void setApplyEntranceID(String applyEntranceID) {
		this.applyEntranceID = applyEntranceID;
	}

	public JSONObject getApply_entrance_detail() {
		return apply_entrance_detail;
	}

	public void setApply_entrance_detail(JSONObject apply_entrance_detail) {
		this.apply_entrance_detail = apply_entrance_detail;
	}

	public String getApply_name() {
		return apply_name;
	}

	public String getApply_sex() {
		return apply_sex;
	}

	public String getApply_birthday() {
		return apply_birthday;
	}

	public String getApply_phone() {
		return apply_phone;
	}

	public String getApply_graduate() {
		return apply_graduate;
	}

	public String getApply_address() {
		return apply_address;
	}

	public void setApply_name(String apply_name) {
		this.apply_name = apply_name;
	}

	public void setApply_sex(String apply_sex) {
		this.apply_sex = apply_sex;
	}

	public void setApply_birthday(String apply_birthday) {
		this.apply_birthday = apply_birthday;
	}

	public void setApply_phone(String apply_phone) {
		this.apply_phone = apply_phone;
	}

	public void setApply_graduate(String apply_graduate) {
		this.apply_graduate = apply_graduate;
	}

	public void setApply_address(String apply_address) {
		this.apply_address = apply_address;
	}
}
