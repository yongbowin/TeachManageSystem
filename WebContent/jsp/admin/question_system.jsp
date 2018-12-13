<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>题库系统</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/jq22.css" rel="stylesheet" type="text/css" />
<link href="css/upload/zyUpload.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- 导航条 -->
<script src="js/jquery.movebg.js"></script>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class="content-main">

	<!-- 判断是老师登录还是学生登录 -->
	<!-- 当是学生登录的时候 -->
	<s:if test="#session.curr_status == 0">
	
		<div class="content-main-nav">
			<!-- 左侧导航栏 -->
			<div class="content-main-left">
				<div class="nav-head-bar"><div class="nav-head-bar-3"></div><div class="nav-left-bar res-down-bar-stu">资料下载</div></div>
				<div class="nav-head-bar"><div class="nav-head-bar-4"></div><div class="nav-left-bar res-homework-bar-stu">作业上传</div></div>
			</div>
			
			<!-- 右侧详细内容 -->
			<div class="content-main-right">
				
				<!-- 资料下载-开始 -->
				<div class="resource_download_content_stu">
					<div class="res-up-down-title">资料下载</div>
					<div class="res-up-down-content">
						<table id="res_down_tab" cellpadding="0" cellspacing="0">
							<tr>
								<td>文件名</td>
								<td>年级</td>
								<td>科目</td>
								<td>类型</td>
								<td>文件描述</td>
								<td>上传人</td>
								<td>上传时间</td>
								<td>操作</td>
							</tr>
							
							<s:iterator value="TeacherResourceArr" id="teachres">
							
								<tr>
									<td>
										<div id="res_title_limit">
											<s:property value="#teachres.file_name" />
										</div>
									</td>
									<td><s:property value="#teachres.file_grade" /></td>
									<td><s:property value="#teachres.file_subject" /></td>
									<td><s:property value="#teachres.file_type" /></td>
									<td>
										<div id="res_desc_limit">
											<s:property value="#teachres.file_desc" />
										</div>
									</td>
									<td><s:property value="#teachres.file_up_author" /></td>
									<td><s:property value="#teachres.file_up_time" /></td>
									<td>
										<a href="#">下载</a>
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>
				<!-- 资料下载-结束 -->
				
				<!-- 作业上传 -->
				<div class="resource_homework_content_stu">
				
					<div class="res-up-down-title">作业上传</div>
					<div class="res-up-down-content">
					<!-- 搜索 所在年级 某学科 的作业 -->
					<div class="res-up-down-type">
							<div class="res-up-down-type-1">
								年级：
								<select name="hw_grade" class="hw-grade-select">
									<option>7</option>
									<option>8</option>
									<option>9</option>
								</select>
							</div>
							
							<div class="res-up-down-type-2">
								科目：
								<select name="hw_subject" class="hw-subject-select">
									<option>语文</option>
									<option>数学</option>
									<option>英语</option>
									<option>物理</option>
									<option>化学</option>
								</select>
							</div>
							
							<div class="btn hw-btn" id="hw_btn">搜索作业</div>
						</div>
						
						<!-- 作业列表-开始 -->
						
						<table id="res_down_tab" cellpadding="0" cellspacing="0">
							<tr>
								<td>题目</td>
								<td>年级</td>
								<td>科目</td>
								<td>布置人</td>
								<td>开始时间</td>
								<td>截止时间</td>
								<td>操作</td>
							</tr>
							
							<!-- 如果返回的是 ArrangeHomeworkArr 对象，则显示下边的列表（没必要用jquery控制）
								 如果没有返回该对象，则不显示 -->
							<s:iterator value="ArrangeHomeworkArr" id="arrangeHomework">
							
								<tr>
									<td>
										<div id="res_title_limit">
											<s:property value="#arrangeHomework.hw_title" />
										</div>
									</td>
									<td><s:property value="#arrangeHomework.hw_grade" /></td>
									<td><s:property value="#arrangeHomework.hw_subject" /></td>
									<td><s:property value="#arrangeHomework.teacher_name" /></td>
									<td><s:property value="#arrangeHomework.hw_start_time" /></td>
									<td><s:property value="#arrangeHomework.hw_end_time" /></td>
									<td>
										<a href="#">查看详情</a>
									</td>
								</tr>
							</s:iterator>
							
							<!-- 如果返回的是 HomeworkSearchResultArr 对象，则显示下边的列表（没必要用jquery控制）
								 如果没有返回该对象，则不显示 -->
							<s:iterator value="HomeworkSearchResultArr" id="homework">
							
								<tr>
									<td>
										<div id="res_title_limit">
											<s:property value="#homework.hw_title" />
										</div>
									</td>
									<td><s:property value="#homework.hw_grade" /></td>
									<td><s:property value="#homework.hw_subject" /></td>
									<td><s:property value="#homework.teacher_name" /></td>
									<td><s:property value="#homework.hw_start_time" /></td>
									<td><s:property value="#homework.hw_end_time" /></td>
									<td>
										<a href="#">查看详情</a>
									</td>
								</tr>
							</s:iterator>
							
						</table>
						<!-- 作业列表-结束 -->
					
						<div class="success-error">
							<div class="success-message"><s:property value="successMessage"/></div>
							<div class="error-message"><s:property value="errorMessage"/></div>
						</div>
					</div>
				</div>
				
			</div>
		
		</div>
		
	</s:if>
	
	<!-- 当是老师登录的时候 -->
	<s:elseif test="#session.curr_status == 1">
		
		<div class="content-main-nav">
			<!-- 左侧导航栏 -->
			<div class="content-main-left">
				<div class="nav-head-bar"><div class="nav-head-bar-1"></div><div class="nav-left-bar ques-up-bar">题目上传</div></div>
				<div class="nav-head-bar"><div class="nav-head-bar-2"></div><div class="nav-left-bar ques-build-bar">题库生成</div></div>
				<div class="nav-head-bar"><div class="nav-head-bar-5"></div><div class="nav-left-bar ques-manage-bar">题目管理</div></div>
				<div class="nav-head-bar"><div class="nav-head-bar-6"></div><div class="nav-left-bar ques-list-manage-bar">题库管理</div></div>
			</div>
			
			<!-- 右侧详细内容 -->
			<div class="content-main-right">
				
				<!-- 题目上传-开始 -->
				<div class="question_up_content">
					<div class="res-up-down-title">题目上传</div>
					<form action="question_up" method="post">
						<table class="resource_homework_tab">
							<tr>
								<td>科目：</td>
								<td>
									<select name="question_subject" id="q_subject_selected">
										<option>语文</option>
										<option>数学</option>
										<option>英语</option>
										<option>物理</option>
										<option>化学</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>年级：</td>
								<td>
									<select name="question_grade">
										<option>7</option>
										<option>8</option>
										<option>9</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>题型：</td>
								<td>
									<!-- 科目-语文被选中 -->
									<div class="q-selected-chinese-type">
										<select name="question_type">
											<option>选择题</option>
											<option>填空题</option>
											<option>古诗文阅读</option>
											<option>现代文阅读</option>
											<option>作文</option>
										</select>
									</div>
									<!-- 科目-英语被选中 -->
									<div class="q-selected-english-type">
										<select name="question_type">
											<option>选择题</option>
											<option>完形填空</option>
											<option>阅读理解</option>
											<option>作文</option>
										</select>
									</div>
									<!-- 科目-数学、物理、化学被选中 -->
									<div class="q-math-phy-chem-type">
										<select name="question_type">
											<option>选择题</option>
											<option>填空题</option>
											<option>判断题</option>
											<option>综合题</option>
										</select>
									</div>
									
								</td>
							</tr>
							<tr>
								<td>难度：</td>
								<td>
									<select name="question_difficult">
										<option>简单</option>
										<option>中等</option>
										<option>困难</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>内容：</td>
								<td><textarea name="question_content"></textarea></td>
							</tr>
						</table>
						<div class="homework-teacher-btn">
							<s:submit value="提交" class="btn s-homework-teacher-btn"></s:submit>
						</div>
					</form>
				</div>				
				<!-- 题目上传-结束 -->
				
				<!-- 题目编辑-开始 -->
				<div class="question_edit_content">
					<div class="res-up-down-title">题目编辑</div>
					<form action="doEditQuestion" method="post">
						<!-- 题目ID -->
						<input type="hidden" 
						value='<s:property value="getQuestionDetail.ID" />' 
						name="questionID" />
						<!-- 该题所属的 科目 -->
						<input id="edit_subject_id" type="hidden" value='<s:property value="getQuestionDetail.q_subject" />'  />
						<!-- 该题所属的 年级 -->
						<input id="edit_grade_id" type="hidden" value='<s:property value="getQuestionDetail.q_grade" />'  />
						<!-- 该题所属的 体型 -->
						<input id="edit_type_id" type="hidden" value='<s:property value="getQuestionDetail.q_type" />'  />
						<!-- 该题所属的 难度 -->
						<input id="edit_difficult_id" type="hidden" value='<s:property value="getQuestionDetail.q_difficult" />'  />
					
						<table class="resource_homework_tab">
							<tr>
								<td>科目：</td>
								<td>
									<select id="sel_subject_id" name="question_subject">
										<option>语文</option>
										<option>数学</option>
										<option>英语</option>
										<option>物理</option>
										<option>化学</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>年级：</td>
								<td>
									<select id="sel_grade_id" name="question_grade">
										<option>7</option>
										<option>8</option>
										<option>9</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>题型：</td>
								<td>
									<select id="sel_type_id" name="question_type">
										<option>选择题</option>
										<option>填空题</option>
										<option>判断题</option>
										<option>综合题</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>难度：</td>
								<td>
									<select id="sel_difficult_id" name="question_difficult">
										<option>简单</option>
										<option>中等</option>
										<option>困难</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>内容：</td>
								<td><textarea name="question_content">
										<s:property value="getQuestionDetail.q_content" />
									</textarea>
								</td>
							</tr>
						</table>
						<div class="homework-teacher-btn">
							<s:submit value="提交" class="btn s-homework-teacher-btn"></s:submit>
						</div>
					</form>
				</div>				
				<!-- 题目编辑-结束 -->
				
				<!-- 题库生成-开始 -->
				<div class="question_build_content">
					<div class="res-up-down-title">题库生成</div>
					<div class="question_build_form">
					<form action="question_list_build?build_test_paper_param=1" method="post">
						<table class="question_list_tab">
							<tr>
								<td>科目：</td>
								<td>
									<select name="question_subject">
										<option>语文</option>
										<option>数学</option>
										<option>英语</option>
										<option>物理</option>
										<option>化学</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>年级：</td>
								<td>
									<select name="question_grade">
										<option>7</option>
										<option>8</option>
										<option>9</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>难度：</td>
								<td>
									<select name="question_difficult">
										<option>简单</option>
										<option>中等</option>
										<option>困难</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>名称：</td>
								<td>
									<input value="" name="test_paper_name" />
								</td>
							</tr>
						</table>
						<div class="homework-teacher-btn">
							<s:submit value="生成题库" class="btn build-test-paper-btn"></s:submit>
						</div>
					</form>
					</div>
					
				<!-- 试卷-开始 -->
				<div class="test_paper_content" id="test_paper_content_id">
					<div class="test_paper-title">生成的试卷</div>
					<div class="test_paper-title_name"><s:property value="map.test_paper_name" /></div>
						<table class="test_paper_tab">
							<tr>
								<td>
									<div class="test_paper_explain_title">
										出题人：<s:property value="#session.username" />
										&nbsp;
										年级：<s:property value="map.question_grade" />
										&nbsp;
										科目：<s:property value="map.question_subject" />
										&nbsp;
										难度：<s:property value="map.question_difficult" />
									</div>
								</td>
							</tr>
							
							<!-- 选择题-开始 -->
							<tr>
								<td id="choice_title_id"><div class="test-paper-little-title">一、选择题</div></td>
							</tr>
							<s:iterator value="choiceArr" id="choice">
								<tr>
									<td id="choice_cont_id">
										<s:property value="#choice.row" />.&nbsp;&nbsp;
										<s:property value="#choice.q_content" />
									</td>
								</tr>							
							</s:iterator>
							<!-- 选择题-结束 -->
							
							<!-- 填空题-开始 -->
							<tr>
								<td id="completion_title_id">
									<div class="test-paper-little-title">
										<s:if test='map.question_subject == "英语"'>
											二、完形填空
										</s:if>
										<s:else>
											二、填空题
										</s:else>
									</div>
								</td>
							</tr>
							<s:iterator value="completionArr" id="completion">
								<tr>
									<td id="completion_cont_id">
										<s:property value="#completion.row" />.&nbsp;&nbsp;
										<s:property value="#completion.q_content" />
									</td>
								</tr>							
							</s:iterator>
							<!-- 填空题-结束 -->
							
							<!-- 当是 数学、物理、化学 试卷时 显示 -->
							<s:if test='map.question_subject == "数学" || 
								map.question_subject == "物理" || map.question_subject == "化学"'>
								<!-- 判断题-开始 -->
								<tr>
									<td id="judgment_title_id"><div class="test-paper-little-title">三、判断题</div></td>
								</tr>
								<s:iterator value="judgmentArr" id="judgment">
									<tr>
										<td id="judgment_cont_id">
											<s:property value="#judgment.row" />.&nbsp;&nbsp;
											<s:property value="#judgment.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 判断题-结束 -->
								
								<!-- 综合题-开始 -->
								<tr>
									<td id="comprehensive_title_id"><div class="test-paper-little-title">四、综合题</div></td>
								</tr>
								<s:iterator value="comprehensiveArr" id="comprehensive">
									<tr>
										<td id="comprehensive_cont_id">
											<s:property value="#comprehensive.row" />.&nbsp;&nbsp;
											<s:property value="#comprehensive.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 综合题-结束 -->
							</s:if>
							
							<!-- 当是 语文 试卷时 显示 -->
							<s:if test='map.question_subject == "语文"'>
								<!-- 古代文阅读-开始 -->
								<tr>
									<td id="comprehensive_title_id"><div class="test-paper-little-title">三、古诗文阅读</div></td>
								</tr>
								<s:iterator value="judgmentArr" id="judgment">
									<tr>
										<td id="comprehensive_cont_id">
											<s:property value="#judgment.row" />.&nbsp;&nbsp;
											<s:property value="#judgment.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 古代文阅读-结束 -->
								<!-- 现代文阅读-开始 -->
								<tr>
									<td id="comprehensive_title_id"><div class="test-paper-little-title">四、现代文阅读</div></td>
								</tr>
								<s:iterator value="modernReadArr" id="modernRead">
									<tr>
										<td id="comprehensive_cont_id">
											<s:property value="#modernRead.row" />.&nbsp;&nbsp;
											<s:property value="#modernRead.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 现代文阅读-结束 -->
							</s:if>
							
							<!-- 当是 英语 试卷时 显示 -->
							<s:if test='map.question_subject == "英语"'>
								<!-- 阅读理解-开始 -->
								<tr>
									<td id="comprehensive_title_id"><div class="test-paper-little-title">三、阅读理解</div></td>
								</tr>
								<s:iterator value="judgmentArr" id="judgment">
									<tr>
										<td id="comprehensive_cont_id">
											<s:property value="#judgment.row" />.&nbsp;&nbsp;
											<s:property value="#judgment.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 阅读理解-结束 -->
							</s:if>
							
							<!-- 当是 英语、语文 试卷时 显示 -->
							<s:if test='map.question_subject == "英语" || 
								map.question_subject == "语文"'>
								<!-- 作文-开始 -->
								<tr>
									<td id="comprehensive_title_id">
										<div class="test-paper-little-title">
											<s:if test='map.question_subject == "英语"'>
												四、作文
											</s:if>
											<s:elseif test='map.question_subject == "语文"'>
												五、作文
											</s:elseif>
										</div>
									</td>
								</tr>
								<s:iterator value="comprehensiveArr" id="comprehensive">
									<tr>
										<td id="comprehensive_cont_id">
											<s:property value="#comprehensive.row" />.&nbsp;&nbsp;
											<s:property value="#comprehensive.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 作文-结束 -->
							</s:if>
							
						</table>
					</div>				
					<!-- 试卷-结束 -->
					
				</div>				
				<!-- 题库生成-结束 -->
				
				<!-- 题目管理-开始 -->
				<div class="question_manage_content">
					<div class="res-up-down-title">所有题目</div>
					<div class="res-up-down-content">
						<table id="res_down_tab" cellpadding="0" cellspacing="0">
							<tr>
								<td>科目</td>
								<td>年级</td>
								<td>类型</td>
								<td>难度</td>
								<td>内容</td>
								<td>出题人</td>
								<td>出题时间</td>
								<td>操作</td>
							</tr>
							
							<s:iterator value="QuestionArr" id="question">
							
								<tr>
									<td><s:property value="#question.q_subject" /></td>
									<td><s:property value="#question.q_grade" /></td>
									<td><s:property value="#question.q_type" /></td>
									<td><s:property value="#question.q_difficult" /></td>
									<td>
										<div id="res_title_limit">
											<s:property value="#question.q_content" />
										</div>
									</td>
									<td><s:property value="#question.q_author" /></td>
									<td><s:property value="#question.public_time" /></td>
									<td>
										<a href='editQuestion?editques=1&questionID=<s:property value="#question.ID" />'>编辑</a>
										<a href='delQuestion?questionID=<s:property value="#question.ID" />'>删除</a>
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>
				<!-- 题目管理-结束 -->
				
				<!-- 题库管理-开始 -->
				<div class="question_list_manage_content">
					<div class="res-up-down-title">题库管理</div>
					<div class="res-up-down-content">
						<table id="res_down_tab" cellpadding="0" cellspacing="0">
							<tr>
								<td>科目</td>
								<td>试卷名</td>
								<td>年级</td>
								<td>难度</td>
								<td>出题人</td>
								<td>出题时间</td>
								<td>操作</td>
							</tr>
							
							<s:iterator value="QuestionListArr" id="questionList">
							
								<tr>
									<td><s:property value="#questionList.subject" /></td>
									<td><s:property value="#questionList.test_paper_name" /></td>
									<td><s:property value="#questionList.grade" /></td>
									<td><s:property value="#questionList.difficult" /></td>
									<td><s:property value="#questionList.author" /></td>
									<td><s:property value="#questionList.build_time" /></td>
									<td>
										<a href='getQuestionListDetail?
												quesDetailParam=1&
												questionBuildTime=<s:property value="#questionList.build_time" />&
												questionBuildSubject=<s:property value="#questionList.subject" />&
												questionBuildGrade=<s:property value="#questionList.grade" />&
												questionBuildName=<s:property value="#questionList.test_paper_name" />&
												questionBuildDifficult=<s:property value="#questionList.difficult" />'>
													查看详情
										</a>
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>
				<!-- 题库管理-结束 -->
				
				<!-- 题库管理-下属div -->
				<!-- 老师查看试卷-开始 -->
				<div class="question_list_detail_content">
					<div class="test_paper-title">生成的试卷</div>
					<div class="test_paper-title_name"><s:property value="map1.questionBuildName" /></div>
						<table class="test_paper_tab">
							<tr>
								<td>
									<div class="test_paper_explain_title">
										出题人：<s:property value="#session.username" />
										&nbsp;
										年级：<s:property value="map1.questionBuildGrade" />
										&nbsp;
										科目：<s:property value="map1.questionBuildSubject" />
										&nbsp;
										难度：<s:property value="map1.questionBuildDifficult" />
									</div>
								</td>
							</tr>
							
							<!-- 选择题-开始 -->
							<tr>
								<td id="choice_title_id"><div class="test-paper-little-title">一、选择题</div></td>
							</tr>
							<s:iterator value="tchoiceArr" id="tChoice">
								<tr>
									<td id="choice_cont_id">
										<s:property value="#tChoice.row" />.&nbsp;&nbsp;
										<s:property value="#tChoice.q_content" />
									</td>
								</tr>							
							</s:iterator>
							
							<%-- <s:iterator value="QuestionArr" id="tChoice">
								<tr>
									<td id="choice_cont_id">
										<s:property value="#tChoice.ID" />.&nbsp;&nbsp;
										<s:property value="#tChoice.q_content" />
									</td>
								</tr>							
							</s:iterator> --%>
							<!-- 选择题-结束 -->
							
							<!-- 填空题-开始 -->
							<tr>
								<td id="completion_title_id">
									<div class="test-paper-little-title">
										<s:if test='map1.questionBuildSubject == "英语"'>
											二、完形填空
										</s:if>
										<s:else>
											二、填空题
										</s:else>
									</div>
								</td>
							</tr>
							<s:iterator value="tcompletionArr" id="tCompletion">
								<tr>
									<td id="completion_cont_id">
										<s:property value="#tCompletion.row" />.&nbsp;&nbsp;
										<s:property value="#tCompletion.q_content" />
									</td>
								</tr>							
							</s:iterator>
							<!-- 填空题-结束 -->
							
							<!-- 当是 数学、物理、化学 试卷时 显示 -->
							<s:if test='map1.questionBuildSubject == "数学" || 
								map1.questionBuildSubject == "物理" || map1.questionBuildSubject == "化学"'>
								<!-- 判断题-开始 -->
								<tr>
									<td id="judgment_title_id"><div class="test-paper-little-title">三、判断题</div></td>
								</tr>
								<s:iterator value="tjudgmentArr" id="tJudgment">
									<tr>
										<td id="judgment_cont_id">
											<s:property value="#tJudgment.row" />.&nbsp;&nbsp;
											<s:property value="#tJudgment.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 判断题-结束 -->
								
								<!-- 综合题-开始 -->
								<tr>
									<td id="comprehensive_title_id"><div class="test-paper-little-title">四、综合题</div></td>
								</tr>
								<s:iterator value="tcomprehensiveArr" id="tComprehensive">
									<tr>
										<td id="comprehensive_cont_id">
											<s:property value="#tComprehensive.row" />.&nbsp;&nbsp;
											<s:property value="#tComprehensive.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 综合题-结束 -->
							</s:if>
							
							<!-- 当是 语文 试卷时 显示 -->
							<s:if test='map1.questionBuildSubject == "语文"'>
								<!-- 古代文阅读-开始 -->
								<tr>
									<td id="comprehensive_title_id"><div class="test-paper-little-title">三、古诗文阅读</div></td>
								</tr>
								<s:iterator value="tjudgmentArr" id="tJudgment">
									<tr>
										<td id="comprehensive_cont_id">
											<s:property value="#tJudgment.row" />.&nbsp;&nbsp;
											<s:property value="#tJudgment.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 古代文阅读-结束 -->
								<!-- 现代文阅读-开始 -->
								<tr>
									<td id="comprehensive_title_id"><div class="test-paper-little-title">四、现代文阅读</div></td>
								</tr>
								<s:iterator value="tmodernReadArr" id="tModernRead">
									<tr>
										<td id="comprehensive_cont_id">
											<s:property value="#tModernRead.row" />.&nbsp;&nbsp;
											<s:property value="#tModernRead.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 现代文阅读-结束 -->
							</s:if>
							
							<!-- 当是 英语 试卷时 显示 -->
							<s:if test='map1.questionBuildSubject == "英语"'>
								<!-- 阅读理解-开始 -->
								<tr>
									<td id="comprehensive_title_id"><div class="test-paper-little-title">三、阅读理解</div></td>
								</tr>
								<s:iterator value="tjudgmentArr" id="tJudgment">
									<tr>
										<td id="comprehensive_cont_id">
											<s:property value="#tJudgment.row" />.&nbsp;&nbsp;
											<s:property value="#tJudgment.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 阅读理解-结束 -->
							</s:if>
							
							<!-- 当是 英语、语文 试卷时 显示 -->
							<s:if test='map1.questionBuildSubject == "英语" || 
								map.question_subject == "语文"'>
								<!-- 作文-开始 -->
								<tr>
									<td id="comprehensive_title_id">
										<div class="test-paper-little-title">
											<s:if test='map1.questionBuildSubject == "英语"'>
												四、作文
											</s:if>
											<s:elseif test='map1.questionBuildSubject == "语文"'>
												五、作文
											</s:elseif>
										</div>
									</td>
								</tr>
								<s:iterator value="tcomprehensiveArr" id="tComprehensive">
									<tr>
										<td id="comprehensive_cont_id">
											<s:property value="#tComprehensive.row" />.&nbsp;&nbsp;
											<s:property value="#tComprehensive.q_content" />
										</td>
									</tr>							
								</s:iterator>
								<!-- 作文-结束 -->
							</s:if>
							
						</table>
					</div>				
					<!-- 老师查看试卷-结束 -->
				
			</div>
		
		</div>
		
	</s:elseif>

