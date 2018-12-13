<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="login-main">
	<div class="wel-word">欢迎登录教学管理系统</div>
	<div class="login-content">
		<form action="do_login" method="post">
			<div class="login-sub">
				<div class="login-sub-sub">
					<div class="user-name"><s:textfield name="username" label="用户名"></s:textfield></div>
					<div class="pass-word"><s:password name="password" label="密  码"></s:password></div>
				</div>
				<div class="radio-btn">
					登录身份：
					<select name="identity_login">
						<option value="0">学生</option>
						<option value="1">教师</option>
						<option value="2">管理员</option>
					</select>
				</div>
				<div class="sign-div">
					<div class="sign-div-login">
						<s:submit class="btn" value="登录"></s:submit>
					</div>
					<div class="sign-div-register">
						<a href="register">我要注册</a>
					</div>
				</div>
			</div>
		</form>
		<div class="error-message" style="text-align: center;">
			<s:property value="errorMessage"/>
		</div>
	</div>
	<div class="sign-up-entrance">——><a href="sign_up_entrance">小升初报名入口...</a></div>
	<div class="sign-up-entrance">——><a href="check_result_entrance">小升初审核结果...</a></div>
</div>

<script type="text/javascript">

	

</script>

</body>
</html>