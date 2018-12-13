package com.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.catalina.connector.Request;
import org.apache.struts2.ServletActionContext;

import com.Dao.QuestionDao;
import com.base.BaseSupport;

import cz.vutbr.web.csskit.antlr.CSSParser.string_return;

public class Question extends BaseSupport {
	
	//题库上传 字段
	private String question_subject;
	private String question_grade;
	private String question_type;
	private String question_difficult;
	private String question_content;
	//试卷名称
	private String test_paper_name;
	
	//所有题 列表
	List<Map<String, Object>> QuestionArr;
	//所有试卷 列表
	List<Map<String, Object>> QuestionListArr;
	
	//选择题 列表
	List<Map<String, Object>> choiceArr;
	//填空题 列表
	List<Map<String, Object>> completionArr;
	//判断题 列表
	List<Map<String, Object>> judgmentArr;
	//综合题 列表
	List<Map<String, Object>> comprehensiveArr;
	//现代文 列表
	List<Map<String, Object>> modernReadArr;
	
	//老师查看试卷 
	//选择题
	List<Map<String, Object>> tchoiceArr;
	//填空题 列表
	List<Map<String, Object>> tcompletionArr;
	//判断题 列表
	List<Map<String, Object>> tjudgmentArr;
	//综合题 列表
	List<Map<String, Object>> tcomprehensiveArr;
	//现代文 列表
	List<Map<String, Object>> tmodernReadArr;
	
	//题库中题的ID
	private String questionID;
	
	JSONObject getQuestionDetail;
	
	//url中参数
	private String quesDetailParam;
	//试卷的 创建时间
	private String build_time;
	//试卷的 科目
	private String questionBuildSubject;
	//试卷中 题目的类型
	private String q_type;
	
	private String questionBuildGrade;
	private String questionBuildDifficult;
	
	//将试卷的出题人、年级等信息报讯在map对象中
	Map<String, Object> map = new HashMap<String, Object>();
	Map<String, Object> map1 = new HashMap<String, Object>();
	
	public String execute() throws Exception {
		
		//获取 所有题 列表
		QuestionArr = QuestionDao.getQuestionArr();
		
		//获取所有题库列表
		QuestionListArr = QuestionDao.getQuestionListArr();
//		String q_l_subject = (String) QuestionListArr.get(0).get("subject");
//		getQuestionListDetailPage();
		
		return SUCCESS;
	}
	
	/**
	 * 题库上传
	 * @return
	 * @throws Exception
	 */
	public String questionUp() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		//从session中获取 上传教师的ID和姓名
		String commonID = (String) request.getSession().getAttribute("commonID");
		String username = (String) request.getSession().getAttribute("username");
		
		QuestionDao.addQuestion(commonID, username, question_subject, question_grade, question_type, 
				question_difficult, question_content);
		
