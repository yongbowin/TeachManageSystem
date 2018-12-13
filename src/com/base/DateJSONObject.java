package com.base;

import net.sf.json.JSONObject;

public class DateJSONObject {

	/**
	 * 返回指定日期格式的JSON对象
	 * @param obj
	 * @return
	 */
	public static JSONObject fromObject(Object obj){
		try {
			DateJsonValueProcessor.init();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return JSONObject.fromObject(obj, DateJsonValueProcessor.DATECONFIG);
	}
}
