package com.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.admin.Common;
import com.jdbc.dbutils.JdbcUtils;

public class TeacherDao {

	/**
	 * 判断是否 老师
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public static String isTeacher(String username, String password){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from teacher where t_name=? and t_password=?";
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
	 * 老师注册
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public static boolean addTeacher(String username, String password, String status){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into teacher(t_name,t_password,t_register_time,t_status) values(?, ?, ?, ?)";
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
	 * 获取所有老师 列表
	 * @return
	 */
	public static List<Map<String, Object>> getAllTeacher(){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from teacher order by t_register_time desc";
		
		try {
			return jdbcUtils.findModeResult(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取老师 详细信息
	 * 
	 * @return
	 */
	public static JSONObject getTeacherDetail(String teacherID) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from teacher where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(teacherID);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 修改 老师信息
	 * @param teacherID
	 * @param t_name
	 * @param t_sex
	 * @param t_number
	 * @param t_title
	 * @param t_subject
	 * @param t_phone
	 * @param t_birthday
	 * @return
	 */
	public static boolean editTeacherDetail(String teacherID, String t_name, 
			String t_sex, String t_number, String t_title, String t_subject,
			String t_phone, String t_birthday){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "update teacher set t_name=?,t_sex=?,t_number=?,t_title=?,"
				+ "t_subject =?,t_phone=?,t_birthday=? where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(t_name);
		params.add(t_sex);
		params.add(t_number);
		params.add(t_title);
		params.add(t_subject);
		params.add(t_phone);
		params.add(t_birthday);
		params.add(teacherID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 删除 老师
	 * @param teacherID
	 * @return
	 */
	public static boolean deleteTeacher(String teacherID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "delete from teacher where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(teacherID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 学生评教 添加老师的得分
	 * 
	 * @param teacherID
	 * @param prepare_ability
	 * @param teach_ability
	 * @param professional_knowledge
	 * @param practical_ability
	 * @param task_ability
	 * @param course_satisfaction
	 * @param comprehensive_ability
	 * @param total_score
	 * @param stu_id
	 * @param aver_score
	 * @return
	 */
	public static boolean addEvaluationScore(String teacherID, String prepare_ability, 
			String teach_ability, String professional_knowledge, String practical_ability,
			String task_ability, String course_satisfaction, String comprehensive_ability,
			double total_score, String stu_id, double aver_score){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into teach_evaluation(teacher_id,prepare_ability,teach_ability,"
				+ "professional_knowledge,practical_ability,task_ability,course_satisfaction,"
				+ "comprehensive_ability,total_score,stu_id,aver_score) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add(teacherID);
		params.add(prepare_ability);
		params.add(teach_ability);
		params.add(professional_knowledge);
		params.add(practical_ability);
		params.add(task_ability);
		params.add(course_satisfaction);
		params.add(comprehensive_ability);
		params.add(total_score);
		params.add(stu_id);
		params.add(aver_score);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 获取某学生已经评价过的所有老师 列表
	 * @return
	 */
	public static List<Map<String, Object>> getAllTeacherEvaluationById(String studentID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from teach_evaluation where stu_id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(studentID);
		
		try {
			return jdbcUtils.findModeResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取老师评教的结果 详情
	 * @return
	 */
	public static JSONObject getTeacherEvaluationDetailByID(String teacherID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select "
				+ "te.teacher_id,"
				+ "t.t_name,"
				+ "t.t_number,"
				+ "t.t_grade,"
				+ "t.t_subject,"
				+ "cast(avg(te.professional_knowledge) as decimal(5,2)) as professional,"
				+ "cast(avg(te.prepare_ability) as decimal(5,2)) as prepare,"
				+ "cast(avg(te.teach_ability) as decimal(5,2)) as teach,"
				+ "cast(avg(te.practical_ability) as decimal(5,2)) as practical,"
				+ "cast(avg(te.task_ability) as decimal(5,2)) as task,"
				+ "cast(avg(te.course_satisfaction) as decimal(5,2)) as course,"
				+ "cast(avg(te.comprehensive_ability) as decimal(5,2)) as comprehensive,"
				+ "cast(avg(te.total_score/7.0) as decimal(5,2)) as total_avg "
				+ "from teach_evaluation te join teacher t on te.teacher_id=t.ID "
				+ "where te.teacher_id=? "
				+ "group by te.teacher_id=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(teacherID);
		params.add(teacherID);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 后台 评教管理 获取老师所有评教结果 平均分和总成绩平均分
	 * 
	 * @return
	 */
	public static List<Map<String, Object>> getBEvaluationArr(){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select "
				+ "te.teacher_id,"
				+ "t.t_name,"
				+ "t.t_number,"
				+ "t.t_grade,"
				+ "t.t_subject,"
				+ "cast(avg(te.professional_knowledge) as decimal(5,2)) as professional,"
				+ "cast(avg(te.prepare_ability) as decimal(5,2)) as prepare,"
				+ "cast(avg(te.teach_ability) as decimal(5,2)) as teach,"
				+ "cast(avg(te.practical_ability) as decimal(5,2)) as practical,"
				+ "cast(avg(te.task_ability) as decimal(5,2)) as task,"
				+ "cast(avg(te.course_satisfaction) as decimal(5,2)) as course,"
				+ "cast(avg(te.comprehensive_ability) as decimal(5,2)) as comprehensive,"
				+ "cast(avg(te.total_score/7.0) as decimal(5,2)) as total_avg "
				+ "from teach_evaluation te join teacher t on te.teacher_id=t.ID "
				+ "group by te.teacher_id";
		
		try {
			return jdbcUtils.findModeResult(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static boolean delEvalu(String teacherID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "delete from teach_evaluation where teacher_id=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(teacherID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
