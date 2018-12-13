package com.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.admin.Common;
import com.jdbc.dbutils.JdbcUtils;

public class NewsNoticeRulesDao {

	/**
	 * 获取对应的新闻、 公告、规章制度 列表
	 * @return
	 */
	public static List<Map<String, Object>> getAllNewsNoticeRulesByID(String type){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from article where type=?";
		List<Object> params = new ArrayList<Object>();
		params.add(type);
		
		try {
			return jdbcUtils.findModeResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取 校园新闻 详细信息
	 * @param newsID
	 * @return
	 */
	public static JSONObject getNewsNoticeRulesDetail(String commonID) {
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "select * from article where ID=?";
		
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
	 * 修改 首页新闻等的 信息
	 * @param scoreStudentID
	 * @param chinese_course
	 * @param math_course
	 * @param english_course
	 * @param physics_course
	 * @param chemistry_course
	 * @return
	 */
	public static boolean editNewsNoticeRulesDetail(String commonID, String title, 
			String author, String content){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "update article set title=?,author=?,content=? where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(title);
		params.add(author);
		params.add(content);
		params.add(commonID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 从article表中删除 一条记录
	 * @param commonID
	 * @return
	 */
	public static boolean delNewsNoticeRules(String commonID){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "delete from article where ID=?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(commonID);
		
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 添加一条 新闻公告
	 * @param title
	 * @param author
	 * @param content
	 * @param type
	 * @return
	 */
	public static boolean addNewsNoticeRules(String title, String author ,
			String content, String type){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		String sql = "insert into article(title,author,content,public_time,type) values(?, ?, ?, ?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add(title);
		params.add(author);
		params.add(content);
		params.add(Common.getNowDate());
		params.add(type);
		try {
			return jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
