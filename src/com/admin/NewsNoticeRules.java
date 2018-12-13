package com.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.Dao.NewsNoticeRulesDao;
import com.base.BaseSupport;

public class NewsNoticeRules extends BaseSupport {

	private String commonID;
	
	//文章的详细信息
	private JSONObject getCommonDetail;
	
	public String execute() throws Exception {
		
		getCommonDetail = NewsNoticeRulesDao.getNewsNoticeRulesDetail(commonID);
		
		return SUCCESS;
	}

	public JSONObject getGetCommonDetail() {
		return getCommonDetail;
	}

	public void setGetCommonDetail(JSONObject getCommonDetail) {
		this.getCommonDetail = getCommonDetail;
	}

	public String getCommonID() {
		return commonID;
	}

	public void setCommonID(String commonID) {
		this.commonID = commonID;
	}
}
