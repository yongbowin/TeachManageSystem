<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作业上传</title>
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
		<div class="student-school-title">作业详情</div>
	
		<!-- 显示 学生学籍 详细信息 -->
		<div class="student-school-main">
			<table>
				<tr>
					<td>布置老师：</td>
					<td><s:property value="get_hw_detail.teacher_name" /></td>
				</tr>
				<tr>
					<td>年级：</td>
					<td><s:property value="get_hw_detail.hw_grade" /></td>
				</tr>
				<tr>
					<td>科目：</td>
					<td><s:property value="get_hw_detail.hw_subject" /></td>
				</tr>
				<tr>
					<td>开始时间：</td>
					<td><s:property value="get_hw_detail.hw_start_time" /></td>
				</tr>
				<tr>
					<td>结束时间：</td>
					<td><s:property value="get_hw_detail.hw_end_time" /></td>
				</tr>
				<tr>
					<td>题目：</td>
					<td id="hw_con_auto"><s:property value="get_hw_detail.hw_title" /></td>
				</tr>
				<tr>
					<td>上次提交的答案是：</td>
					<td id="hw_con_auto"><s:property value="get_hw_answer_detail.answer" /></td>
				</tr>
			</table>
			
			<s:form action="hw_submit" method="post">
				<input type="hidden" value='<s:property value="get_hw_detail.ID" />' name="HWID" >
				<div class="hw-detail">
					<div class="hw_submit_content">
						<s:textarea id="hw_content_id" name="hw_answer">
						</s:textarea>
					</div>
					
					<div class="btn-hw-edit">
						<s:submit value="提交" class="btn"></s:submit>
					</div>
				</div>
			</s:form>
			
		</div>
	
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
	$(".nav-item-2").addClass("cur");
});
	$(function(){
		$(".nav").movebg({width:125/*滑块的大小*/,extra:40/*额外反弹的距离*/,speed:300/*滑块移动的速度*/,rebound_speed:400/*滑块反弹的速度*/});
	}); 

</script>

</body>
</html>