package com.backstage;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.Dao.TeachResourceDao;
import com.base.BaseSupport;

public class BHomework extends BaseSupport {

	//所有已经布置的 作业 列表
	List<Map<String, Object>> ArrangeHomeworkArr;
	
	// 查看 不止的作业 详情
	private JSONObject homework_detail;
	
	//作业ID
	private String hwID;
	
	public String execute() throws Exception {
		
		//获取 所有已经布置的 作业 列表
		ArrangeHomeworkArr = TeachResourceDao.getAllArrangeHomework();
		
		return SUCCESS;
	}
	
	/**
	 * 获取 作业 详细信息
	 * @return
	 * @throws Exception
	 */
	public String getHomeworkDetail() throws Exception {
		
		//胡群殴作业详情
		homework_detail = TeachResourceDao.getHWDetail(hwID);
		
		return SUCCESS;
	}

	public List<Map<String, Object>> getArrangeHomeworkArr() {
		return ArrangeHomeworkArr;
	}

	public void setArrangeHomeworkArr(List<Map<String, Object>> arrangeHomeworkArr) {
		ArrangeHomeworkArr = arrangeHomeworkArr;
	}

	public JSONObject getHomework_detail() {
		return homework_detail;
	}

	public void setHomework_detail(JSONObject homework_detail) {
		this.homework_detail = homework_detail;
	}

	public String getHwID() {
		return hwID;
	}

	public void setHwID(String hwID) {
		this.hwID = hwID;
	}
}
