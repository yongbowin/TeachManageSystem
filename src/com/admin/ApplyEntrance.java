package com.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.Dao.ApplyEntranceDao;
import com.base.BaseSupport;

public class ApplyEntrance extends BaseSupport {

	public String apply_name;
	public String apply_birthday;
	public String apply_phone;
	public String apply_graduate;
	public String apply_address;
	public String apply_password;
	
	public String execute() throws Exception {

		return SUCCESS;
	}
	
	public String DoApplyEntrance() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取 男/女 的状态值
		String sex_status = request.getParameter("apply_sex");
		
		if(ApplyEntranceDao.addApplyStudent(apply_name, sex_status, apply_birthday, 
				apply_phone, apply_graduate, apply_address, apply_password)){
			
			successMessage = "报名成功！";
			return SUCCESS;
		}
		
		errorMessage = "报名失败，请重新输入！";
		
		return ERROR;
	}

	public String getApply_name() {
		return apply_name;
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

	public String getApply_password() {
		return apply_password;
	}

	public void setApply_name(String apply_name) {
		this.apply_name = apply_name;
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

	public void setApply_password(String apply_password) {
		this.apply_password = apply_password;
	}
}
