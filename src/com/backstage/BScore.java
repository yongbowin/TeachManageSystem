package com.backstage;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.Dao.StudentDao;
import com.base.BaseSupport;

public class BScore extends BaseSupport {

	// 学生成绩 详情
	private JSONObject student_score_detail;

	// 学生成绩列表
	List<Map<String, Object>> BScoreArr;

	private String s_number;
	private String chinese_course;
	private String math_course;
	private String english_course;
	private String physics_course;
	private String chemistry_course;

	// 在score表中 外键student_id字段
	private String scoreStudentID;

	public String execute() throws Exception {

		// 显示所有的 学生成绩
		BScoreArr = StudentDao.getAllScore();
		
		return SUCCESS;
	}

	/**
	 * 录入学生成绩
	 * 
	 * @return
	 * @throws Exception
	 */
	public String AddScore() throws Exception {

		//添加学生成绩的时候，判断student表中是否存在 输入的学号 ；并且判断该生是否存在成绩
		if (StudentDao.isExistSNumber(s_number)
				&& !StudentDao.isExistStudentID(s_number)) {
			//求总成绩
			int sum = Integer.parseInt(chinese_course) + Integer.parseInt(math_course)
					+ Integer.parseInt(english_course) + Integer.parseInt(physics_course)
					+ Integer.parseInt(chemistry_course);
			String sum_score = String.valueOf(sum);
			//根据s_number在表student中查询学生 年级s_grade
			JSONObject getStuGrade = StudentDao.getStudentGrade(s_number);
			String s_grade = (String) getStuGrade.get("s_grade");
			//获取学生姓名
			String s_name = (String) getStuGrade.get("s_name");
			// 添加学生成绩
			if (StudentDao.doAddScore(s_number, chinese_course, math_course,
					english_course, physics_course, chemistry_course, sum_score, s_grade, s_name)) {
				
				successMessage = "录入成功";
			} else {
				errorMessage = "录入失败，请重新录入！";
			}
		} 
		//添加学生成绩的时候，判断score表中是否存在该生的成绩
		else if (StudentDao.isExistStudentID(s_number)) {
			errorMessage = "已经存在该生的成绩！";
		} else {
			errorMessage = "不存在该学号，请重新录入！";
		}

		return SUCCESS;
	}

	/**
	 * 删除 学生成绩
	 * 
	 * @return
	 * @throws Exception
	 */
	public String DeleteStudentScore() throws Exception {

		// 删除学生成绩
		StudentDao.deleteStudentScore(scoreStudentID);

		return SUCCESS;
	}

	/**
	 * 获取学生成绩 详细信息
	 * @return
	 * @throws Exception
	 */
	public String GetStudentScoreDetail() throws Exception {

		//获取 学生成绩 详细信息
		student_score_detail = StudentDao.getStuScoreDetail(scoreStudentID);
		
		return SUCCESS;
	}
	
	/**
	 * 确认修改 学生成绩
	 * @return
	 * @throws Exception
	 */
	public String DoEditStudentScore() throws Exception {
		
		//求总成绩
		int sum = Integer.parseInt(chinese_course) + Integer.parseInt(math_course)
				+ Integer.parseInt(english_course) + Integer.parseInt(physics_course)
				+ Integer.parseInt(chemistry_course);
		String sum_score = String.valueOf(sum);

		if (StudentDao.editStuScoreDetail(scoreStudentID, chinese_course, math_course,
				english_course, physics_course, chemistry_course, sum_score)) {
			successMessage = "编辑成功！";
		} else {
			errorMessage = "编辑失败！";
		}
		
		//获取 学生成绩 详细信息
		student_score_detail = StudentDao.getStuScoreDetail(scoreStudentID);
		
		return SUCCESS;
	}

	public String getS_number() {
		return s_number;
	}

	public String getChinese_course() {
		return chinese_course;
	}

	public String getMath_course() {
		return math_course;
	}

	public String getEnglish_course() {
		return english_course;
	}

	public String getPhysics_course() {
		return physics_course;
	}

	public String getChemistry_course() {
		return chemistry_course;
	}

	public void setS_number(String s_number) {
		this.s_number = s_number;
	}

	public void setChinese_course(String chinese_course) {
		this.chinese_course = chinese_course;
	}

	public void setMath_course(String math_course) {
		this.math_course = math_course;
	}

	public void setEnglish_course(String english_course) {
		this.english_course = english_course;
	}

	public void setPhysics_course(String physics_course) {
		this.physics_course = physics_course;
	}

	public void setChemistry_course(String chemistry_course) {
		this.chemistry_course = chemistry_course;
	}

	public JSONObject getStudent_score_detail() {
		return student_score_detail;
	}

	public void setStudent_score_detail(JSONObject student_score_detail) {
		this.student_score_detail = student_score_detail;
	}

	public List<Map<String, Object>> getBScoreArr() {
		return BScoreArr;
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

}