</div>

<div style="clear: both;"></div>

<%@ include file="../common/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	$(".nav-item-0").removeClass("cur");
	$(".nav-item-1").removeClass("cur");
	$(".nav-item-2").removeClass("cur");
	$(".nav-item-3").removeClass("cur");
	$(".nav-item-4").removeClass("cur");
	$(".nav-item-5").removeClass("cur");
	$(".nav-item-6").removeClass("cur");
	$(".nav-item-7").removeClass("cur");
	$(".nav-item-3").addClass("cur");

	//获取url中的参数
	var search_param = getUrlParam('editques');
	var build_test_paper_param = getUrlParam('build_test_paper_param');
	//当老师 查看 已经生成的 试卷 详情时
	var ques_detail_param = getUrlParam('quesDetailParam');
	//当老师编辑题目时
	if(search_param == 1){
		//说明此时编辑 题目
		//老师
		//显示 removeClass
		$(".question_up_content").addClass("div-visible");
		$(".question_edit_content").removeClass("div-visible");
		//隐藏 addClass
		$(".question_build_content").addClass("div-visible");
		$(".question_manage_content").addClass("div-visible");
		$(".question_list_manage_content").addClass("div-visible");
		$(".question_list_detail_content").addClass("div-visible");
		//老师
		//当页面刚载入时，将左侧的菜单条置为 选中 状态
		$(".nav-head-bar-1").removeClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-5").addClass("sch-left-active");
		$(".nav-head-bar-6").removeClass("sch-left-active");	

		//当老师编辑题目时，在编辑页面将选择框的初始值设置为数据库中的值
		$("#sel_subject_id").val($("#edit_subject_id").val());
		$("#sel_grade_id").val($("#edit_grade_id").val());
		$("#sel_type_id").val($("#edit_type_id").val());
		$("#sel_difficult_id").val($("#edit_difficult_id").val());
	} else if(build_test_paper_param == 1){
		//说明现在页面刚载入时，显示生成的试卷内容
		//老师
		//显示 removeClass
		$(".question_up_content").addClass("div-visible");
		$(".question_edit_content").addClass("div-visible");
		//隐藏 addClass
		$(".question_build_content").removeClass("div-visible");
		$(".test_paper_content").removeClass("div-visible");
		$(".question_manage_content").addClass("div-visible");
		$(".question_list_manage_content").addClass("div-visible");
		$(".question_list_detail_content").addClass("div-visible");
		//老师
		//当页面刚载入时，将左侧的菜单条置为 选中 状态
		$(".nav-head-bar-1").removeClass("sch-left-active");
		$(".nav-head-bar-2").addClass("sch-left-active");
		$(".nav-head-bar-5").removeClass("sch-left-active");
		$(".nav-head-bar-6").removeClass("sch-left-active");
	} else if(ques_detail_param == 1){
		//老师
		//显示 removeClass
		$(".question_up_content").addClass("div-visible");
		$(".question_edit_content").addClass("div-visible");
		//隐藏 addClass
		$(".question_build_content").addClass("div-visible");
		$(".test_paper_content").addClass("div-visible");
		$(".question_manage_content").addClass("div-visible");
		$(".question_list_manage_content").addClass("div-visible");
		$(".question_list_detail_content").removeClass("div-visible");
		//老师
		//当页面刚载入时，将左侧的菜单条置为 选中 状态
		$(".nav-head-bar-1").removeClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-5").removeClass("sch-left-active");
		$(".nav-head-bar-6").addClass("sch-left-active");
	} else {
		//老师
		//显示 removeClass
		$(".question_up_content").removeClass("div-visible");
		//只显示题型的一个select选择框
		$(".q-selected-chinese-type").removeClass("div-visible");		
		$(".q-selected-english-type").addClass("div-visible");		
		$(".q-math-phy-chem-type").addClass("div-visible");
		$(".question_edit_content").addClass("div-visible");
		//移除两个未显示的select的name属性，防止提交冲突
		$(".q-selected-chinese-type select").attr("name", "question_type");	
		$(".q-selected-english-type select").removeAttr("name");		
		$(".q-math-phy-chem-type select").removeAttr("name");
		//隐藏 addClass
		$(".question_build_content").addClass("div-visible");
		$(".test_paper_content").addClass("div-visible");
		$(".question_manage_content").addClass("div-visible");
		$(".question_list_manage_content").addClass("div-visible");
		$(".question_list_detail_content").addClass("div-visible");
		//老师
		//当页面刚载入时，将左侧的菜单条置为 选中 状态
		$(".nav-head-bar-1").addClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-5").removeClass("sch-left-active");
		$(".nav-head-bar-6").removeClass("sch-left-active");
	}

	//学生
	$(".resource_download_content_stu").removeClass("div-visible");
	$(".resource_homework_content_stu").addClass("div-visible");
	//学生
	$(".nav-head-bar-3").addClass("sch-left-active");
	$(".nav-head-bar-4").removeClass("sch-left-active");

	//alert(xx);
	if(search_param == 1){
		//学生
		$(".resource_download_content_stu").addClass("div-visible");
		$(".resource_homework_content_stu").removeClass("div-visible");

		//$(".all-hw").addClass("div-visible");
		//$(".search-hw").removeClass("div-visible");
		
		//学生
		$(".nav-head-bar-3").removeClass("sch-left-active");
		$(".nav-head-bar-4").addClass("sch-left-active");
	} else {
		//学生
		$(".resource_download_content_stu").removeClass("div-visible");
		$(".resource_homework_content_stu").addClass("div-visible");
		//学生
		$(".nav-head-bar-3").addClass("sch-left-active");
		$(".nav-head-bar-4").removeClass("sch-left-active");
	}

});

	//获取url中参数
	function getUrlParam(name) {
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	    if (r != null) return unescape(r[2]); return null; //返回参数值
	}

	$(function(){
		$(".nav").movebg({width:125/*滑块的大小*/,extra:40/*额外反弹的距离*/,speed:300/*滑块移动的速度*/,rebound_speed:400/*滑块反弹的速度*/});
	});

	/* 控制页面显示的内容 */
	//刚载入页面的时候，显示所有的div
	$(".nav-item-7").click(function(){
		//alert("主菜单被点击！");
		//老师端
		$(".question_up_content").removeClass("div-visible");
		//只显示题型的一个select选择框
		$(".q-selected-chinese-type").removeClass("div-visible");		
		$(".q-selected-english-type").addClass("div-visible");		
		$(".q-math-phy-chem-type").addClass("div-visible");
		//移除两个未显示的select的name属性，防止提交冲突
		$(".q-selected-chinese-type select").attr("name", "question_type");	
		$(".q-selected-english-type select").removeAttr("name");		
		$(".q-math-phy-chem-type select").removeAttr("name");		
		$(".question_edit_content").addClass("div-visible");
		$(".question_build_content").addClass("div-visible");
		$(".question_manage_content").addClass("div-visible");
		$(".question_list_manage_content").addClass("div-visible");
		$(".question_list_detail_content").addClass("div-visible");

		//学生端
		$(".resource_download_content_stu").removeClass("div-visible");
		$(".resource_homework_content_stu").addClass("div-visible");
		

		$(".nav-head-bar-1").addClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-5").removeClass("sch-left-active");
		$(".nav-head-bar-6").removeClass("sch-left-active");
		
		$(".nav-head-bar-3").addClass("sch-left-active");
		$(".nav-head-bar-4").removeClass("sch-left-active");
		
	});
	//当点击左侧 题库上传 菜单的时候，只显示题库上传 相应条目
	$(".ques-up-bar").click(function(){
		//alert("老师-题库上传");
		$(".question_up_content").removeClass("div-visible");
		//只显示题型的一个select选择框
		$(".q-selected-chinese-type").removeClass("div-visible");		
		$(".q-selected-english-type").addClass("div-visible");		
		$(".q-math-phy-chem-type").addClass("div-visible");
		//移除两个未显示的select的name属性，防止提交冲突
		$(".q-selected-chinese-type select").attr("name", "question_type");	
		$(".q-selected-english-type select").removeAttr("name");		
		$(".q-math-phy-chem-type select").removeAttr("name");
		$(".question_edit_content").addClass("div-visible");
		$(".question_build_content").addClass("div-visible");
		$(".question_manage_content").addClass("div-visible");
		$(".question_list_manage_content").addClass("div-visible");
		$(".question_list_detail_content").addClass("div-visible");

		$(".nav-head-bar-1").addClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-5").removeClass("sch-left-active");
		$(".nav-head-bar-6").removeClass("sch-left-active");
	});
	//当老师 点击左侧 题库生成 菜单的时候，只显示题库生成 相应条目
	$(".ques-build-bar").click(function(){
		//alert("老师-题库生成");
		$(".question_up_content").addClass("div-visible");
		$(".question_edit_content").addClass("div-visible");
		$(".question_build_content").removeClass("div-visible");
		$(".test_paper_content").addClass("div-visible");
		$(".question_manage_content").addClass("div-visible");
		$(".question_list_manage_content").addClass("div-visible");
		$(".question_list_detail_content").addClass("div-visible");

		$(".nav-head-bar-1").removeClass("sch-left-active");
		$(".nav-head-bar-2").addClass("sch-left-active");
		$(".nav-head-bar-5").removeClass("sch-left-active");
		$(".nav-head-bar-6").removeClass("sch-left-active");
	});
	//当老师 点击左侧 题目管理 菜单的时候，只显示题目管理 相应条目
	$(".ques-manage-bar").click(function(){
		//alert("老师-题库管理");
		$(".question_up_content").addClass("div-visible");
		$(".question_edit_content").addClass("div-visible");
		$(".question_build_content").addClass("div-visible");
		$(".question_manage_content").removeClass("div-visible");
		$(".question_list_manage_content").addClass("div-visible");
		$(".question_list_detail_content").addClass("div-visible");

		$(".nav-head-bar-1").removeClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-5").addClass("sch-left-active");
		$(".nav-head-bar-6").removeClass("sch-left-active");
	});
	//当老师 点击左侧 题库管理 菜单的时候，只显示题库管理 相应条目
	$(".ques-list-manage-bar").click(function(){
		//alert("老师-题库管理");
		$(".question_up_content").addClass("div-visible");
		$(".question_edit_content").addClass("div-visible");
		$(".question_build_content").addClass("div-visible");
		$(".question_manage_content").addClass("div-visible");
		$(".question_list_manage_content").removeClass("div-visible");
		$(".question_list_detail_content").addClass("div-visible");

		$(".nav-head-bar-1").removeClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-5").removeClass("sch-left-active");
		$(".nav-head-bar-6").addClass("sch-left-active");
	});
	//当老师 点击 题目管理 中的 编辑按钮时，显示 题目编辑页面
	$("#ques_edit").click(function(){
		//alert("老师-题库管理");
		$(".question_up_content").addClass("div-visible");
		$(".question_edit_content").removeClass("div-visible");
		$(".question_build_content").addClass("div-visible");
		$(".question_manage_content").addClass("div-visible");
		$(".question_list_manage_content").addClass("div-visible");
		$(".question_list_detail_content").addClass("div-visible");

		$(".nav-head-bar-1").removeClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-5").addClass("sch-left-active");
		$(".nav-head-bar-6").removeClass("sch-left-active");
	});
	//当老师 点击 题库管理 中的 查看详情按钮时，显示 该题库查看详情页面
	/* $("#ques_edit").click(function(){
		//alert("老师-题库管理");
		$(".question_up_content").addClass("div-visible");
		$(".question_edit_content").removeClass("div-visible");
		$(".question_build_content").addClass("div-visible");
		$(".question_manage_content").addClass("div-visible");
		$(".question_list_manage_content").addClass("div-visible");
		$(".question_list_detail_content").addClass("div-visible");

		$(".nav-head-bar-1").removeClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-5").addClass("sch-left-active");
		$(".nav-head-bar-6").removeClass("sch-left-active");
	}); */

	//当学生点击 资料下载 时
	$(".res-down-bar-stu").click(function(){
		//alert("学生-资料下载");
		$(".resource_download_content_stu").removeClass("div-visible");
		$(".resource_homework_content_stu").addClass("div-visible");

		$(".nav-head-bar-3").addClass("sch-left-active");
		$(".nav-head-bar-4").removeClass("sch-left-active");
	});
	//当学生点击 作业上传 时
	$(".res-homework-bar-stu").click(function(){
		//alert("学生-作业上传");
		$(".resource_download_content_stu").addClass("div-visible");
		$(".resource_homework_content_stu").removeClass("div-visible");

		$(".nav-head-bar-3").removeClass("sch-left-active");
		$(".nav-head-bar-4").addClass("sch-left-active");
	});

	//上传表单验证
	$(".btn-upload").click(function(){
		//alert($("#res_name").val());
		if($("#res_name").val() == ''){
			alert("警告：请输入文件名！");
			return false;
		} else if($("#res_desc").val() == ''){
			alert("警告：请输入文件描述！");
			return false;
		} else if($("#file_res").val() == ''){
			alert("警告：请选择文件！");
			return false;
		}
	});

	//在学生 作业上传 页面 搜索 作业
	$("#hw_btn").click(function(){

		var hw_grade_val = $(".hw-grade-select option:selected").val();
		var hw_subject_val = $(".hw-subject-select option:selected").val();

		$.ajax({
			url: "search_hw",
			type: "post",
			data: "hw_grade_val=" + hw_grade_val + "&hw_subject_val=" + hw_subject_val,
			contentType: "application/x-www-form-urlencoded; charset=utf-8", 
			success: function(){
				// 针对url参数中有中文乱码的问题，可以用contentType，但是对于下边的重定向操作，
				// 需要进行两次编码操作，后台再进行解码
				window.location.href = "teach_res?search_btn_click_param=1&hw_grade_val=" 
					+ hw_grade_val + "&hw_subject_val=" + encodeURI(encodeURI(hw_subject_val)); 
			}
		});
	}); 

	$("#q_subject_selected").change(function(){
		if($("#q_subject_selected option:selected").val() == '语文'){
			//alert("语文被选中");
			//只显示题型的一个select选择框
			$(".q-selected-chinese-type").removeClass("div-visible");		
			$(".q-selected-english-type").addClass("div-visible");		
			$(".q-math-phy-chem-type").addClass("div-visible");

			//移除两个未显示的select的name属性，防止提交冲突
			$(".q-selected-chinese-type select").attr("name", "question_type");		
			$(".q-selected-english-type select").removeAttr("name");		
			$(".q-math-phy-chem-type select").removeAttr("name");
		} else if($("#q_subject_selected option:selected").val() == '数学'){
			//alert("数学被选中");
			//只显示题型的一个select选择框
			$(".q-selected-chinese-type").addClass("div-visible");		
			$(".q-selected-english-type").addClass("div-visible");		
			$(".q-math-phy-chem-type").removeClass("div-visible");

			//移除两个未显示的select的name属性，防止提交冲突
			$(".q-selected-chinese-type select").removeAttr("name");	
			$(".q-selected-english-type select").removeAttr("name");		
			$(".q-math-phy-chem-type select").attr("name", "question_type");
		} else if($("#q_subject_selected option:selected").val() == '英语'){
			//alert("英语被选中");
			//只显示题型的一个select选择框
			$(".q-selected-chinese-type").addClass("div-visible");		
			$(".q-selected-english-type").removeClass("div-visible");		
			$(".q-math-phy-chem-type").addClass("div-visible");

			//移除两个未显示的select的name属性，防止提交冲突
			$(".q-selected-chinese-type select").removeAttr("name");	
			$(".q-selected-english-type select").attr("name", "question_type");	
			$(".q-math-phy-chem-type select").removeAttr("name");
		} else if($("#q_subject_selected option:selected").val() == '物理'){
			//alert("物理被选中");
			//只显示题型的一个select选择框
			$(".q-selected-chinese-type").addClass("div-visible");		
			$(".q-selected-english-type").addClass("div-visible");		
			$(".q-math-phy-chem-type").removeClass("div-visible");

			//移除两个未显示的select的name属性，防止提交冲突
			$(".q-selected-chinese-type select").removeAttr("name");	
			$(".q-selected-english-type select").removeAttr("name");		
			$(".q-math-phy-chem-type select").attr("name", "question_type");
		} else if($("#q_subject_selected option:selected").val() == '化学'){
			//alert("化学被选中");
			//只显示题型的一个select选择框
			$(".q-selected-chinese-type").addClass("div-visible");		
			$(".q-selected-english-type").addClass("div-visible");		
			$(".q-math-phy-chem-type").removeClass("div-visible");

			//移除两个未显示的select的name属性，防止提交冲突
			$(".q-selected-chinese-type select").removeAttr("name");	
			$(".q-selected-english-type select").removeAttr("name");		
			$(".q-math-phy-chem-type select").attr("name", "question_type");
		}
	});
	
</script>

</body>
</html>