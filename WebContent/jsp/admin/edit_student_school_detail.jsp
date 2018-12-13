<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生学籍</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/jq22.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.movebg.js"></script>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class="content-main">
	<div class="student-school-title"><s:property value="student_detail.s_name" />-学生学籍</div>
	
	<!-- 显示 学生学籍 详细信息 -->
	<div class="student-school-main">
	
	<s:form class="user-detail-content" action="do_edit_student_school_detail" method="post">
		<input type="hidden" name="studentID" value='<s:property value="student_detail.ID" />' />
		
		<div class="success-message"><s:property value="successMessage"/></div>
		<div class="error-message"><s:property value="errorMessage"/></div>
		
		<table>
			<tr>
				<td>姓名：</td>
				<td><input value='<s:property value="student_detail.s_name" />' name="s_name" type="text" /></td>
			</tr>
			
			<tr>
				<td>性别：</td>
				<td><input value='<s:property value="student_detail.s_sex" />' name="s_sex" type="text" /></td>
			</tr>
			
			<tr>
				<td>学号：</td>
				<td><input value='<s:property value="student_detail.s_number" />' name="s_number" type="text" /></td>
			</tr>
			
			<tr>
				<td>出生日期：</td>
				<td><input value='<s:property value="student_detail.s_birthday" />' name="s_birthday" type="text" /></td>
			</tr>
			
			<tr>
				<td>入学日期：</td>
				<td><input value='<s:property value="student_detail.s_enter" />' name="s_enter" type="text" /></td>
			</tr>
			
			<tr>
				<td>年级：</td>
				<td><input value='<s:property value="student_detail.s_grade" />' name="s_grade" type="text" /></td>
			</tr>
			
			<tr>
				<td>联系方式：</td>
				<td><input value='<s:property value="student_detail.s_phone" />' name="s_phone" type="text" /></td>
			</tr>
			
			<tr>
				<td>毕业学校：</td>
				<td><input value='<s:property value="student_detail.s_graduate" />' name="s_graduate" type="text" /></td>
			</tr>
			
			<tr>
				<td>家庭住址：</td>
				<td><input value='<s:property value="student_detail.s_address" />' name="s_address" type="text" /></td>
			</tr>
			
			<tr>
				<td>注册时间：</td>
				<td><s:property value="student_detail.s_register_time" /></td>
			</tr>
			
		</table>
		<div class="edit-school-tr">
			<div class="btn-stu-school-edit"><s:submit value="保存" class="btn"></s:submit></div>
			<div class="btn" id="cancel_edit_school"><a href="student_school_detail">返回</a></div>
		</div>
		</s:form>
	</div>

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
		$(".nav-item-0").addClass("cur");
	});
	$(function(){
		$(".nav").movebg({width:125/*滑块的大小*/,extra:40/*额外反弹的距离*/,speed:300/*滑块移动的速度*/,rebound_speed:400/*滑块反弹的速度*/});
	});
</script>
</body>
</html>