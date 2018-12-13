package com.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.Dao.MessageDao;
import com.base.BaseSupport;

public class Message extends BaseSupport {

	List<Map<String, Object>> messageArr;
	
	private String msg_content;
	private String username;
	
	public String execute() throws Exception {
		
		//获取所有留言
		messageArr = MessageDao.getAllMessage();
		
		return SUCCESS;
	}
	
	public String DoMessage() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String commonID = (String) request.getSession().getAttribute("commonID");
		String username = (String) request.getSession().getAttribute("username");
		//添加发表的评论
		MessageDao.addMessage(username, msg_content, commonID);
		
		return SUCCESS;
	}

	public List<Map<String, Object>> getMessageArr() {
		return messageArr;
	}

	public void setMessageArr(List<Map<String, Object>> messageArr) {
		this.messageArr = messageArr;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
}
