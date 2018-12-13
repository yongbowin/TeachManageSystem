package com.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.admin.Common;
import com.jdbc.dbutils.JdbcUtils;

public class StudentDao {

	/**
	 * 判断是否 学生
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public static String isStudent(String username, String password){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from student where s_name=? and s_password=?";
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		params.add(password);
		
		try {
			JSONObject result = jdbcUtils.findSimpleJSONResult(sql, params);
			if(null != result){
				return result.getString("ID");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 学生注册
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public static boolean addStudent(String username, String password ,String status){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into student(s_name,s_password,s_register_time,s_status) values(?, ?, ?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		params.add(password);
		params.add(Common.getNowDate());
		params.add(status);
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 获取所有学生 列表
	 * @return
	 */
	public static List<Map<String, Object>> getAllStudent(){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from student order by s_register_time desc";
		
		try {
			return jdbcUtils.findModeResult(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据学生ID，获取该生的学号
	 * @param commonID
	 * @return
	 */
	public static JSONObject getStudentByID(String commonID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();

		String sql = "select * from student where ID=?";

		List<Object> params = new ArrayList<Object>();
		params.add(commonID);

		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取学生 学籍信息 详情
	 * 
	 * @return
	 */
	public static JSONObject getStudentDetail(String studentID) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from student where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(studentID);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据学生学号 查询学生年级
	 * 
	 * @return
	 */
	public static JSONObject getStudentGrade(String s_number) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from student where s_number=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(s_number);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 修改 学生 学籍信息
	 * @param studentID
	 * @param s_name
	 * @param s_sex
	 * @param s_number
	 * @param s_birthday
	 * @param s_enter
	 * @param s_grade
	 * @param s_phone
	 * @param s_graduate
	 * @param s_address
	 * @return
	 */
	public static boolean editStudentDetail(String studentID, String s_name, 
			String s_sex, String s_number, String s_birthday, String s_enter,
			String s_grade, String s_phone, String s_graduate, String s_address){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "update student set s_name=?,s_sex=?,s_number=?,s_birthday=?,"
				+ "s_enter =?,s_grade=?,s_phone=?,s_graduate=?,s_address=? where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(s_name);
		params.add(s_sex);
		params.add(s_number);
		params.add(s_birthday);
		params.add(s_enter);
		params.add(s_grade);
		params.add(s_phone);
		params.add(s_graduate);
		params.add(s_address);
		params.add(studentID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 删除 学生
	 * @param studentID
	 * @return
	 */
	public static boolean deleteStudent(String studentID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "delete from student where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(studentID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 录入 学生成绩
	 * @param s_number
	 * @param chinese_course
	 * @param math_course
	 * @param english_course
	 * @param physics_course
	 * @param chemistry_course
	 * @return
	 */
	public static boolean doAddScore(String s_number, String chinese_course ,
			String math_course, String english_course, String physics_course, 
			String chemistry_course, String sum, String s_grade, String s_name){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into score(student_id,chinese_course,math_course,"
				+ "english_course,physics_course,chemistry_course,sum,sc_grade,name) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		List<Object> params = new ArrayList<Object>();
		params.add(s_number);
		params.add(chinese_course);
		params.add(math_course);
		params.add(english_course);
		params.add(physics_course);
		params.add(chemistry_course);
		params.add(sum);
		params.add(s_grade);
		params.add(s_name);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 获取所有 学生成绩 列表
	 * @return
	 */
	public static List<Map<String, Object>> getAllScore(){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from student s join score sc on s.s_number = sc.student_id order by sc.sum desc";
//		String sql = "select A.*,@rank:=@rank+1 as pm from score A group by A.sc_grade ,(SELECT @rank:=0) order by A.sum desc";
		
		try {
			return jdbcUtils.findModeResult(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取所有 学生成绩 列表 以及 成绩排名
	 * @return
	 */
	public static List<Map<String, Object>> getAllScoreGrade(String search_selected_grade){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select "
				+ "b.name,"
				+ "b.student_id,"
				+ "b.sc_grade,"
				+ "b.chinese_course,"
				+ "b.math_course,"
				+ "b.english_course,"
				+ "b.physics_course,"
				+ "b.chemistry_course,"
				+ "b.sum,"
				+ "(select count(1) + 1 from score a where a.sum > b.sum and a.sc_grade=?) sum_pm "
				+ "from score b "
				+ "where b.sc_grade=? "
				+ "order by b.sum desc";
		
		List<Object> params = new ArrayList<Object>();
		params.add(search_selected_grade);
		params.add(search_selected_grade);
		
		try {
			return jdbcUtils.findModeResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 在表student表中判断是否有已经存在的学号
	 * @param s_number
	 * @return
	 */
	public static boolean isExistSNumber(String s_number){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from student where s_number=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(s_number);
		
		try {
			return jdbcUtils.findModeResult(sql, params).size() > 0;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 在表score中判断是否存在 该生的成绩
	 * @param s_number
	 * @return
	 */
	public static boolean isExistStudentID(String s_number){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from score where student_id=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(s_number);
		
		try {
			return jdbcUtils.findModeResult(sql, params).size() > 0;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 从score表中删除 学生成绩
	 * @param scoreStudentID
	 * @return
	 */
	public static boolean deleteStudentScore(String scoreStudentID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "delete from score where student_id=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(scoreStudentID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 获取 学生成绩 详细信息
	 * @param scoreStudentID
	 * @return
	 */
	public static JSONObject getStuScoreDetail(String scoreStudentID) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from score where student_id=?";
//		String sql = "select chinese_course, math_course, english_course, "
//				+ "physics_course, chemistry_course, student_id, sum,"
//				+ "ROW_NUMBER() over(order by sum) as ranking from score where student_id=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(scoreStudentID);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取 学生成绩名次
	 * @param scoreStudentID
	 * @return
	 */
	public static JSONObject getStuScoreRankingDetail(String scoreStudentID, String s_grade) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
//		获取学生名次 pm
//		String sql = "select b.name,b.sum,sc_grade,(select count(1) + 1 from score a where a.sum > b.sum and "
//				+ "a.sc_grade=?) pm from score b where b.student_id=? order by pm";
		String sql = "select "
				+ "b.student_id,"
				+ "b.name,"
				+ "b.sum,"
				+ "sc_grade,"
				+ "(select count(1) + 1 from score a where a.sum > b.sum and a.sc_grade=?) sum_pm,"
				+ "(select count(1) + 1 from score a where a.chinese_course > b.chinese_course and a.sc_grade=?) chinese_pm,"
				+ "(select count(1) + 1 from score a where a.math_course > b.math_course and a.sc_grade=?) math_pm,"
				+ "(select count(1) + 1 from score a where a.english_course > b.english_course and a.sc_grade=?) english_pm,"
				+ "(select count(1) + 1 from score a where a.physics_course > b.physics_course and a.sc_grade=?) physics_pm,"
				+ "(select count(1) + 1 from score a where a.chemistry_course > b.chemistry_course and a.sc_grade=?) chemistry_pm "
				+ "from score b "
				+ "where b.sc_grade=? and b.student_id=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(s_grade);
		params.add(s_grade);
		params.add(s_grade);
		params.add(s_grade);
		params.add(s_grade);
		params.add(s_grade);
		params.add(s_grade);
		params.add(scoreStudentID);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取某个年级的 所有学生成绩 名次
	 * @param scoreStudentID
	 * @return
	 */
	public static JSONObject getStuScoreRankingGradeDetail(String s_grade) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
//		获取学生名次 pm
//		String sql = "select b.name,b.sum,sc_grade,(select count(1) + 1 from score a where a.sum > b.sum and "
//				+ "a.sc_grade=?) pm from score b order by pm";
		String sql = "select "
				+ "b.student_id,"
				+ "b.name,"
				+ "b.sum,"
				+ "sc_grade,"
				+ "(select count(1) + 1 from score a where a.sum > b.sum and a.sc_grade=?) sum_pm,"
				+ "(select count(1) + 1 from score a where a.chinese_course > b.chinese_course and a.sc_grade=?) chinese_pm,"
				+ "(select count(1) + 1 from score a where a.math_course > b.math_course and a.sc_grade=?) math_pm,"
				+ "(select count(1) + 1 from score a where a.english_course > b.english_course and a.sc_grade=?) english_pm,"
				+ "(select count(1) + 1 from score a where a.physics_course > b.physics_course and a.sc_grade=?) physics_pm,"
				+ "(select count(1) + 1 from score a where a.chemistry_course > b.chemistry_course and a.sc_grade=?) chemistry_pm "
				+ "from score b "
				+ "where b.sc_grade=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(s_grade);
		params.add(s_grade);
		params.add(s_grade);
		params.add(s_grade);
		params.add(s_grade);
		params.add(s_grade);
		params.add(s_grade);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 修改 学生成绩 信息
	 * @param scoreStudentID
	 * @param chinese_course
	 * @param math_course
	 * @param english_course
	 * @param physics_course
	 * @param chemistry_course
	 * @return
	 */
	public static boolean editStuScoreDetail(String scoreStudentID, String chinese_course, 
			String math_course, String english_course, String physics_course, 
			String chemistry_course, String sum_score){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "update score set chinese_course=?,math_course=?,english_course=?,"
				+ "physics_course=?,chemistry_course=?,sum=? where student_id=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(chinese_course);
		params.add(math_course);
		params.add(english_course);
		params.add(physics_course);
		params.add(chemistry_course);
		params.add(sum_score);
		params.add(scoreStudentID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
