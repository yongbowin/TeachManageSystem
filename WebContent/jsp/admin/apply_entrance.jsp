<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小升初报名</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="sign-up-entrance-main">
	<div class="sign-up-word">请填写真实信息</div>
	<div class="sign_up_entrance-content">
		<form class="sign-up-form" action="do_apply_entrance" method="post">
			
			<div class="sign-up-user-name"><s:textfield name="apply_name" label="学生姓名"></s:textfield></div>
			<div class="sign-up-radio-btn">
			性&nbsp;&nbsp;别：&nbsp;
			<select name="apply_sex">
				<option value="男">男</option>
				<option value="女">女</option>
			</select>
			</div>
			<div class="sign-up-user-birthday"><s:textfield name="apply_birthday" label="出生日期"></s:textfield></div>
			<div class="sign-up-user-phone"><s:textfield name="apply_phone" label="联系方式"></s:textfield></div>
			<div class="sign-up-user-graduate"><s:textfield name="apply_graduate" label="毕业学校"></s:textfield></div>
			<div class="sign-up-user-address"><s:textfield name="apply_address" label="家庭住址"></s:textfield></div>
			<div class="sign-up-pass-password"><s:password name="apply_password" label="设置密码"></s:password></div>
			
			<div class="sign-up-register-div">
				<s:submit class="btn" value="报名"></s:submit>
			</div>
			
			<div class="apply-success-message"><s:property value="successMessage"/></div>
			<div class="apply-error-message"><s:property value="errorMessage"/></div>
			
		</form>
	</div>
	<div class="sign-up-entrance">—<a href="login">返回</a>—</div>
</div>

</body>
</html>