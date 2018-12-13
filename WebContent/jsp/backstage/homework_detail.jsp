<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作业详情</title>
<link href="css/backstage/backstage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
</head>
<body>
<!-- 后台页面顶部 -->
<div class="content-top">
	<div class="b-current-user">当前用户：<s:property value="#session.username"/></div>
	<div class="backstage-title">教学管理系统-后台</div>
</div>

<!-- 后台页面中部 -->
<div class="content-center">

	<%@ include file="../b-common/b_nav.jsp" %>
	
	<!-- 后台右侧页面 -->
	<div class="content-right">
	
	<div class="user-detail-content">
		<input type="hidden" name="hwID" value='<s:property value="hwID" />' />
		
		<div class="user-detail-title">
			<s:property value="homework_detail.hw_grade" />年级-
			<s:property value="homework_detail.hw_subject" />作业-详细信息
		</div>
		
		<div class="success-message"><s:property value="successMessage"/></div>
		<div class="error-message"><s:property value="errorMessage"/></div>
		
		<div>
			<table>
			
				<tr>
					<td>课程：</td>
					<td><s:property value="homework_detail.hw_subject" /></td>
				</tr>
			
				<tr>
					<td>年级：</td>
					<td><s:property value="homework_detail.hw_grade" /></td>
				</tr>
			
				<tr>
					<td>开始时间：</td>
					<td><s:property value="homework_detail.hw_start_time" /></td>
				</tr>
			
				<tr>
					<td>结束时间：</td>
					<td><s:property value="homework_detail.hw_end_time" /></td>
				</tr>
			
				<tr>
					<td>发布人：</td>
					<td><s:property value="homework_detail.teacher_name" /></td>
				</tr>
			
				<tr>
					<td>发布时间：</td>
					<td><s:property value="homework_detail.public_time" /></td>
				</tr>
			
				<tr>
					<td>题目：</td>
					<td><s:property value="homework_detail.hw_title" /></td>
				</tr>
			
			</table>
			<div class="btn" id="calcel_deit_score"><a href="b_hw_manage">返回</a></div>
		</div>
		</div>
	</div>
</div>

<!-- 后台页面底部 -->
<div class="content-bottom"></div>

<script type="text/javascript">


</script>

</body>
</html>