package com.admin;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.Dao.TeacherDao;
import com.base.BaseSupport;

public class SEvaluation extends BaseSupport {

	// 老师 列表
	List<Map<String, Object>> BTeacherArr;
	// 老师 评价详细信息
	JSONObject TeacherEvaluaByIDDetail;
	// 老师 列表
	List<Map<String, Object>> teacherEvaluationStatusArr;
	
	//获取老师的teacherID
	private String teacherID;
	//获取老师的姓名
	private String teacherName;
	
	public String execute() throws Exception {
		
		// 后台获取所有老师
		BTeacherArr = TeacherDao.getAllTeacher();
		
		return SUCCESS;
	}
	
	public String DoEvaluation() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		//备课能力 
		String radiobutton1_val = request.getParameter("radiobutton1");
		//授课能力 
		String radiobutton2_val = request.getParameter("radiobutton2");
		//专业知识 
		String radiobutton3_val = request.getParameter("radiobutton3");
		//实践教授能力 
		String radiobutton4_val = request.getParameter("radiobutton4");
		//作业布置能力 
		String radiobutton5_val = request.getParameter("radiobutton5");
		//课程满意度 
		String radiobutton6_val = request.getParameter("radiobutton6");
		//综合能力
		String radiobutton7_val = request.getParameter("radiobutton7");
		
		//当评价的所有值都不为空的时候，继续下一步操作，否则，返回错误提示！
		if(radiobutton1_val != null && radiobutton2_val != null && 
				radiobutton3_val != null && radiobutton4_val != null && 
				radiobutton5_val != null && radiobutton6_val != null &&
				radiobutton7_val != null){
//			successMessage = "编辑成功！";	
			
			/**
			 * 这里设定每个等级对应的分值
			 * 1.非常满意：100分 ==> 状态 0
			 * 2.比较满意：90分 ==> 状态 1
			 * 3.满意：80分 ==> 状态 2
			 * 4.及格：60分 ==> 状态 3
			 * 5.不及格：50分 ==> 状态 4
			 * 注意：每道题目的分值权重设置为相同
			 */
			//计算总评分
			double teacher_sum_score = Double.parseDouble(radiobutton1_val) 
					+ Double.parseDouble(radiobutton2_val) 
					+ Double.parseDouble(radiobutton3_val) 
					+ Double.parseDouble(radiobutton4_val) 
					+ Double.parseDouble(radiobutton5_val) 
					+ Double.parseDouble(radiobutton6_val)
					+ Double.parseDouble(radiobutton7_val);
			//计算平均分
			double teacher_average_score = teacher_sum_score / 7.0;
			
			//获取学生ID
			String commonID = (String) request.getSession().getAttribute("commonID");
			
			//将学生对老师的评价信息 添加到数据库表teach_evaluation中
			TeacherDao.addEvaluationScore(teacherID, radiobutton1_val, 
					radiobutton2_val, radiobutton3_val, radiobutton4_val, 
					radiobutton5_val, radiobutton6_val, radiobutton7_val, 
					teacher_sum_score, commonID, teacher_average_score);
			
		} else {
			errorMessage = "提交失败，请将所有的题目全部勾选！";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 检查该生现在已经评价了几位老师，分别取出他们的ID，在前台学生页面将评教状态置为 “已评教”
	 * @return
	 * @throws Exception
	 */
	public String CheckEvaluaTionStatus() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		//获取该生的ID
		String commonID = (String) request.getSession().getAttribute("commonID");
		//根据commonID在teach_evaluation表中查询该生现在一共评价了几位老师
		teacherEvaluationStatusArr = TeacherDao.getAllTeacherEvaluationById(commonID);

		//从List对象中取出该生已经评价过的 老师的 ID
		String[] evalua_status_id = new String[10];
		for(int i=0; i<teacherEvaluationStatusArr.size(); i++){
			
			evalua_status_id[i] = teacherEvaluationStatusArr.get(i).get("teacher_id").toString();
		}
		
		PrintWriter outer = response.getWriter();
		outer.write(JSONArray.fromObject(evalua_status_id).toString());
		
		return null;
	}
	
	/**
	 * 前台 当老师登录时 获取老师评价详细信息
	 * @return
	 * @throws Exception
	 */
	public String TeacherCheckEvaluation() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取当前老师的ID
		String commonID = (String) request.getSession().getAttribute("commonID");
		
		//获取该老师所有已经评价的分数列表
		TeacherEvaluaByIDDetail = TeacherDao.getTeacherEvaluationDetailByID(commonID);
		
		return SUCCESS;
	}

	public List<Map<String, Object>> getBTeacherArr() {
		return BTeacherArr;
	}

	public void setBTeacherArr(List<Map<String, Object>> bTeacherArr) {
		BTeacherArr = bTeacherArr;
	}

	public String getTeacherID() {
		return teacherID;
	}

	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public List<Map<String, Object>> getTeacherEvaluationStatusArr() {
		return teacherEvaluationStatusArr;
	}

	public void setTeacherEvaluationStatusArr(
			List<Map<String, Object>> teacherEvaluationStatusArr) {
		this.teacherEvaluationStatusArr = teacherEvaluationStatusArr;
	}

	public JSONObject getTeacherEvaluaByIDDetail() {
		return TeacherEvaluaByIDDetail;
	}

	public void setTeacherEvaluaByIDDetail(JSONObject teacherEvaluaByIDDetail) {
		TeacherEvaluaByIDDetail = teacherEvaluaByIDDetail;
	}

}
