<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>正在评教</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
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
	<div class="student-school-title">对<s:property value="teacherName" />老师-进行评教</div>
	
	<!-- 学生评教 -->
	<div class="student-school-main">
		<form action="do_evaluation" method="post">
		
		<input type="hidden" name="teacherID" value='<s:property value="teacherID" />' />
		
		<div class="success-message"><s:property value="successMessage"/></div>
		<div class="error-message"><s:property value="errorMessage"/></div>
		
		<table id="person_score_tab_evaluation">
			<tr>
				<td>备课能力：</td>
				<td>
					<div>
						<input type="radio" name="radiobutton1" value="100" />非常满意
						<input type="radio" name="radiobutton1" value="90" />比较满意
						<input type="radio" name="radiobutton1" value="80" />满意
						<input type="radio" name="radiobutton1" value="60" />及格
						<input type="radio" name="radiobutton1" value="50" />不及格
					</div>
				</td>
			</tr>
			
			<tr>
				<td>授课能力：</td>
				<td>
					<div>
						<input type="radio" name="radiobutton2" value="100" />非常满意
						<input type="radio" name="radiobutton2" value="90" />比较满意
						<input type="radio" name="radiobutton2" value="80" />满意
						<input type="radio" name="radiobutton2" value="60" />及格
						<input type="radio" name="radiobutton2" value="50" />不及格
					</div>
				</td>
			</tr>
			
			<tr>
				<td>专业知识：</td>
				<td>
					<div>
						<input type="radio" name="radiobutton3" value="100" />非常满意
						<input type="radio" name="radiobutton3" value="90" />比较满意
						<input type="radio" name="radiobutton3" value="80" />满意
						<input type="radio" name="radiobutton3" value="60" />及格
						<input type="radio" name="radiobutton3" value="50" />不及格
					</div>
				</td>
			</tr>
			
			<tr>
				<td>实践教授能力：</td>
				<td>
					<div>
						<input type="radio" name="radiobutton4" value="100" />非常满意
						<input type="radio" name="radiobutton4" value="90" />比较满意
						<input type="radio" name="radiobutton4" value="80" />满意
						<input type="radio" name="radiobutton4" value="60" />及格
						<input type="radio" name="radiobutton4" value="50" />不及格
					</div>
				</td>
			</tr>
			
			<tr>
				<td>作业布置能力：</td>
				<td>
					<div>
						<input type="radio" name="radiobutton5" value="100" />非常满意
						<input type="radio" name="radiobutton5" value="90" />比较满意
						<input type="radio" name="radiobutton5" value="80" />满意
						<input type="radio" name="radiobutton5" value="60" />及格
						<input type="radio" name="radiobutton5" value="50" />不及格
					</div>
				</td>
			</tr>
			
			<tr>
				<td>课程满意度：</td>
				<td>
					<div>
						<input type="radio" name="radiobutton6" value="100" />非常满意
						<input type="radio" name="radiobutton6" value="90" />比较满意
						<input type="radio" name="radiobutton6" value="80" />满意
						<input type="radio" name="radiobutton6" value="60" />及格
						<input type="radio" name="radiobutton6" value="50" />不及格
					</div>
				</td>
			</tr>
			
			<tr>
				<td>综合能力：</td>
				<td>
					<div>
						<input type="radio" name="radiobutton7" value="100" />非常满意
						<input type="radio" name="radiobutton7" value="90" />比较满意
						<input type="radio" name="radiobutton7" value="80" />满意
						<input type="radio" name="radiobutton7" value="60" />及格
						<input type="radio" name="radiobutton7" value="50" />不及格
					</div>
				</td>
			</tr>
		</table>
		<div class="evlua_btn">
			<div class="btn-stu-edit"><s:submit value="提交" class="btn"></s:submit></div>
			<div class="btn" id="calcel_deit_score"><a href="student_evaluation">返回</a></div>
		</div>
		</form>
	</div>
	
	
</s:if>

<!-- 当是老师登录的时候 -->
<s:elseif test="#session.curr_status == 1">
	<div class="student-school-title"><s:property value="#session.username" />老师-评教结果</div>
	
	<!-- 学生评教 -->
	<div class="student-school-main">
		<table id="person_score_tab_evaluation1">
			<tr>
				<td id="person_score_tab_evaluation1_td">教师姓名：</td>
				<td><s:property value="#session.username" /></td>
			</tr>
			<tr>
				<td>备课能力：</td>
				<td><s:property value="TeacherEvaluaByIDDetail.prepare" /></td>
			</tr>
			<tr>
				<td>授课能力：</td>
				<td><s:property value="TeacherEvaluaByIDDetail.teach" /></td>
			</tr>
			<tr>
				<td>专业知识：</td>
				<td><s:property value="TeacherEvaluaByIDDetail.professional" /></td>
			</tr>
			<tr>
				<td>实践教授能力：</td>
				<td><s:property value="TeacherEvaluaByIDDetail.practical" /></td>
			</tr>
			<tr>
				<td>作业布置能力：</td>
				<td><s:property value="TeacherEvaluaByIDDetail.task" /></td>
			</tr>
			<tr>
				<td>课程满意度：</td>
				<td><s:property value="TeacherEvaluaByIDDetail.course" /></td>
			</tr>
			<tr>
				<td>综合能力：</td>
				<td><s:property value="TeacherEvaluaByIDDetail.comprehensive" /></td>
			</tr>
			<tr>
				<td>最终平均分：</td>
				<td><s:property value="TeacherEvaluaByIDDetail.total_avg" /></td>
			</tr>
		</table>
	</div>
	
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
		$(".nav-item-4").addClass("cur");
	});
	$(function(){
		$(".nav").movebg({width:125/*滑块的大小*/,extra:40/*额外反弹的距离*/,speed:300/*滑块移动的速度*/,rebound_speed:400/*滑块反弹的速度*/});
	});
</script>
</body>
</html>