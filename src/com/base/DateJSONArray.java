package com.base;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DateJSONArray {
	/**
	 * 返回指定日期格式的JSON对象
	 * @param obj
	 * @return
	 */
	public static JSONArray fromObject(Object obj){
		try {
			DateJsonValueProcessor.init();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return JSONArray.fromObject(obj, DateJsonValueProcessor.DATECONFIG);
	}
}
