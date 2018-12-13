package com.backstage;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.Dao.AdminDao;
import com.Dao.StudentDao;
import com.Dao.TeacherDao;
import com.admin.Common;
import com.base.BaseSupport;

public class BUserClassify extends BaseSupport {
	
	// 学生 列表
	private JSONObject student_detail;
	// 老师 列表
	private JSONObject teacher_detail;
	
	// 学生 列表
	List<Map<String, Object>> BStudentArr;
	// 老师 列表
	List<Map<String, Object>> BTeacherArr;
	// 管理员 列表
	List<Map<String, Object>> BAdminArr;

	//学生学籍信息
	private String studentID;
	private String s_name;
	private String s_sex;
	private String s_number;
	private String s_birthday;
	private String s_enter;
	private String s_grade;
	private String s_phone;
	private String s_graduate;
	private String s_address;
	
	//老师详细信息
	private String teacherID;
	private String t_name;
	private String t_sex;
	private String t_number;
	private String t_title;
	private String t_subject;
	private String t_phone;
	private String t_birthday;
	
	//用户管理页面 搜索分类用户 ID
	private String search_selected;
	
	public String execute() throws Exception {

		return SUCCESS;
	}
	
	public String SearchClassifyUser() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String common_selected = search_selected;
		// 后台-用户管理页面-保存选择的用户类型
		Common.saveUserInfoClassify(request, common_selected);
			
		return null;
	}
	
	/**
	 * 获取学生 学籍信息 详情
	 * @return
	 * @throws Exception
	 */
	public String GetStudentDetail() throws Exception {
		
		student_detail = StudentDao.getStudentDetail(studentID);
		
		return SUCCESS;
	}
	
	/**
	 * 获取 老师 详细信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String GetTeacherDetail() throws Exception {
		
		teacher_detail = TeacherDao.getTeacherDetail(teacherID);
		
		return SUCCESS;
	}
	
	/**
	 * 管理员修改 学生 学籍信息
	 * @return
	 * @throws Exception
	 */
	public String AdminEditStudentDetail() throws Exception {

		if (StudentDao.editStudentDetail(studentID, s_name, s_sex, s_number, 
				s_birthday, s_enter, s_grade, s_phone, s_graduate, s_address)) {
			successMessage = "编辑成功！";
		} else {
			errorMessage = "编辑失败！";
		}
		// 获取学生 学籍信息
		student_detail = StudentDao.getStudentDetail(studentID);
		
		return SUCCESS;
	}
	
	/**
	 * 管理员修改 老师信息
	 * @return
	 * @throws Exception
	 */
	public String AdminEditTeacherDetail() throws Exception {
		
		if (TeacherDao.editTeacherDetail(teacherID, t_name, t_sex, t_number, 
				t_title, t_subject, t_phone, t_birthday)) {
			successMessage = "编辑成功！";
		} else {
			errorMessage = "编辑失败！";
		}
		// 获取 老师信息
		teacher_detail = TeacherDao.getTeacherDetail(teacherID);
		
		return SUCCESS;
	}
	
	/**
	 * 删除学生
	 * @return
	 * @throws Exception
	 */
	public String DeleteStudent() throws Exception {
		
		//删除学生基本信息
		StudentDao.deleteStudent(studentID);
		//根据学生ID获得学号s_number
		JSONObject StudentNumberObject = StudentDao.getStudentByID(studentID);
		String scoreStudentID = (String) StudentNumberObject.get("s_number");
		//并且删除学成成绩信息
		StudentDao.deleteStudentScore(scoreStudentID);
		
		// 后台获取所有学生
		BStudentArr = StudentDao.getAllStudent();
		// 后台获取所有老师
		BTeacherArr = TeacherDao.getAllTeacher();
		// 后台获取所有管理员
		BAdminArr = AdminDao.getAllAdmin();
		
		return SUCCESS;
	}
	
	/**
	 * 删除老师
	 * @return
	 * @throws Exception
	 */
	public String DeleteTeacher() throws Exception {
		
		TeacherDao.deleteTeacher(teacherID);
		
		// 后台获取所有学生
		BStudentArr = StudentDao.getAllStudent();
		// 后台获取所有老师
		BTeacherArr = TeacherDao.getAllTeacher();
		// 后台获取所有管理员
		BAdminArr = AdminDao.getAllAdmin();
		
		return SUCCESS;
	}

	public String getSearch_selected() {
		return search_selected;
	}

	public void setSearch_selected(String search_selected) {
		this.search_selected = search_selected;
	}

	public JSONObject getStudent_detail() {
		return student_detail;
	}

	public JSONObject getTeacher_detail() {
		return teacher_detail;
	}

	public void setStudent_detail(JSONObject student_detail) {
		this.student_detail = student_detail;
	}

	public void setTeacher_detail(JSONObject teacher_detail) {
		this.teacher_detail = teacher_detail;
	}

	public String getStudentID() {
		return studentID;
	}

	public String getTeacherID() {
		return teacherID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}

	public String getS_name() {
		return s_name;
	}

	public String getS_sex() {
		return s_sex;
	}

	public String getS_number() {
		return s_number;
	}

	public String getS_birthday() {
		return s_birthday;
	}

	public String getS_enter() {
		return s_enter;
	}

	public String getS_grade() {
		return s_grade;
	}

	public String getS_phone() {
		return s_phone;
	}

	public String getS_graduate() {
		return s_graduate;
	}

	public String getS_address() {
		return s_address;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public void setS_sex(String s_sex) {
		this.s_sex = s_sex;
	}

	public void setS_number(String s_number) {
		this.s_number = s_number;
	}

	public void setS_birthday(String s_birthday) {
		this.s_birthday = s_birthday;
	}

	public void setS_enter(String s_enter) {
		this.s_enter = s_enter;
	}

	public void setS_grade(String s_grade) {
		this.s_grade = s_grade;
	}

	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}

	public void setS_graduate(String s_graduate) {
		this.s_graduate = s_graduate;
	}

	public void setS_address(String s_address) {
		this.s_address = s_address;
	}

	public List<Map<String, Object>> getBStudentArr() {
		return BStudentArr;
	}

	public List<Map<String, Object>> getBTeacherArr() {
		return BTeacherArr;
	}

	public List<Map<String, Object>> getBAdminArr() {
		return BAdminArr;
	}

	public void setBStudentArr(List<Map<String, Object>> bStudentArr) {
		BStudentArr = bStudentArr;
	}

	public void setBTeacherArr(List<Map<String, Object>> bTeacherArr) {
		BTeacherArr = bTeacherArr;
	}

	public void setBAdminArr(List<Map<String, Object>> bAdminArr) {
		BAdminArr = bAdminArr;
	}

	public String getT_name() {
		return t_name;
	}

	public String getT_sex() {
		return t_sex;
	}

	public String getT_number() {
		return t_number;
	}

	public String getT_title() {
		return t_title;
	}

	public String getT_subject() {
		return t_subject;
	}

	public String getT_phone() {
		return t_phone;
	}

	public String getT_birthday() {
		return t_birthday;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public void setT_sex(String t_sex) {
		this.t_sex = t_sex;
	}

	public void setT_number(String t_number) {
		this.t_number = t_number;
	}

	public void setT_title(String t_title) {
		this.t_title = t_title;
	}

	public void setT_subject(String t_subject) {
		this.t_subject = t_subject;
	}

	public void setT_phone(String t_phone) {
		this.t_phone = t_phone;
	}

	public void setT_birthday(String t_birthday) {
		this.t_birthday = t_birthday;
	}
}
