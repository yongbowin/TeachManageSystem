package com.backstage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.Dao.AdminDao;
import com.Dao.StudentDao;
import com.Dao.TeacherDao;
import com.base.BaseSupport;

public class BUser extends BaseSupport {

	// 学生 列表
	List<Map<String, Object>> BStudentArr;
	// 老师 列表
	List<Map<String, Object>> BTeacherArr;
	// 管理员 列表
	List<Map<String, Object>> BAdminArr;
	
	private String search_selected;

	public String execute() throws Exception {

		// 后台获取所有学生
		BStudentArr = StudentDao.getAllStudent();
		// 后台获取所有老师
		BTeacherArr = TeacherDao.getAllTeacher();
		// 后台获取所有管理员
		BAdminArr = AdminDao.getAllAdmin();
		
		return SUCCESS;
	}
	
	public List<Map<String, Object>> getBStudentArr() {
		return BStudentArr;
	}

	public List<Map<String, Object>> getBTeacherArr() {
		return BTeacherArr;
	}

	public void setBStudentArr(List<Map<String, Object>> bStudentArr) {
		BStudentArr = bStudentArr;
	}

	public void setBTeacherArr(List<Map<String, Object>> bTeacherArr) {
		BTeacherArr = bTeacherArr;
	}

	public List<Map<String, Object>> getBAdminArr() {
		return BAdminArr;
	}

	public void setBAdminArr(List<Map<String, Object>> bAdminArr) {
		BAdminArr = bAdminArr;
	}

	public String getSearch_selected() {
		return search_selected;
	}

	public void setSearch_selected(String search_selected) {
		this.search_selected = search_selected;
	}

}