		return SUCCESS;
	}
	
	/**
	 * 删除题库中 某题
	 * @return
	 * @throws Exception
	 */
	public String deleteQuestion() throws Exception {
		
		QuestionDao.delQuestion(questionID);
		
		return SUCCESS;
	}
	
	/**
	 * 进入编辑题目页面，获得该题的详细信息
	 * @return
	 * @throws Exception
	 */
	public String editQuestion() throws Exception {
		
		getQuestionDetail = QuestionDao.getQuestionDetailByID(questionID);
		
		//循环获取JSONObject中的键和值
		/*Iterator it = getQuestionDetail.keys(); 
		while(it.hasNext()){
			 
			String key = (String) it.next();
	        String value = getQuestionDetail.getString(key);
		}  */
		 
		return SUCCESS;
	}
	
	/**
	 * 教师 编辑 某道题目
	 * @return
	 * @throws Exception
	 */
	public String doEditQuestion() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		//从session中获取 上传教师的ID和姓名
		String commonID = (String) request.getSession().getAttribute("commonID");
		String username = (String) request.getSession().getAttribute("username");
		
		QuestionDao.editQuestion(questionID, commonID, username, question_subject, 
				question_grade, question_type, question_difficult, question_content);
		
		return SUCCESS;
	}
	
	/**
	 * 生成题库
	 * @return
	 * @throws Exception
	 */
	public String questionListBuild() throws Exception {
		//获取出卷人的姓名和ID
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String commonID = (String) request.getSession().getAttribute("commonID");
		String username = (String) request.getSession().getAttribute("username");
				
		//先判断 要生成的 科目
		if(question_subject.equals("英语")){
			//在表 question表中 各类题型 随机选择5道题目
			//选择题，选取20道，共20分
			choiceArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"选择题",question_difficult,20);
			//填空题，选取1道，共10分
			completionArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"完形填空",question_difficult,1);
			//阅读理解，选取4道，共40分
			judgmentArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"阅读理解",question_difficult,4);
			//作文，选取1道，共30分
			comprehensiveArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"作文",question_difficult,1);
			
			//将随机选出的题目 保存在表 question_list 中
			//选择题
			for(int i=0; i<choiceArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = choiceArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "选择题", test_paper_name);
			}
			//完形填空
			for(int i=0; i<completionArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = completionArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "完形填空", test_paper_name);
			}
			//阅读理解
			for(int i=0; i<judgmentArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = judgmentArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "阅读理解", test_paper_name);
			}
			//作文
			for(int i=0; i<comprehensiveArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = comprehensiveArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "作文", test_paper_name);
			}
			
		} else if(question_subject.equals("语文")){
			//在表 question表中 各类题型 随机选择5道题目
			//选择题，选取5道，共30分
			choiceArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"选择题",question_difficult,5);
			//填空题，选取5道，共10分
			completionArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"填空题",question_difficult,5);
			//古诗文阅读，选取1道，共10分
			judgmentArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"古诗文阅读",question_difficult,1);
			//现代文阅读，选取1道，共10分
			modernReadArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"现代文阅读",question_difficult,1);
			//作文，选取1道，共40分
			comprehensiveArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"作文",question_difficult,1);
			
			//将随机选出的题目 保存在表 question_list 中
			//选择题
			for(int i=0; i<choiceArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = choiceArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "选择题", test_paper_name);
			}
			//填空题
			for(int i=0; i<completionArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = completionArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "填空题", test_paper_name);
			}
			//古诗文阅读
			for(int i=0; i<judgmentArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = judgmentArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "古诗文阅读", test_paper_name);
			}
			//现代文阅读
			for(int i=0; i<modernReadArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = modernReadArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "现代文阅读", test_paper_name);
			}
			//作文
			for(int i=0; i<comprehensiveArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = comprehensiveArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "作文", test_paper_name);
			}
			
		} else {
			//在表 question表中 各类题型 随机选择5道题目
			//选择题，选取5道，共10分
			choiceArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"选择题",question_difficult,5);
			//填空题，选取5道，共10分
			completionArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"填空题",question_difficult,5);
			//判断题，选取10道，共20分
			judgmentArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"判断题",question_difficult,10);
			//综合题，选取3道，共60分
			comprehensiveArr = QuestionDao.getQuestionLimitItems(question_subject,question_grade,
					"综合题",question_difficult,3);
			
			//将随机选出的题目 保存在表 question_list 中
			//选择题
			for(int i=0; i<choiceArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = choiceArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "选择题", test_paper_name);
			}
			//填空题
			for(int i=0; i<completionArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = completionArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "填空题", test_paper_name);
			}
			//判断题
			for(int i=0; i<judgmentArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = judgmentArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "判断题", test_paper_name);
			}
			//综合题
			for(int i=0; i<comprehensiveArr.size(); i++){
				//选择题的 每个题目的 ID
				String question_id = comprehensiveArr.get(i).get("ID").toString();
				QuestionDao.saveQuesMsg(question_id, commonID, username, question_subject, 
						question_grade, question_difficult, "综合题", test_paper_name);
			}
			
		}
		
		//将试卷的出题人、年级等信息报讯在map对象中
		map.put("question_subject", question_subject);
		map.put("question_grade", question_grade);
		map.put("question_difficult", question_difficult);
		map.put("test_paper_name", test_paper_name);
		
		//获取 所有题 列表
		QuestionArr = QuestionDao.getQuestionArr();
		
		//获取所有题库列表
		QuestionListArr = QuestionDao.getQuestionListArr();
		
