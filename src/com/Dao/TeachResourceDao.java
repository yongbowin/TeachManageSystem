package com.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.admin.Common;
import com.jdbc.dbutils.JdbcUtils;

public class TeachResourceDao {

	/**
	 * 资料上传
	 * @param res_grade
	 * @param res_subject
	 * @param res_type
	 * @param resFilePath
	 * @param file_up_author
	 * @param file_name
	 * @param commonID
	 * @return
	 */
	public static boolean addTeachResource(String res_grade, String res_subject, 
			String res_type, String resFilePath, String file_up_author, String file_name, 
			String commonID, String res_desc){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into teach_resource(file_grade,file_subject,file_type,file_path,"
				+ "file_up_time,file_up_author,file_name,teacher_id,file_desc) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add(res_grade);
		params.add(res_subject);
		params.add(res_type);
		params.add(resFilePath);
		params.add(Common.getNowDate());
		params.add(file_up_author);
		params.add(file_name);
		params.add(commonID);
		params.add(res_desc);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 得到所有上传的文件
	 * @return
	 */
	public static List<Map<String, Object>> getAllResFile(){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from teach_resource order by file_up_time desc";
		
		try {
			return jdbcUtils.findModeResult(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除某个文件
	 * @param fileID
	 * @return
	 */
	public static boolean deleteResFileByID(String fileID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "delete from teach_resource where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(fileID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 老师 布置作业
	 * @param homework_subject
	 * @param homework_grade
	 * @param homework_author
	 * @param homework_start_time
	 * @param homework_end_time
	 * @param homework_title
	 * @param commonID
	 * @return
	 */
	public static boolean addArrangeHomework(String homework_subject, String homework_grade, 
			String homework_author, String homework_start_time, String homework_end_time, 
			String homework_title, String commonID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into homework(hw_subject,hw_grade,teacher_name,hw_start_time,"
				+ "hw_end_time,hw_title,teacher_id,public_time) values(?, ?, ?, ?, ?, ?, ?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add(homework_subject);
		params.add(homework_grade);
		params.add(homework_author);
		params.add(homework_start_time);
		params.add(homework_end_time);
		params.add(homework_title);
		params.add(commonID);
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
	 * 得到 所有已经布置的 作业 列表
	 * @return
	 */
	public static List<Map<String, Object>> getAllArrangeHomework(){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from homework order by public_time desc";
		
		try {
			return jdbcUtils.findModeResult(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 得到 该老师的 作业布置 列表
	 * @return
	 */
	public static List<Map<String, Object>> getAllArrangeHomeworkByID(String commonID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from homework where teacher_id=? order by public_time desc";
		
		List<Object> params = new ArrayList<Object>();
		params.add(commonID);
		
		try {
			return jdbcUtils.findModeResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除 作业
	 * @param hwID
	 * @return
	 */
	public static boolean deleteHwByID(String hwID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "delete from homework where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(hwID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	//getHwByCondition
	public static List<Map<String, Object>> getHwByCondition(String hw_grade_val, 
			String hw_subject_val){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from homework where hw_grade=? and hw_subject=? order by public_time desc";
		
		List<Object> params = new ArrayList<Object>();
		params.add(hw_grade_val);
		params.add(hw_subject_val);
		
		try {
			return jdbcUtils.findModeResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取作业 详细信息
	 * 
	 * @return
	 */
	public static JSONObject getHWDetail(String hwID) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from homework where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(hwID);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 学生提交作业
	 * @param student_id
	 * @param HWID
	 * @param submit_status
	 * @param hw_answer
	 * @return
	 */
	public static boolean stuHWSubmit(String student_id, String username, 
			String HWID, String hw_answer){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into homework_submit(student_id,student_name,homework_id,"
				+ "submit_time,answer) values(?, ?, ?, ?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add(student_id);
		params.add(username);
		params.add(HWID);
		params.add(Common.getNowDate());
		params.add(hw_answer);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 获取作业 详细信息
	 * 
	 * @return
	 */
	public static JSONObject getAnswerDetail(String common_ID, String hwID) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from homework_submit where student_id=? "
				+ "and homework_id=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(common_ID);
		params.add(hwID);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
