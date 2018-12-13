package com.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.admin.Common;
import com.jdbc.dbutils.JdbcUtils;

public class QuestionDao {

	/**
	 * 上传题库
	 * @param commonID
	 * @param username
	 * @param question_subject
	 * @param question_grade
	 * @param question_type
	 * @param question_difficult
	 * @param question_content
	 * @return
	 */
	public static boolean addQuestion(String commonID, String username, 
			String question_subject, String question_grade, String question_type, 
			String question_difficult, String question_content){
		
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into question(q_t_id,q_author,q_subject,q_grade,q_type,"
				+ "q_difficult,q_content,public_time) values(?, ?, ?, ?, ?, ?, ?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add(commonID);
		params.add(username);
		params.add(question_subject);
		params.add(question_grade);
		params.add(question_type);
		params.add(question_difficult);
		params.add(question_content);
		params.add(Common.getNowDate());
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 获取所有题 列表
	 * @return
	 */
	public static List<Map<String, Object>> getQuestionArr(){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from question order by public_time desc";
		
		try {
			return jdbcUtils.findModeResult(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取所有题 列表
	 * @return
	 */
	public static List<Map<String, Object>> getQuestionListArr(){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * "
				+ "from question_list "
				+ "group by test_paper_name";
		
		try {
			return jdbcUtils.findModeResult(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除 某道题
	 * @param questionID
	 * @return
	 */
	public static boolean delQuestion(String questionID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "delete from question where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(questionID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 编辑 题目
	 * @param questionID
	 * @param commonID
	 * @param username
	 * @param question_subject
	 * @param question_grade
	 * @param question_type
	 * @param question_difficult
	 * @param question_content
	 * @return
	 */
	public static boolean editQuestion(String questionID, String commonID, 
			String username, String question_subject, String question_grade, 
			String question_type, String question_difficult, String question_content){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "update question set q_t_id=?,q_author=?,q_subject=?,q_grade=?,"
				+ "q_type =?,q_difficult=?,q_content=?,public_time=? where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(commonID);
		params.add(username);
		params.add(question_subject);
		params.add(question_grade);
		params.add(question_type);
		params.add(question_difficult);
		params.add(question_content);
		params.add(Common.getNowDate());
		params.add(questionID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 获得某道题目的详细信息
	 * @param questionID
	 * @return
	 */
	public static JSONObject getQuestionDetailByID(String questionID) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from question where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(questionID);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 选择题、填空题 各选取5道（2分/共20分），判断题选取10道（2分/共20分），综合题选取3道（20分/共60分）
	 * @param question_subject
	 * @param question_grade
	 * @param question_type
	 * @param question_difficult
	 * @return
	 */
	public static List<Map<String, Object>> getQuestionLimitItems(
			String question_subject, String question_grade,
			String question_type, String question_difficult,
			int ques_number){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select @row := @row + 1 as row, "
				+ "q.* "
				+ "from (select * from question "
				+ "where q_subject=? and q_grade=? "
				+ "and q_difficult=? and q_type=? "
				+ "order by rand() limit ?) q, "
				+ "(SELECT @row := 0) r ";
		
		List<Object> params = new ArrayList<Object>();
		params.add(question_subject);
		params.add(question_grade);
		params.add(question_difficult);
		params.add(question_type);
		params.add(ques_number);
		
		try {
			return jdbcUtils.findModeResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static boolean saveQuesMsg(String question_id, String commonID, 
			String username, String question_subject, String question_grade, 
			String question_difficult, String q_type, String test_paper_name){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into question_list(question_id,teacher_id,author,"
				+ "subject,grade,difficult,q_l_type,build_time,test_paper_name) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		List<Object> params = new ArrayList<Object>();
		params.add(question_id);
		params.add(commonID);
		params.add(username);
		params.add(question_subject);
		params.add(question_grade);
		params.add(question_difficult);
		params.add(q_type);
		params.add(Common.getNowDate());
		params.add(test_paper_name);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 获取试卷中所有题 列表
	 * @return
	 */
	public static List<Map<String, Object>> getQuestionListDetailArr(String test_paper_name,
			String q_type){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select "
				+ "(@i:=@i+1) as row,"
				+ "question_list.*,"
				+ "question.* "
				+ "from question_list join question "
				+ "on question_list.question_id=question.ID,"
				+ "(select @i:=0) as r "
				+ "where question_list.test_paper_name=? "
				+ "and question_list.q_l_type=? "
				+ "order by question_list.question_id desc";
		
		List<Object> params = new ArrayList<Object>();
		params.add(test_paper_name);
		params.add(q_type);
		
		try {
			return jdbcUtils.findModeResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
