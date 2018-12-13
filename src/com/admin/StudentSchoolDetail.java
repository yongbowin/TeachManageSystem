package com.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

import com.Dao.StudentDao;
import com.base.BaseSupport;

public class StudentSchoolDetail extends BaseSupport {

	// 学生学籍 详细信息
	private JSONObject student_detail;

	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		String studentID = (String) request.getSession().getAttribute("commonID");

		// 获取学生学籍详细信息
		student_detail = StudentDao.getStudentDetail(studentID);

		return SUCCESS;
	}

	public JSONObject getStudent_detail() {
		return student_detail;
	}

	public void setStudent_detail(JSONObject student_detail) {
		this.student_detail = student_detail;
	}

}
