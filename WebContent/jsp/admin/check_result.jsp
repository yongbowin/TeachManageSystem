<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小升初审核结果</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
</head>
<body>

<div class="login-main">
	<div class="wel-word">查看报名审核结果</div>
	<div class="login-content">
		<div class="login-sub">
			<div class="login-sub-sub">
				<div class="user-name"><s:textfield id="user_name" name="username" label="用户名"></s:textfield></div>
				<div class="pass-word"><s:password id="pass_word" name="password" label="密  码"></s:password></div>
			</div>
			<div class="sign-div" style="margin: 0 auto;width: 80px;">
				<div class="sign-div-login" style="margin: 0 auto;width: 80px;">
					<div class="btn">查看</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	$(".btn").click(function(){
		// 该学生的id
		var user_name = $("#user_name").val();
		var pass_word = $("#pass_word").val();
		//alert(user_name);
		//alert(pass_word);
		$.ajax({
			url: "check_result_entr",
			type: "post",
			data: "userName=" + user_name + "&passWord=" + pass_word,
			success: function(json){
				alert(decodeURIComponent(json));
			}
		});
	});


</script>

</body>
</html>