//		//将随机取出的各种类型的题目的ID，保存在 题库 表 question_list 中
//		List<String> choiceList = new ArrayList<String>();
//		for(int i=0; i<choiceArr.size(); i++){
//			//选择题的 每个题目的 ID
//			choiceList.add(choiceArr.get(i).get("ID").toString());
//		}
//		if(choiceList != null && choiceList.size()>0){
//			//创建一个和choiceList长度一样的数组
//			String[] choiceListArray=new String[choiceList.size()];
//			for(int i=0;i<choiceList.size();i++){
//				//给数组赋值
//				choiceListArray[i]=choiceList.get(i);
//			}
//		}
		
		
		return SUCCESS;
	}
	
	/**
	 * 获取题库的详细信息
	 * @return
	 * @throws Exception
	 */
	public String getQuestionListDetailPage() throws Exception {
		
		//获取url中的参数
		HttpServletRequest request = ServletActionContext.getRequest();
		String build_time = request.getParameter("questionBuildTime");
		String questionBuildSubject = new String(request.getParameter("questionBuildSubject").getBytes("ISO-8859-1"), "UTF-8");
		String questionBuildGrade = request.getParameter("questionBuildGrade");
		String questionBuildName = new String(request.getParameter("questionBuildName").getBytes("ISO-8859-1"), "UTF-8");
		String questionBuildDifficult = new String(request.getParameter("questionBuildDifficult").getBytes("ISO-8859-1"), "UTF-8");
		
		//将试卷的出题人、年级等信息报讯在map对象中
		map1.put("questionBuildSubject", questionBuildSubject);
		map1.put("questionBuildGrade", questionBuildGrade);
		map1.put("questionBuildName", questionBuildName);
		map1.put("questionBuildDifficult", questionBuildDifficult);
		
		//老师 查看试卷
		//选择题 所有试卷通用
		tchoiceArr = QuestionDao.getQuestionListDetailArr(questionBuildName, "选择题");
		
		if(questionBuildSubject.equals("语文")){
			//填空题
			tcompletionArr = QuestionDao.getQuestionListDetailArr(questionBuildName, "填空题");
			//古诗文阅读
			tjudgmentArr = QuestionDao.getQuestionListDetailArr(questionBuildName, "古诗文阅读");
			//现代文阅读
			tmodernReadArr = QuestionDao.getQuestionListDetailArr(questionBuildName, "现代文阅读");
			//作文
			tcomprehensiveArr = QuestionDao.getQuestionListDetailArr(questionBuildName, "作文");
			
		} else if(questionBuildSubject.equals("数学") ||
				questionBuildSubject.equals("物理") ||
				questionBuildSubject.equals("化学")){
			//填空题
			tcompletionArr = QuestionDao.getQuestionListDetailArr(questionBuildName, "填空题");
			//判断题
			tjudgmentArr = QuestionDao.getQuestionListDetailArr(questionBuildName, "判断题");
			//综合题
			tcomprehensiveArr = QuestionDao.getQuestionListDetailArr(questionBuildName, "综合题");
		} else if(questionBuildSubject.equals("英语")){
			//完形填空
			tcompletionArr = QuestionDao.getQuestionListDetailArr(questionBuildName, "完形填空");
			//阅读理解
			tjudgmentArr = QuestionDao.getQuestionListDetailArr(questionBuildName, "阅读理解");
			//作文
			tcomprehensiveArr = QuestionDao.getQuestionListDetailArr(questionBuildName, "作文");
		}
		
		//获取 所有题 列表
		QuestionArr = QuestionDao.getQuestionArr();
		
		//获取所有题库列表
		QuestionListArr = QuestionDao.getQuestionListArr();
		
		return SUCCESS;
	}

	public String getQuestion_subject() {
		return question_subject;
	}

	public String getQuestion_grade() {
		return question_grade;
	}

	public String getQuestion_type() {
		return question_type;
	}

	public String getQuestion_difficult() {
		return question_difficult;
	}

	public String getQuestion_content() {
		return question_content;
	}

	public void setQuestion_subject(String question_subject) {
		this.question_subject = question_subject;
	}

	public void setQuestion_grade(String question_grade) {
		this.question_grade = question_grade;
	}

	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}

	public void setQuestion_difficult(String question_difficult) {
		this.question_difficult = question_difficult;
	}

	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}

	public List<Map<String, Object>> getQuestionArr() {
		return QuestionArr;
	}

	public void setQuestionArr(List<Map<String, Object>> questionArr) {
		QuestionArr = questionArr;
	}

	public String getQuestionID() {
		return questionID;
	}

	public void setQuestionID(String questionID) {
		this.questionID = questionID;
	}

	public JSONObject getGetQuestionDetail() {
		return getQuestionDetail;
	}

	public void setGetQuestionDetail(JSONObject getQuestionDetail) {
		this.getQuestionDetail = getQuestionDetail;
	}

	public List<Map<String, Object>> getChoiceArr() {
		return choiceArr;
	}

	public void setChoiceArr(List<Map<String, Object>> choiceArr) {
		this.choiceArr = choiceArr;
	}

	public List<Map<String, Object>> getCompletionArr() {
		return completionArr;
	}

	public void setCompletionArr(List<Map<String, Object>> completionArr) {
		this.completionArr = completionArr;
	}

	public List<Map<String, Object>> getComprehensiveArr() {
		return comprehensiveArr;
	}

	public void setComprehensiveArr(List<Map<String, Object>> comprehensiveArr) {
		this.comprehensiveArr = comprehensiveArr;
	}

	public List<Map<String, Object>> getJudgmentArr() {
		return judgmentArr;
	}

	public void setJudgmentArr(List<Map<String, Object>> judgmentArr) {
		this.judgmentArr = judgmentArr;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public List<Map<String, Object>> getModernReadArr() {
		return modernReadArr;
	}

	public void setModernReadArr(List<Map<String, Object>> modernReadArr) {
		this.modernReadArr = modernReadArr;
	}

	public String getTest_paper_name() {
		return test_paper_name;
	}

	public void setTest_paper_name(String test_paper_name) {
		this.test_paper_name = test_paper_name;
	}

	public List<Map<String, Object>> getQuestionListArr() {
		return QuestionListArr;
	}

	public void setQuestionListArr(List<Map<String, Object>> questionListArr) {
		QuestionListArr = questionListArr;
	}

	public String getQuesDetailParam() {
		return quesDetailParam;
	}

	public void setQuesDetailParam(String quesDetailParam) {
		this.quesDetailParam = quesDetailParam;
	}

	public String getBuild_time() {
		return build_time;
	}

	public String getQ_type() {
		return q_type;
	}

	public void setBuild_time(String build_time) {
		this.build_time = build_time;
	}

	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}

	public String getQuestionBuildSubject() {
		return questionBuildSubject;
	}

	public void setQuestionBuildSubject(String questionBuildSubject) {
		this.questionBuildSubject = questionBuildSubject;
	}

	public String getQuestionBuildGrade() {
		return questionBuildGrade;
	}

	public String getQuestionBuildDifficult() {
		return questionBuildDifficult;
	}

	public void setQuestionBuildGrade(String questionBuildGrade) {
		this.questionBuildGrade = questionBuildGrade;
	}

	public void setQuestionBuildDifficult(String questionBuildDifficult) {
		this.questionBuildDifficult = questionBuildDifficult;
	}

	public Map<String, Object> getMap1() {
		return map1;
	}

	public void setMap1(Map<String, Object> map1) {
		this.map1 = map1;
	}

	public List<Map<String, Object>> getTchoiceArr() {
		return tchoiceArr;
	}

	public void setTchoiceArr(List<Map<String, Object>> tchoiceArr) {
		this.tchoiceArr = tchoiceArr;
	}

	public List<Map<String, Object>> getTcompletionArr() {
		return tcompletionArr;
	}

	public void setTcompletionArr(List<Map<String, Object>> tcompletionArr) {
		this.tcompletionArr = tcompletionArr;
	}

	public List<Map<String, Object>> getTjudgmentArr() {
		return tjudgmentArr;
	}

	public void setTjudgmentArr(List<Map<String, Object>> tjudgmentArr) {
		this.tjudgmentArr = tjudgmentArr;
	}

	public List<Map<String, Object>> getTcomprehensiveArr() {
		return tcomprehensiveArr;
	}

	public void setTcomprehensiveArr(List<Map<String, Object>> tcomprehensiveArr) {
		this.tcomprehensiveArr = tcomprehensiveArr;
	}

	public List<Map<String, Object>> getTmodernReadArr() {
		return tmodernReadArr;
	}

	public void setTmodernReadArr(List<Map<String, Object>> tmodernReadArr) {
		this.tmodernReadArr = tmodernReadArr;
	}

}
