<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻公告</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/jq22.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.movebg.js"></script>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class="content-main">
	<div class="common_news_crumb">
		<a href="index">首页</a>&nbsp;&gt;&gt;&nbsp;
		<s:if test="getCommonDetail.type == 0">
			学校快闻
		</s:if>
		<s:elseif test="getCommonDetail.type == 1">
			通知公告
		</s:elseif>
		<s:elseif test="getCommonDetail.type == 2">
			规章制度
		</s:elseif>
	</div>

	<div class="student-school-title">
		<s:if test="getCommonDetail.type == 0">
			学校快闻
		</s:if>
		<s:elseif test="getCommonDetail.type == 1">
			通知公告
		</s:elseif>
		<s:elseif test="getCommonDetail.type == 2">
			规章制度
		</s:elseif>
	</div>
	
	<!-- 显示 新闻公告 详细信息 -->
	<div class="student-school-main">
	
		<div class="common-news-title"><s:property value="getCommonDetail.title" /></div>
		<div class="common-news-msg">
			<div class="common-news-author">作者：<s:property value="getCommonDetail.author" /></div>
			<div class="common-news-time">时间：<s:property value="getCommonDetail.public_time" /></div>
		</div>
		<div class="common-news-content">&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="getCommonDetail.content" /></div>
	
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
	$(".nav-item-1").addClass("cur");
});
	$(function(){
		$(".nav").movebg({width:125/*滑块的大小*/,extra:40/*额外反弹的距离*/,speed:300/*滑块移动的速度*/,rebound_speed:400/*滑块反弹的速度*/});
	});

</script>

</body>
</html>