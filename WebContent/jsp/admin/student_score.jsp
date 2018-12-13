<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生成绩</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/jq22.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.movebg.js"></script>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class="content-main">

<!-- 判断是老师登录还是学生登录 -->
<!-- 当是学生登录的时候 -->
<s:if test="#session.curr_status == 0">
	<div class="student-school-title"><s:property value="student_score_detail.s_name" />-成绩单</div>
	
	<!-- 显示 学生学籍 详细信息 -->
	<div class="student-school-main">
	
		<div class="stu_sc_title">
			<div class="stu_sc_num">
				学号：&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="student_score_detail.student_id" />
			</div>
			<div class="stu_sc_grade">
				年级：&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="student_score_detail.s_grade" />
			</div>
			<div class="stu_sc_sum">
				总成绩：&nbsp;&nbsp;<s:property value="student_score_detail.sum" />
			</div>
			<div class="stu_sc_pm">
				年级排名：<s:property value="student_score_ranking_detail.sum_pm" />
			</div>
		</div>
		
		<div class="person_score_line"></div>
		
		<table id="person_score_tab" class="person_score_tab_modify">
			<tr>
				<td>课程</td>
				<td>分数</td>
				<td>单科排名</td>
			</tr>
			
			<tr>
				<td>语文</td>
				<td><s:property value="student_score_detail.chinese_course" /></td>
				<td><s:property value="student_score_ranking_detail.chinese_pm" /></td>
			</tr>
			
			<tr>
				<td>数学</td>
				<td><s:property value="student_score_detail.math_course" /></td>
				<td><s:property value="student_score_ranking_detail.math_pm" /></td>
			</tr>
			
			<tr>
				<td>英语</td>
				<td><s:property value="student_score_detail.english_course" /></td>
				<td><s:property value="student_score_ranking_detail.english_pm" /></td>
			</tr>
			
			<tr>
				<td>物理</td>
				<td><s:property value="student_score_detail.physics_course" /></td>
				<td><s:property value="student_score_ranking_detail.physics_pm" /></td>
			</tr>
			
			<tr>
				<td>化学</td>
				<td><s:property value="student_score_detail.chemistry_course" /></td>
				<td><s:property value="student_score_ranking_detail.chemistry_pm" /></td>
			</tr>
		</table>
	</div>
</s:if>

<!-- 当是老师登录的时候 -->
<s:elseif test="#session.curr_status == 1">

	<div class="choise-search">
		<div class="choise-search-classify">
		选择类型：
		<select class="choise-search-select" name="choise_search_select_grade">
			<option value="-1">所有年级</option>
			<option value="7">7年级</option>
			<option value="8">8年级</option>
			<option value="9">9年级</option>
		</select>
		</div>
		<div class="btn-search b-user-search" id="search_grade_classify">搜索</div>
		
	</div>

	<!-- 当选择查看所有年级学生的成绩的时候 -->
	<s:if test="#session.common_grade_selected == -1 || #session.common_grade_selected == null">
		<div class="student-school-title">所有年级-学生成绩汇总</div>
		<!-- 显示 所有学生 成绩信息 -->
		<div class="student-school-main-score">
			<table class="user-result-tab" cellpadding="0" cellspacing="0">
				<tr>
					<td id="score_id">姓名</td>
					<td id="score_id">学号</td>
					<td id="score_id_1">语文</td>
					<td id="score_id_1">数学</td>
					<td id="score_id_1">英语</td>
					<td id="score_id_1">物理</td>
					<td id="score_id_1">化学</td>
					<td id="score_id_1">年级</td>
					<td id="score_id_1">总分</td>
				</tr>
				
				<!-- 报名学生列表 -->
				<s:iterator value="BScoreArr" id="bScore">
					<tr>
						<td><s:property value="#bScore.s_name" /></td>
						<td><s:property value="#bScore.s_number" /></td>
						<td><s:property value="#bScore.chinese_course" /></td>
						<td><s:property value="#bScore.math_course" /></td>
						<td><s:property value="#bScore.english_course" /></td>
						<td><s:property value="#bScore.physics_course" /></td>
						<td><s:property value="#bScore.chemistry_course" /></td>
						<td><s:property value="#bScore.s_grade" /></td>
						<td><s:property value="#bScore.sum" /></td>
					</tr>
				</s:iterator>
					
			</table>
		</div>
	</s:if>
	
	<!-- 当选择查看某个年级学生的成绩的时候,显示排名情况 -->
	<s:else>
		<div class="student-school-title">
			<s:if test="#session.common_grade_selected == 7">
				7年级-学生成绩汇总
			</s:if>
			<s:elseif test="#session.common_grade_selected == 8">
				8年级-学生成绩汇总
			</s:elseif>
			<s:elseif test="#session.common_grade_selected == 9">
				9年级-学生成绩汇总
			</s:elseif>
		</div>
		<!-- 显示 所有学生 成绩信息 -->
		<div class="student-school-main-score">
			<table class="user-result-tab" cellpadding="0" cellspacing="0">
				<tr>
					<td id="score_id">姓名</td>
					<td id="score_id">学号</td>
					<td id="score_id_1">语文</td>
					<td id="score_id_1">数学</td>
					<td id="score_id_1">英语</td>
					<td id="score_id_1">物理</td>
					<td id="score_id_1">化学</td>
					<td id="score_id_1">年级</td>
					<td id="score_id_1">总分</td>
					<td id="score_id_1">排名</td>
				</tr>
				
				<!-- 报名学生列表 -->
				<s:iterator value="ScoreGradeArr" id="scoreGrade">
					<tr>
						<td><s:property value="#scoreGrade.name" /></td>
						<td><s:property value="#scoreGrade.student_id" /></td>
						<td><s:property value="#scoreGrade.chinese_course" /></td>
						<td><s:property value="#scoreGrade.math_course" /></td>
						<td><s:property value="#scoreGrade.english_course" /></td>
						<td><s:property value="#scoreGrade.physics_course" /></td>
						<td><s:property value="#scoreGrade.chemistry_course" /></td>
						<td><s:property value="#scoreGrade.sc_grade" /></td>
						<td><s:property value="#scoreGrade.sum" /></td>
						<td><s:property value="#scoreGrade.sum_pm" /></td>
					</tr>
				</s:iterator>
					
			</table>
		</div>
	</s:else>
	
</s:elseif>
</div>

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
	$(".nav-item-5").addClass("cur");
});
	$(function(){
		$(".nav").movebg({width:125/*滑块的大小*/,extra:40/*额外反弹的距离*/,speed:300/*滑块移动的速度*/,rebound_speed:400/*滑块反弹的速度*/});
	});

	$("#search_grade_classify").click(function(){

		var classify_grade_status = $(".choise-search-select option:selected").val();

		$.ajax({
			url: "grade_classify",
			type: "post",
			data: "search_selected_grade=" + classify_grade_status,
			success: function(){
				window.location.href = "search_grade_classify";
			}
		});
	}); 

</script>

</body>
</html>