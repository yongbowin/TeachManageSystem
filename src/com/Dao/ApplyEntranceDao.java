package com.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.admin.Common;
import com.jdbc.dbutils.JdbcUtils;

public class ApplyEntranceDao {

	/**
	 * 小升初 报名
	 * @param apply_name
	 * @param sex_status
	 * @param apply_birthday
	 * @param apply_phone
	 * @param apply_graduate
	 * @param apply_address
	 * @param apply_password
	 * @return
	 */
	public static boolean addApplyStudent(String apply_name, String sex_status ,
			String apply_birthday, String apply_phone, String apply_graduate, 
			String apply_address, String apply_password){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into apply_entrance(apply_name,apply_sex,apply_birthday"
				+ ",apply_phone,apply_graduate,apply_address,apply_password"
				+ ",apply_time) values(?, ?, ?, ?, ?, ?, ?, ?)";
		
		List<Object> params = new ArrayList<Object>();
		params.add(apply_name);
		params.add(sex_status);
		params.add(apply_birthday);
		params.add(apply_phone);
		params.add(apply_graduate);
		params.add(apply_address);
		params.add(apply_password);
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
	 * 获取所有 小升初 报名列表
	 * @return
	 */
	public static List<Map<String, Object>> getAllApplyEntrance(){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from apply_entrance order by apply_time desc";
		
		try {
			return jdbcUtils.findModeResult(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 审核
	 * @return
	 */
	public static List<Map<String, Object>> getAllApplyEntr(String userName, String passWord){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from apply_entrance where apply_name=? and apply_password=?";
		List<Object> params = new ArrayList<Object>();
		params.add(userName);
		params.add(passWord);
		
		try {
			return jdbcUtils.findModeResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除 小升初 学生信息
	 * @param applyEntranceID
	 * @return
	 */
	public static boolean delApplyEntrance(String applyEntranceID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "delete from apply_entrance where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(applyEntranceID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 获得 小升初 学生的 详细信息
	 * @param applyEntranceID
	 * @return
	 */
	public static JSONObject getApplyEntranceDetail(String applyEntranceID) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from apply_entrance where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(applyEntranceID);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 管理员编辑 小升初 学生信息
	 * @param applyEntranceID
	 * @param apply_name
	 * @param apply_sex
	 * @param apply_birthday
	 * @param apply_phone
	 * @param apply_graduate
	 * @param apply_address
	 * @return
	 */
	public static boolean editApplyEntranceDetail(String applyEntranceID, String apply_name, 
			String apply_sex, String apply_birthday, String apply_phone, String apply_graduate,
			String apply_address){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "update apply_entrance set apply_name=?,apply_sex=?,apply_birthday=?,apply_phone=?,"
				+ "apply_graduate =?,apply_address=? where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(apply_name);
		params.add(apply_sex);
		params.add(apply_birthday);
		params.add(apply_phone);
		params.add(apply_graduate);
		params.add(apply_address);
		params.add(applyEntranceID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	public static boolean editApplyIn(String applyStuID, String apply_status){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "update apply_entrance set apply_status=? where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(apply_status);
		params.add(applyStuID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
