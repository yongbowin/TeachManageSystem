package com.admin;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.Dao.TeachResourceDao;
import com.base.BaseSupport;

public class TeachResource extends BaseSupport {

	private String res_grade;
	private String res_subject;
	private String res_type;
	private String res_name;
	private String res_desc;
	
	private File fileTestData;
	
	//所有已经上传的资料 列表
	List<Map<String, Object>> TeacherResourceArr;
	//所有已经布置的 作业 列表
	List<Map<String, Object>> ArrangeHomeworkArr;
	//根据条件 获取 对应的作业
	List<Map<String, Object>> HomeworkSearchResultArr;
	
	private String fileID;
	private String filePath;
	
	//老师 布置作业
	private String homework_start_time;
	private String homework_end_time;
	private String homework_title;
	
	private String hwID;
	
	private String HWID;
	
	private String hw_answer;
	
	//学生搜索 作业
	private String hw_grade_val;
	private String hw_subject_val;
	
	private JSONObject get_hw_detail;
	//获取已提交的作业的详细信息
	private JSONObject get_hw_answer_detail;
	
	//文件名
	private String fileTestDataFileName;
	//文件类型
	private String fileTestDataContentType;
	
	public String execute() throws Exception {
		
		//获取所有已经上传的资料
		TeacherResourceArr = TeachResourceDao.getAllResFile();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String common_ID = (String) request.getSession().getAttribute("commonID");
		//获取已提交的作业的详细信息
		get_hw_answer_detail = TeachResourceDao.getAnswerDetail(common_ID,HWID);
		
		//从url中取出指定的参数，当写了getter和setter方法之后，可以省略下边这两行
		hw_subject_val = request.getParameter("hw_subject_val");
		
		if (hw_subject_val != null && hw_grade_val != null) {
			//将前台传来的url中的参数进行转码，注意：前台需要进行两次编码，后台再进行解码
			String hw_subject_val1 = java.net.URLDecoder.decode(hw_subject_val,"UTF-8");
			
			HomeworkSearchResultArr = TeachResourceDao.getHwByCondition(hw_grade_val,hw_subject_val1);
		} else {
			//获取当前用户的 类型
			String curr_status = (String) request.getSession().getAttribute("curr_status");
			String commonID = (String) request.getSession().getAttribute("commonID");
			
			//当时学生登录时 显示所有的数据
			if(curr_status.equals("0")){
				//获取 所有已经布置的 作业 列表
				ArrangeHomeworkArr = TeachResourceDao.getAllArrangeHomework();
			} else if (curr_status.equals("1")){
				//当是老师登录时，只显示该老师的作业布置数据
				ArrangeHomeworkArr = TeachResourceDao.getAllArrangeHomeworkByID(commonID);
			}
		}
		
		return SUCCESS;
	}
	
	/**
	 * 上传资料
	 * @return
	 * @throws Exception
	 */
	public String DoUpFile() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取三个下拉框的 选中状态值
		String res_grade = request.getParameter("res_grade");
		String res_subject = request.getParameter("res_subject");
		String res_type = request.getParameter("res_type");
		
//		System.out.println("res_grade=" + res_grade);
//		System.out.println("res_subject=" + res_subject);
//		System.out.println("res_type=" + res_type);
//		System.out.println("res_name=" + res_name);
//		System.out.println("res_desc=" + res_desc);
//		System.out.println("fileTestDataFileName文件名为：" + fileTestDataFileName);
		
		//获取文件保存的路径，保存文件
		String resFilePath = Common.saveResFile(fileTestDataFileName, fileTestData, request);
		
//		System.out.println("resFilePath的值是：" + resFilePath);
		//上传资料的 老师ID
		String commonID = (String) request.getSession().getAttribute("commonID");
		//上传者姓名
		String username = (String) request.getSession().getAttribute("username");
		
		//保存在数据库
		if(TeachResourceDao.addTeachResource(res_grade, res_subject, res_type, 
				resFilePath, username, res_name, commonID, res_desc)){
			successMessage = "上传成功！";
		}
		else{
			errorMessage = "上传失败！";
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除文件
	 * @return
	 * @throws Exception
	 */
	public String delFile() throws Exception {
		
		TeachResourceDao.deleteResFileByID(fileID);
		
		return SUCCESS;
	}
	
	/**
	 * 老师 布置作业
	 * @return
	 * @throws Exception
	 */
	public String ArrangeHomework() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取两个下拉框的 选中状态值
		String homework_subject = request.getParameter("homework_subject");
		String homework_grade = request.getParameter("homework_grade");
		//从session中取出 布置作业的 教师ID和教师姓名
		String commonID = (String) request.getSession().getAttribute("commonID");
		String username = (String) request.getSession().getAttribute("username");
		
		TeachResourceDao.addArrangeHomework(homework_subject, homework_grade, 
				username, homework_start_time, homework_end_time, homework_title, 
				commonID);
		
		return SUCCESS;
	}
	
	/**
	 * 老师 删除 已经布置的 作业
	 * @return
	 * @throws Exception
	 */
	public String delArrangeHomework() throws Exception {
		
		TeachResourceDao.deleteHwByID(hwID);
		
		return SUCCESS;
	}
	
	/**
	 * 学生 搜索 老师布置的作业
	 * @return
	 * @throws Exception
	 */
	public String searchHw() throws Exception {
		
		//其中 hw_grade_val 为年级，hw_subject_val为课程名称
		HomeworkSearchResultArr = TeachResourceDao.getHwByCondition(hw_grade_val,hw_subject_val);
		
		return null;
	}
	
