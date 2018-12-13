<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生成绩</title>
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
	
	<s:form class="user-detail-content" action="do_add_score" method="post">
		
		<div class="user-detail-title">录入学生成绩</div>
		
		<div class="success-message"><s:property value="successMessage"/></div>
		<div class="error-message"><s:property value="errorMessage"/></div>
		
		<div>
			<table>
			
				<tr>
					<td>学号：</td>
					<td><input value='<s:property value="student_score_detail.s_number" />' name="s_number" type="text" /></td>
				</tr>
				
				<tr>
					<td>语文：</td>
					<td><input value='<s:property value="student_score_detail.chinese_course" />' name="chinese_course" type="text" /></td>
				</tr>
				
				<tr>
					<td>数学：</td>
					<td><input value='<s:property value="student_score_detail.math_course" />' name="math_course" type="text" /></td>
				</tr>
				
				<tr>
					<td>英语：</td>
					<td><input value='<s:property value="student_score_detail.english_course" />' name="english_course" type="text" /></td>
				</tr>
				
				<tr>
					<td>物理：</td>
					<td><input value='<s:property value="student_score_detail.physics_course" />' name="physics_course" type="text" /></td>
				</tr>
				
				<tr>
					<td>化学：</td>
					<td><input value='<s:property value="student_score_detail.chemistry_course" />' name="chemistry_course" type="text" /></td>
				</tr>
				
			</table>
			<div class="btn-stu-edit"><s:submit value="保存" class="btn"></s:submit></div>
			<div class="btn" id="calcel_deit_score"><a href="cancel_add_score">返回</a></div>
		</div>
		</s:form>
	</div>
</div>

<!-- 后台页面底部 -->
<div class="content-bottom"></div>

<script type="text/javascript">


</script>

</body>
</html>