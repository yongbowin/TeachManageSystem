package com.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.Dao.StudentDao;
import com.Dao.TeacherDao;
import com.base.BaseSupport;

public class Register extends BaseSupport {

	private String username;
	private String password;
	private String status;
	
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	public String DoRegister() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取状态值
		String status = request.getParameter("identity_register");
		
		if(status.equals("0")){
			//注册学生账号
			StudentDao.addStudent(username, password, status);
		} else if(status.equals("1")){
			//注册老师账号
			TeacherDao.addTeacher(username, password, status);
		}
		
		return SUCCESS;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getStatus() {
		return status;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
