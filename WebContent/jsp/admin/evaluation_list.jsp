<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生评教</title>
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
	<div class="student-school-title"><s:property value="#session.username" />-评教</div>
	
	<!-- 显示 老师 列表 -->
	<div class="student-school-main">
		<table id="person_score_tab_s" cellpadding="0" cellspacing="0">
			<tr>
				<td>教师工号</td>
				<td>教师姓名</td>
				<td>教师性别</td>
				<td>教师职称</td>
				<td>教授科目</td>
				<td>操作</td>
			</tr>
			
			<s:iterator value="BTeacherArr" id="teacher">
			
				<tr>
					<td><s:property value="#teacher.t_number" /></td>
					<td><s:property value="#teacher.t_name" /></td>
					<td><s:property value="#teacher.t_sex" /></td>
					<td><s:property value="#teacher.t_title" /></td>
					<td><s:property value="#teacher.t_subject" /></td>
					<td id="evalua_status">
						<input type="hidden" class="teacher-ID" name="teacher_ID" value='<s:property value="#teacher.ID" />' />
						<a href='start_evaluation?
						teacherID=<s:property value="#teacher.ID" />&
						teacherName=<s:property value="#teacher.t_name" />'>
							开始评教
						</a>
					</td>
				</tr>
			</s:iterator>
			
		</table>
	</div>
</s:if>

<!-- 当是老师登录的时候 -->
<s:elseif test="#session.curr_status == 1">

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
	
/* 当刚载入页面时，判断该学生是否已经对某位老师进行评教，如果已经评教，则将评教的链接变为 “已评教” */
	$(document).ready(function(){
	
		$.ajax({

			url: "check_evalua_status",
			type: "post",
			dataType: "json",
			success: function(json){
				for(var jsonIterator in json){
					//对input中的值进行遍历
					$(".teacher-ID").each(function(){
						/* 对后台传来的JSONArray数组进行遍历 */
						if(this.value == json[jsonIterator] && json[jsonIterator] != null){
							$(this).parent().html("已评教");
						}
					});
				}
			}
		});
	});

</script>

</body>
</html>