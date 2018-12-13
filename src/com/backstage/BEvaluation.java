package com.backstage;

import java.util.List;
import java.util.Map;

import com.Dao.TeacherDao;
import com.base.BaseSupport;

public class BEvaluation extends BaseSupport {

	//后台获取所有老师的评教各项平均分
	List<Map<String, Object>> BEvaluationArr;
	
	private String teacherID;

	public String execute() throws Exception {

		//后台 评教管理
		BEvaluationArr = TeacherDao.getBEvaluationArr();
		
		return SUCCESS;
	}
	
	/**
	 * 后台删除 某老师的评教记录
	 * @return
	 * @throws Exception
	 */
	public String BDelEvalu() throws Exception {
		
		TeacherDao.delEvalu(teacherID);
		
		return SUCCESS;
	}

	public List<Map<String, Object>> getBEvaluationArr() {
		return BEvaluationArr;
	}

	public void setBEvaluationArr(List<Map<String, Object>> bEvaluationArr) {
		BEvaluationArr = bEvaluationArr;
	}

	public String getTeacherID() {
		return teacherID;
	}

	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}

}
