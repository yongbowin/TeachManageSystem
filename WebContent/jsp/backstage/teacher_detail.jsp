<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>老师详情</title>
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
	
	<s:form class="user-detail-content" action="admin_edit_teacher_detail" method="post">
		<input type="hidden" name="teacherID" value='<s:property value="teacherID" />' />
		
		<div class="user-detail-title"><s:property value="teacher_detail.t_name" />-老师信息</div>
		
		<div class="success-message"><s:property value="successMessage"/></div>
		<div class="error-message"><s:property value="errorMessage"/></div>
	
		<div class="user-detail-content">
			<table>
			
				<tr>
					<td>姓名：</td>
					<td><input value='<s:property value="teacher_detail.t_name" />' name="t_name" type="text" /></td>
				</tr>
				
				<tr>
					<td>性别：</td>
					<td><input value='<s:property value="teacher_detail.t_sex" />' name="t_sex" type="text" /></td>
				</tr>
				
				<tr>
					<td>工号：</td>
					<td><input value='<s:property value="teacher_detail.t_number" />' name="t_number" type="text" /></td>
				</tr>
				
				<tr>
					<td>职称：</td>
					<td><input value='<s:property value="teacher_detail.t_title" />' name="t_title" type="text" /></td>
				</tr>
				
				<tr>
					<td>学科：</td>
					<td><input value='<s:property value="teacher_detail.t_subject" />' name="t_subject" type="text" /></td>
				</tr>
				
				<tr>
					<td>联系方式：</td>
					<td><input value='<s:property value="teacher_detail.t_phone" />' name="t_phone" type="text" /></td>
				</tr>
				
				<tr>
					<td>生日：</td>
					<td><input value='<s:property value="teacher_detail.t_birthday" />' name="t_birthday" type="text" /></td>
				</tr>
				
				<tr>
					<td>注册时间：</td>
					<td><s:property value="teacher_detail.t_register_time" /></td>
				</tr>
			</table>
			<div class="btn-stu-edit"><s:submit value="保存" class="btn"></s:submit></div>
			<div class="btn" id="calcel_deit_score"><a href="b_user_manage">返回</a></div>
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