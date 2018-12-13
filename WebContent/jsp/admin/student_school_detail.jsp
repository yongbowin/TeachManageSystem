<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生学籍</title>
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
		<table>
			<tr>
				<td>姓名：</td>
				<td><s:property value="student_detail.s_name" /></td>
			</tr>
			
			<tr>
				<td>性别：</td>
				<td><s:property value="student_detail.s_sex" /></td>
			</tr>
			
			<tr>
				<td>学号：</td>
				<td><s:property value="student_detail.s_number" /></td>
			</tr>
			
			<tr>
				<td>出生日期：</td>
				<td><s:property value="student_detail.s_birthday" /></td>
			</tr>
			
			<tr>
				<td>入学日期：</td>
				<td><s:property value="student_detail.s_enter" /></td>
			</tr>
			
			<tr>
				<td>年级：</td>
				<td><s:property value="student_detail.s_grade" /></td>
			</tr>
			
			<tr>
				<td>联系方式：</td>
				<td><s:property value="student_detail.s_phone" /></td>
			</tr>
			
			<tr>
				<td>毕业学校：</td>
				<td><s:property value="student_detail.s_graduate" /></td>
			</tr>
			
			<tr>
				<td>家庭住址：</td>
				<td><s:property value="student_detail.s_address" /></td>
			</tr>
			
			<tr>
				<td>注册时间：</td>
				<td><s:property value="student_detail.s_register_time" /></td>
			</tr>
			
			<tr>
				<td>
					<div class="btn">
						<a href="edit_student_school_detail">修改</a>
					</div>
				</td>
				<td></td>
			</tr>
		</table>
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