<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我要留言</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/jq22.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.movebg.js"></script>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class="content-main">
	<div class="message-title">留言板</div>
	<!-- 显示留言列表 -->
	<s:iterator value="messageArr" id="message">
		<div class="message-list">
			<!-- 评论人 -->
			<div class="message-list-1">
				<div class="message-list-1-1">
					用户名：<s:property value="#message.username"/>
				</div>
				<div class="message-list-1-2">
					第<s:property value=""/>楼
				</div>
			</div>
			<!-- 评论内容 -->
			<div class="message-list-2">
				<s:property value="#message.msg_text"/>
			</div>
			<!-- 评论时间 -->
			<div class="message-list-3">
				<div class="message-list-3-1">
					评论时间：<s:property value="#message.msg_time"/>
				</div>
			</div>
		
		</div>
	</s:iterator>
	
	
	<!-- 自己写留言 -->
	<form action="do_message" method="post">
		<div class="success-message"><s:property value="successMessage"/></div>
		<div class="error-message"><s:property value="errorMessage"/></div>
		<div class="message-write">
			<div class="send-message-name">我要留言</div>
			<s:textarea id="msg_content_id" name="msg_content"></s:textarea>
		</div>
		<div class="msg-btn"><s:submit id="msg_btn" class="btn" value="发表"></s:submit></div>
		
	</form>

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
		$(".nav-item-6").addClass("cur");
	});
	$(function(){
		$(".nav").movebg({width:125/*滑块的大小*/,extra:40/*额外反弹的距离*/,speed:300/*滑块移动的速度*/,rebound_speed:400/*滑块反弹的速度*/});
	});
</script>

</body>
</html>