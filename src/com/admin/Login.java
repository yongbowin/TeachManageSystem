package com.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.Dao.AdminDao;
import com.Dao.StudentDao;
import com.Dao.TeacherDao;
import com.base.BaseSupport;

public class Login extends BaseSupport {

	private String username;
	private String password;
	
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	public String DoLogin() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取状态值
		String status = request.getParameter("identity_login");

		if(StringUtils.isEmpty(username)){
			errorMessage = "请填写用户名！";
			return ERROR;
		}
		
		if(StringUtils.isEmpty(password)){
			errorMessage = "请填写密码！";
			return ERROR;
		}
		
		if(status.equals("0")){
			//学生登录
			String commonID = StudentDao.isStudent(username, password);
			
			if(StringUtils.isNotEmpty(commonID)){
				
				// 保存用户会话信息
				Common.saveUserInfo(request, commonID, username, status);
				return SUCCESS;
			}
		} else if(status.equals("1")){
			//老师登录
			String commonID = TeacherDao.isTeacher(username, password);
			if(StringUtils.isNotEmpty(commonID)){
				
				// 保存用户会话信息
				Common.saveUserInfo(request, commonID, username, status);
				return SUCCESS;
			}
		} else if(status.equals("2")){
			//管理员登陆
			String commonID = AdminDao.isAdmin(username, password);
			if(StringUtils.isNotEmpty(commonID)){
				
				// 保存用户会话信息 
				Common.saveUserInfo(request, commonID, username, status);
				//跳转到后台
				return "back_index";
			}
		}
		
		errorMessage = "登录失败，请重新输入！";
		return ERROR;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