	/**
	 * 学生获取作业的详细信息
	 * @return
	 * @throws Exception
	 */
	public String StuGetHWDetail() throws Exception {
		
		// 学生获取作业的详细信息
		get_hw_detail = TeachResourceDao.getHWDetail(HWID);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String common_ID = (String) request.getSession().getAttribute("commonID");
		//获取已提交的作业的详细信息
		get_hw_answer_detail = TeachResourceDao.getAnswerDetail(common_ID,HWID);
		
		return SUCCESS;
	}
	
	/**
	 * 学生 提交作业
	 * @return
	 * @throws Exception
	 */
	public String hwSubmit() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();

		String commonID = (String) request.getSession().getAttribute("commonID");
		String username = (String) request.getSession().getAttribute("username");
		
		if(TeachResourceDao.stuHWSubmit(commonID, username, HWID, hw_answer)){
			successMessage = "作业提交成功！";
		} else {
			errorMessage = "提交失败，请重新提交！";
		}
		
		return SUCCESS;
	}
	
	/**
	 * 下载文件资料
	 * @return
	 * @throws Exception
	 */
	public InputStream getDownloadFile() throws Exception {
		
		System.out.println("进入下载文件方法...");
		
		// 如果下载文件名为中文，进行字符编码转换
		ServletActionContext.getResponse().setHeader("Content-Disposition","attachment;fileName="
		        + java.net.URLEncoder.encode(filePath, "UTF-8"));
		
		System.out.println("文件名为： " + filePath);
		
		return ServletActionContext.getServletContext()
				.getResourceAsStream("/res_file/" + filePath);
	}
	
	public String getRes_grade() {
		return res_grade;
	}

	public String getRes_subject() {
		return res_subject;
	}

	public String getRes_type() {
		return res_type;
	}

	public File getFileTestData() {
		return fileTestData;
	}

	public void setRes_grade(String res_grade) {
		this.res_grade = res_grade;
	}

	public void setRes_subject(String res_subject) {
		this.res_subject = res_subject;
	}

	public void setRes_type(String res_type) {
		this.res_type = res_type;
	}

	public void setFileTestData(File fileTestData) {
		this.fileTestData = fileTestData;
	}

	public String getRes_name() {
		return res_name;
	}

	public String getRes_desc() {
		return res_desc;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public void setRes_desc(String res_desc) {
		this.res_desc = res_desc;
	}

	public List<Map<String, Object>> getTeacherResourceArr() {
		return TeacherResourceArr;
	}

	public void setTeacherResourceArr(List<Map<String, Object>> teacherResourceArr) {
		TeacherResourceArr = teacherResourceArr;
	}

	public String getFileID() {
		return fileID;
	}

	public void setFileID(String fileID) {
		this.fileID = fileID;
	}

	public String getHomework_start_time() {
		return homework_start_time;
	}

	public void setHomework_start_time(String homework_start_time) {
		this.homework_start_time = homework_start_time;
	}

	public String getHomework_end_time() {
		return homework_end_time;
	}

	public void setHomework_end_time(String homework_end_time) {
		this.homework_end_time = homework_end_time;
	}

	public String getHomework_title() {
		return homework_title;
	}

	public void setHomework_title(String homework_title) {
		this.homework_title = homework_title;
	}

	public List<Map<String, Object>> getArrangeHomeworkArr() {
		return ArrangeHomeworkArr;
	}

	public void setArrangeHomeworkArr(List<Map<String, Object>> arrangeHomeworkArr) {
		ArrangeHomeworkArr = arrangeHomeworkArr;
	}

	public String getHwID() {
		return hwID;
	}

	public void setHwID(String hwID) {
		this.hwID = hwID;
	}

	public String getHw_grade_val() {
		return hw_grade_val;
	}

	public void setHw_grade_val(String hw_grade_val) {
		this.hw_grade_val = hw_grade_val;
	}

	public String getHw_subject_val() {
		return hw_subject_val;
	}

	public void setHw_subject_val(String hw_subject_val) {
		this.hw_subject_val = hw_subject_val;
	}

	public List<Map<String, Object>> getHomeworkSearchResultArr() {
		return HomeworkSearchResultArr;
	}

	public void setHomeworkSearchResultArr(
			List<Map<String, Object>> homeworkSearchResultArr) {
		HomeworkSearchResultArr = homeworkSearchResultArr;
	}

	public JSONObject getGet_hw_detail() {
		return get_hw_detail;
	}

	public void setGet_hw_detail(JSONObject get_hw_detail) {
		this.get_hw_detail = get_hw_detail;
	}

	public String getHWID() {
		return HWID;
	}

	public void setHWID(String hWID) {
		HWID = hWID;
	}

	public String getHw_answer() {
		return hw_answer;
	}

	public void setHw_answer(String hw_answer) {
		this.hw_answer = hw_answer;
	}

	public JSONObject getGet_hw_answer_detail() {
		return get_hw_answer_detail;
	}

	public void setGet_hw_answer_detail(JSONObject get_hw_answer_detail) {
		this.get_hw_answer_detail = get_hw_answer_detail;
	}

	public String getFileTestDataFileName() {
		return fileTestDataFileName;
	}

	public void setFileTestDataFileName(String fileTestDataFileName) {
		this.fileTestDataFileName = fileTestDataFileName;
	}

	public String getFileTestDataContentType() {
		return fileTestDataContentType;
	}

	public void setFileTestDataContentType(String fileTestDataContentType) {
		this.fileTestDataContentType = fileTestDataContentType;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
}
