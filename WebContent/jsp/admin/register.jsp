<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="login-main">
	<div class="wel-word">欢迎注册</div>
	<div class="login-content">
		<form action="do_register" method="post">
			<div class="login-sub">
				<div class="login-sub-sub">
					<div class="user-name"><s:textfield name="username" label="用户名"></s:textfield></div>
					<div class="pass-word"><s:password name="password" label="密  码"></s:password></div>
				</div>
				<div class="radio-btn">
					选择身份：
					<select name="identity_register">
						<option value="0">学生</option>
						<option value="1">教师</option>
					</select>
				</div>
				<div class="register-div">
					<s:submit class="btn" value="注册"></s:submit>
				</div>
			</div>
		</form>
	</div>
</div>

</body>
</html>