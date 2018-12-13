package com.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

import com.Dao.StudentDao;
import com.base.BaseSupport;

public class Score extends BaseSupport {

	// 学生成绩 详情
	private JSONObject student_score_detail;
	private JSONObject student_score_ranking_detail;

	// 学生成绩列表
	List<Map<String, Object>> BScoreArr;
	
	//学生学号
	private String scoreStudentID;
	
	public String execute() throws Exception {
		
		//获取所有学生成绩列表
		BScoreArr = StudentDao.getAllScore();
		//获取 学生成绩 详细信息
		HttpServletRequest request = ServletActionContext.getRequest();
		//获得学生的ID
		String commonID = (String) request.getSession().getAttribute("commonID");
		//根据学生ID获得学号s_number和年级s_grade
		JSONObject scoreStudentIDObject = StudentDao.getStudentByID(commonID);
		String scoreStudentID = (String) scoreStudentIDObject.get("s_number");
//		获取该生的年级
//		方法一：
		String s_grade = (String) scoreStudentIDObject.get("s_grade");
//		方法二：
//		Object s_grade = scoreStudentIDObject.get("s_grade");
//		获取该生的姓名
		String s_name = (String) scoreStudentIDObject.get("s_name");
		
		student_score_detail = StudentDao.getStuScoreDetail(scoreStudentID);
//		方法一：将某个元素添加到JSONObject对象中
//		student_score_detail.accumulate("s_grade", s_grade);
//		student_score_detail.element("s_grade", s_grade);
		student_score_detail.put("s_grade", s_grade);
		student_score_detail.put("s_name", s_name);
		
		//获取学生成绩排名
		student_score_ranking_detail = StudentDao.getStuScoreRankingDetail(scoreStudentID, s_grade);
		
		return SUCCESS;
	}

	public JSONObject getStudent_score_detail() {
		return student_score_detail;
	}

	public List<Map<String, Object>> getBScoreArr() {
		return BScoreArr;
	}

	public void setStudent_score_detail(JSONObject student_score_detail) {
		this.student_score_detail = student_score_detail;
	}

	public void setBScoreArr(List<Map<String, Object>> bScoreArr) {
		BScoreArr = bScoreArr;
	}

	public String getScoreStudentID() {
		return scoreStudentID;
	}

	public void setScoreStudentID(String scoreStudentID) {
		this.scoreStudentID = scoreStudentID;
	}

	public JSONObject getStudent_score_ranking_detail() {
		return student_score_ranking_detail;
	}

	public void setStudent_score_ranking_detail(
			JSONObject student_score_ranking_detail) {
		this.student_score_ranking_detail = student_score_ranking_detail;
	}

}
