package com.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.jdbc.dbutils.JdbcUtils;

public class AdminDao {

	/**
	 * 判断是否 管理员
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public static String isAdmin(String username, String password){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from admin where name=? and password=?";
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
	 * 获取所有管理员 列表
	 * @return
	 */
	public static List<Map<String, Object>> getAllAdmin(){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from admin";
		
		try {
			return jdbcUtils.findModeResult(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
