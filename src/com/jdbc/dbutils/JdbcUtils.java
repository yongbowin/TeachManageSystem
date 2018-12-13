package com.jdbc.dbutils;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.mysql.jdbc.Statement;
import net.sf.json.JSONObject;


public class JdbcUtils {
	 //数据库用户名  
    private static final String USERNAME = "root";  
    //数据库密码  
    private static final String PASSWORD = "";  
    //驱动信息   
    private static final String DRIVER = "com.mysql.jdbc.Driver";  
    //数据库地址  
	private static final String URL = "jdbc:mysql://localhost:3306/" + "teach_manage" + "?user=" + USERNAME + "&password=" + PASSWORD + "&useUnicode=true&characterEncoding=utf-8";
	private Connection connection;
	private PreparedStatement pstmt;
	private ResultSet resultSet;
	public JdbcUtils() {
		// TODO Auto-generated constructor stub
		try{
			Class.forName(DRIVER);

		}catch(Exception e){

		}
	}

	  /** 
     * 获得数据库的连接 
     * @return 
     */  
	public Connection getConnection(){
		try {
//			Properties properties = new Properties() ;  
//	        properties.setProperty("charSet", "UTF-8") ;
			connection = DriverManager.getConnection(URL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}


	   /** 
     * 增加、删除、改 
     * @param sql 
     * @param params 
     * @return 
     * @throws SQLException 
     */ 
	public boolean updateByPreparedStatement(String sql, List<Object>params)throws SQLException{
		boolean flag = false;
		int result = -1;
		pstmt = connection.prepareStatement(sql);
		int index = 1;
		if(params != null && !params.isEmpty()){
			for(int i=0; i<params.size(); i++){
				pstmt.setObject(index++, params.get(i));
			}
		}
		result = pstmt.executeUpdate();
		flag = result > 0 ? true : false;
		return flag;
	}

    /** 
     * 查询单条记录 
     * @param sql 
     * @param params 
     * @return 
     * @throws SQLException 
     */ 
	public Map<String, Object> findSimpleResult(String sql, List<Object> params) throws SQLException{
		Map<String, Object> map = new HashMap<String, Object>();
		int index  = 1;
		pstmt = connection.prepareStatement(sql);
		if(params != null && !params.isEmpty()){
			for(int i=0; i<params.size(); i++){
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();//返回查询结果 
		ResultSetMetaData metaData = resultSet.getMetaData();
		int col_len = metaData.getColumnCount();
		while(resultSet.next()){
			for(int i=0; i<col_len; i++ ){
				String cols_name = metaData.getColumnName(i+1);
				Object cols_value = resultSet.getObject(cols_name);
				if(cols_value == null){
					cols_value = "";
				}
				map.put(cols_name, cols_value);
			}
		}
		return map;
	}
	
	/**
	 * 返回JSON形式，单条记录查询
	 * @param sql
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public JSONObject findSimpleJSONResult(String sql, List<Object> params) throws Exception{
		return JSONObject.fromObject(this.findSimpleResult(sql, params));
	}

    /**查询多条记录 
     * @param sql 
     * @param params 
     * @return 
     * @throws SQLException 
     */  
	public List<Map<String, Object>> findModeResult(String sql, List<Object> params) throws SQLException{
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		if(params != null && !params.isEmpty()){
			for(int i = 0; i<params.size(); i++){
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();
		ResultSetMetaData metaData = resultSet.getMetaData();
		int cols_len = metaData.getColumnCount();
		while(resultSet.next()){
			Map<String, Object> map = new HashMap<String, Object>();
			for(int i=0; i<cols_len; i++){
				String cols_name = metaData.getColumnName(i+1);
				Object cols_value = resultSet.getObject(cols_name);
				if(cols_value == null){
					cols_value = "";
				}
				map.put(cols_name, cols_value);
			}
			list.add(map);
		}

		return list;
	}

    /**通过反射机制查询单条记录 
     * @param sql 
     * @param params 
     * @param cls 
     * @return 
     * @throws Exception 
     */ 
	public <T> T findSimpleRefResult(String sql, List<Object> params,
			Class<T> cls )throws Exception{
		T resultObject = null;
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		if(params != null && !params.isEmpty()){
			for(int i = 0; i<params.size(); i++){
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();
		ResultSetMetaData metaData  = resultSet.getMetaData();
		int cols_len = metaData.getColumnCount();
		while(resultSet.next()){
			//通过反射机制创建一个实例 
			resultObject = cls.newInstance();
			for(int i = 0; i<cols_len; i++){
				String cols_name = metaData.getColumnName(i+1);
				Object cols_value = resultSet.getObject(cols_name);
				if(cols_value == null){
					cols_value = "";
				}
				Field field = cls.getDeclaredField(cols_name);
				field.setAccessible(true); //打开javabean的访问权限  
				field.set(resultObject, cols_value);
			}
		}
		return resultObject;

	}

    /**通过反射机制查询多条记录 
     * @param sql  
     * @param params 
     * @param cls 
     * @return 
     * @throws Exception 
     */ 
	public <T> List<T> findMoreRefResult(String sql, List<Object> params,
			Class<T> cls )throws Exception {
		List<T> list = new ArrayList<T>();
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		if(params != null && !params.isEmpty()){
			for(int i = 0; i<params.size(); i++){
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();
		ResultSetMetaData metaData  = resultSet.getMetaData();
		int cols_len = metaData.getColumnCount();
		while(resultSet.next()){
			   //通过反射机制创建一个实例
			T resultObject = cls.newInstance();
			for(int i = 0; i<cols_len; i++){
				String cols_name = metaData.getColumnName(i+1);
				Object cols_value = resultSet.getObject(cols_name);
				if(cols_value == null){
					cols_value = "";
				}
				Field field = cls.getDeclaredField(cols_name);
				field.setAccessible(true); //打开javabean的访问权限
				field.set(resultObject, cols_value);
			}
			list.add(resultObject);
		}
		return list;
	}

    /** 
     * 释放数据库连接 
     */
	public void releaseConn(){
		if(resultSet != null){
			try{
				resultSet.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 获取列表
	 * @param sql
	 * @param params
	 * @return
	 */
	public static List<Map<String, Object>> getList(String sql, List<Object> params){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		try {
			return  jdbcUtils.findModeResult(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 获取单条记录
	 * @param sql
	 * @param params
	 * @return
	 */
	public static JSONObject getOneRecord(String sql, List<Object> params){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		try {
			return  jdbcUtils.findSimpleJSONResult(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 执行不返回列表数据
	 * @param sql
	 * @param params
	 * @return
	 */
	public static boolean execute(String sql, List<Object> params){
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		try {
			return  jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	/**
	 * 插入后获取自增长ID
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	public Object insertByPreparedStatement(String sql, List<Object>params) throws Exception{
		pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);  
		int index = 1;
		if(params != null && !params.isEmpty()){
			for(int i=0; i<params.size(); i++){
				pstmt.setObject(index++, params.get(i));
			}
		}
		
        pstmt.executeUpdate();  
        resultSet = pstmt.getGeneratedKeys();  
          
        Object retId = null;  
        if (resultSet.next())  
            retId = resultSet.getObject(1);  
        else  
            throw new Exception("insert or generate keys failed..");  
        return retId;  
	}
	
	/**
	 * 插入之后取刚自增长ID
	 * @param sql
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static String insertGetId(String sql, List<Object> params) {  
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();
		
		try {
			return  jdbcUtils.insertByPreparedStatement(sql, params).toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
    } 

	/**
	 * @param args
	 */
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		JdbcUtils jdbcUtils = new JdbcUtils();
		jdbcUtils.getConnection();

		/*******************增*********************/
		/*		String sql = "insert into userinfo (username, pswd) values (?, ?), (?, ?), (?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add("小明");
		params.add("123xiaoming");
		params.add("张三");
		params.add("zhangsan");
		params.add("李四");
		params.add("lisi000");
		try {
			boolean flag = jdbcUtils.updateByPreparedStatement(sql, params);
			System.out.println(flag);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/


		/*******************删*********************/
		//删除名字为张三的记录  
		/*		String sql = "delete from userinfo where username = ?";
		List<Object> params = new ArrayList<Object>();
		params.add("小明");
		boolean flag = jdbcUtils.updateByPreparedStatement(sql, params);*/

		/*******************改*********************/
		//将名字为李四的密码改了 
		/*		String sql = "update userinfo set pswd = ? where username = ? ";
		List<Object> params = new ArrayList<Object>();
		params.add("lisi88888");
		params.add("李四");
		boolean flag = jdbcUtils.updateByPreparedStatement(sql, params);
		System.out.println(flag);*/

		/*******************查*********************/
		//不利用反射查询多个记录 
		/*		String sql2 = "select * from userinfo ";
		List<Map<String, Object>> list = jdbcUtils.findModeResult(sql2, null);
		System.out.println(list);*/

		//利用反射查询 单条记录  
		/*		String sql = "select * from userinfo where username = ? ";
		List<Object> params = new ArrayList<Object>();
		params.add("李四");
		UserInfo userInfo;
		try {
			userInfo = jdbcUtils.findSimpleRefResult(sql, params, UserInfo.class);
			System.out.print(userInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
//		Class clcs = UserInfo.class;
//		try {
//			Object obj = clcs.newInstance();
//			Method f = clcs.getDeclaredMethod("setUsername", String.class);
//			f.invoke(obj, "yan123");
//			Method f2 = clcs.getDeclaredMethod("getUsername", null);
//			Object name = f2.invoke(obj, null);
//			System.out.println("����õ������� = "  +  name);
//
//		} catch (InstantiationException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IllegalAccessException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NoSuchMethodException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (SecurityException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IllegalArgumentException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (InvocationTargetException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}



	}

}
