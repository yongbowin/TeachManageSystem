package com.backstage;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.Dao.MessageDao;
import com.base.BaseSupport;

public class BMessage extends BaseSupport {

	List<Map<String, Object>> BMessageArr;
	
	//留言的 详细信息
	private JSONObject message_detail;
	
	//留言的 ID
	private String messageID;
	
	public String execute() throws Exception {
		
		//获取所有留言信息
		BMessageArr = MessageDao.getAllMessage();

		return SUCCESS;
	}
	
	public String DeleteMessage() throws Exception {
		
		//删除一条 留言
		MessageDao.deleteMsg(messageID);
		
		//获取所有留言信息
		BMessageArr = MessageDao.getAllMessage();
		
		return SUCCESS;
	}
	
	/**
	 * 获取留言的详细信息
	 * @return
	 * @throws Exception
	 */
	public String GetMessageDetail() throws Exception {
		
		//获取留言详细信息
		message_detail = MessageDao.getMsgDetail(messageID);
		
		return SUCCESS;
	}

	public List<Map<String, Object>> getBMessageArr() {
		return BMessageArr;
	}

	public void setBMessageArr(List<Map<String, Object>> bMessageArr) {
		BMessageArr = bMessageArr;
	}

	public String getMessageID() {
		return messageID;
	}

	public void setMessageID(String messageID) {
		this.messageID = messageID;
	}

	public JSONObject getMessage_detail() {
		return message_detail;
	}

	public void setMessage_detail(JSONObject message_detail) {
		this.message_detail = message_detail;
	}
}
