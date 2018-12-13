package com.backstage;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.Dao.NewsNoticeRulesDao;
import com.base.BaseSupport;

public class BNewsNoticeRules extends BaseSupport {

	// 学校快闻 列表
	List<Map<String, Object>> NewsArr;
	// 通知公告 列表
	List<Map<String, Object>> NoticeArr;
	// 规章制度 列表
	List<Map<String, Object>> RulesArr;

	private JSONObject getCommonDetail;

	//将三种信息的ID 合并为1个
	private String commonID;
	
	private String title;
	private String author;
	private String content;
	
	private String type;

	public String execute() throws Exception {

		// 取出所有的 学校快闻
		NewsArr = NewsNoticeRulesDao.getAllNewsNoticeRulesByID("0");
		// 取出所有的 通知公告
		NoticeArr = NewsNoticeRulesDao.getAllNewsNoticeRulesByID("1");
		// 取出所有的 规章制度
		RulesArr = NewsNoticeRulesDao.getAllNewsNoticeRulesByID("2");

		return SUCCESS;
	}

	/**
	 * 在后台，获取首页新闻等的详细信息
	 * @return
	 * @throws Exception
	 */
	public String AdminGetCommonDetail() throws Exception {

		// 获取 校园快闻、通知公告、规章制度 的详细信息，用于修改
		getCommonDetail = NewsNoticeRulesDao.getNewsNoticeRulesDetail(commonID);

		return SUCCESS;
	}
	
	/**
	 * 删除 学生成绩
	 * 
	 * @return
	 * @throws Exception
	 */
	public String DeleteNewsNoticeRules() throws Exception {

		// 删除学生成绩
		NewsNoticeRulesDao.delNewsNoticeRules(commonID);

		return SUCCESS;
	}
	
	/**
	 * 确认修改
	 * @return
	 * @throws Exception
	 */
	public String DoAdminEditCommonDetail() throws Exception {
		
		if (NewsNoticeRulesDao.editNewsNoticeRulesDetail(commonID, title, author,
				content)) {
			successMessage = "编辑成功！";
		} else {
			errorMessage = "编辑失败！";
		}
		
		getCommonDetail = NewsNoticeRulesDao.getNewsNoticeRulesDetail(commonID);
		
		return SUCCESS;
	}
	
	/**
	 * 添加一条 新闻公告
	 * @return
	 * @throws Exception
	 */
	public String DoAddNewsNoticeRules() throws Exception {
		
		if(NewsNoticeRulesDao.addNewsNoticeRules(title, author, content, type)){
			successMessage = "发布成功";
		} else {
			errorMessage = "发布失败，请重新录入！";
		}
		
		return SUCCESS;
	}

	public List<Map<String, Object>> getNewsArr() {
		return NewsArr;
	}

	public List<Map<String, Object>> getNoticeArr() {
		return NoticeArr;
	}

	public List<Map<String, Object>> getRulesArr() {
		return RulesArr;
	}

	public void setNewsArr(List<Map<String, Object>> newsArr) {
		NewsArr = newsArr;
	}

	public void setNoticeArr(List<Map<String, Object>> noticeArr) {
		NoticeArr = noticeArr;
	}

	public void setRulesArr(List<Map<String, Object>> rulesArr) {
		RulesArr = rulesArr;
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

	public String getTitle() {
		return title;
	}

	public String getAuthor() {
		return author;
	}

	public String getContent() {
		return content;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
