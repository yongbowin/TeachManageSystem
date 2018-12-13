package com.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.admin.Common;
import com.jdbc.dbutils.JdbcUtils;

public class MessageDao {

	/**
	 * 获取所有留言
	 * @return
	 */
	public static List<Map<String, Object>> getAllMessage(){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from message order by msg_time desc";
		
		try {
			return jdbcUtils.findModeResult(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 添加一条留言
	 * @return
	 */
	public static boolean addMessage(String username, String msg_content, String status){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into message(username,msg_text,msg_time,status) values(?, ?, ?, ?)";
		
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		params.add(msg_content);
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
	 * 删除一条 留言
	 * @param messageID
	 * @return
	 */
	public static boolean deleteMsg(String messageID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "delete from message where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(messageID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 获取 留言 详细信息
	 * @param messageID
	 * @return
	 */
	public static JSONObject getMsgDetail(String messageID) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from message where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(messageID);
		
		try {
			return jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
