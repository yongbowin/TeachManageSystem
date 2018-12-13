package com.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.Dao.StudentDao;
import com.base.BaseSupport;

public class ScoreClassify extends BaseSupport {
	
	// 学生成绩列表
	List<Map<String, Object>> BScoreArr;
	List<Map<String, Object>> ScoreGradeArr;
	
	//学生的成绩名次
	private JSONObject student_score_ranking_detail;
	
	// 当老师查询成绩时 选择的 学生 年级状态值
	private String search_selected_grade;
	
	public String execute() throws Exception {
		
		// 所有学生成绩列表
		BScoreArr = StudentDao.getAllScore();
		//从session获取学生年级的状态值
		HttpServletRequest request = ServletActionContext.getRequest();
		String search_grade_status = (String) request.getSession().getAttribute("common_grade_selected");
		// 各年级学生成绩列表
		ScoreGradeArr = StudentDao.getAllScoreGrade(search_grade_status);
		//获取学生成绩排名
		student_score_ranking_detail = StudentDao.getStuScoreRankingGradeDetail(search_grade_status);
		
		return SUCCESS;
	}
	
	/**
	 * 当老师登录时 将学生的年级信息保存在session里
	 * @return
	 * @throws Exception
	 */
	public String SearchClassifyUserGrade() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		//当老师登录 学生成绩 时 将选择的年级状态保存在session中
		String common_grade_selected = search_selected_grade;
		// 后台-用户管理页面-保存选择的用户类型
		Common.saveUserInfoGradeClassify(request, common_grade_selected);
			
		return null;
	}

	public List<Map<String, Object>> getBScoreArr() {
		return BScoreArr;
	}

	public List<Map<String, Object>> getScoreGradeArr() {
		return ScoreGradeArr;
	}

	public JSONObject getStudent_score_ranking_detail() {
		return student_score_ranking_detail;
	}

	public void setBScoreArr(List<Map<String, Object>> bScoreArr) {
		BScoreArr = bScoreArr;
	}

	public void setScoreGradeArr(List<Map<String, Object>> scoreGradeArr) {
		ScoreGradeArr = scoreGradeArr;
	}

	public void setStudent_score_ranking_detail(
			JSONObject student_score_ranking_detail) {
		this.student_score_ranking_detail = student_score_ranking_detail;
	}

	public String getSearch_selected_grade() {
		return search_selected_grade;
	}

	public void setSearch_selected_grade(String search_selected_grade) {
		this.search_selected_grade = search_selected_grade;
	}
}
