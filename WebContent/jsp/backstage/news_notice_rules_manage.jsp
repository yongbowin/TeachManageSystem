<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻公告</title>
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

		<div class="news-notice-rules-select">
			<div class="b-news">学校快闻</div>
			<div class="b-notice">通知公告</div>
			<div class="b-rules">规章制度</div>
		</div>
		
		<!-- 学校快闻 -->
		<div class="b-news-content">
			<div class="common-news-title">
				<div class="add-common-news"><a href="add_common_item?type=0">+添加新闻</a></div>
				<div class="common-news-word">学院快闻管理</div>
			</div>
			<table class="b-news-content-tab" cellpadding="0" cellspacing="0">
				<tr>
					<td id="article_title">标题</td>
					<td id="article_author">作者</td>
					<td id="article_content">内容</td>
					<td id="article_time">发布时间</td>
					<td id="article_oper">操作</td>
				</tr>
				
				<s:iterator value="NewsArr" id="news">
					<tr>
						<td><div id="article_title_limit"><s:property value="#news.title" /></div></td>
						<td><s:property value="#news.author" /></td>
						<td><div id="article_content_limit"><s:property value="#news.content" /></div></td>
						<td><s:property value="#news.public_time" /></td>
						<td><a href='common_edit?commonID=<s:property value="#news.ID" />'>编辑</a>
							<a href='common_del?commonID=<s:property value="#news.ID" />'>删除</a></td>
					</tr>
				</s:iterator>
					
			</table>
		</div>
		
		<!-- 通知公告 -->
		<div class="b-notice-content">
			<div class="common-news-title">
				<div class="add-common-news"><a href="add_common_item?type=1">+添加通知</a></div>
				<div class="common-news-word">通知公告管理</div>
			</div>
			<table class="b-news-content-tab" cellpadding="0" cellspacing="0">
				<tr>
					<td id="article_title">标题</td>
					<td id="article_author">作者</td>
					<td id="article_content">内容</td>
					<td id="article_time">发布时间</td>
					<td id="article_oper">操作</td>
				</tr>
				
				<s:iterator value="NoticeArr" id="notice">
					<tr>
						<td><div id="article_title_limit"><s:property value="#notice.title" /></div></td>
						<td><s:property value="#notice.author" /></td>
						<td><div id="article_content_limit"><s:property value="#notice.content" /></div></td>
						<td><s:property value="#notice.public_time" /></td>
						<td><a href='common_edit?commonID=<s:property value="#notice.ID" />'>编辑</a>
							<a href='common_del?commonID=<s:property value="#notice.ID" />'>删除</a></td>
					</tr>
				</s:iterator>
					
			</table>
		</div>
		
		<!-- 规章制度 -->
		<div class="b-rules-content">
			<div class="common-news-title">
				<div class="add-common-news"><a href="add_common_item?type=2">+添加规章</a></div>
				<div class="common-news-word">规章制度管理</div>
			</div>
			<table class="b-news-content-tab" cellpadding="0" cellspacing="0">
				<tr>
					<td id="article_title">标题</td>
					<td id="article_author">作者</td>
					<td id="article_content">内容</td>
					<td id="article_time">发布时间</td>
					<td id="article_oper">操作</td>
				</tr>
				
				<s:iterator value="RulesArr" id="rules">
					<tr>
						<td><div id="article_title_limit"><s:property value="#rules.title" /></div></td>
						<td><s:property value="#rules.author" /></td>
						<td><div id="article_content_limit"><s:property value="#rules.content" /></div></td>
						<td><s:property value="#rules.public_time" /></td>
						<td><a href='common_edit?commonID=<s:property value="#rules.ID" />'>编辑</a>
							<a href='common_del?commonID=<s:property value="#rules.ID" />'>删除</a></td>
					</tr>
				</s:iterator>
					
			</table>
		</div>

	</div>
</div>

<!-- 后台页面底部 -->
<div class="content-bottom"></div>

<script type="text/javascript">

	$(document).ready(function(){
		$(".b-news").addClass("news-bg-btn");
		$(".b-notice").removeClass("news-bg-btn");
		$(".b-rules").removeClass("news-bg-btn");
		
		$(".b-news-content").removeClass("news-content-unvisible");
		$(".b-notice-content").addClass("news-content-unvisible");
		$(".b-rules-content").addClass("news-content-unvisible");
	});

	//点击 学校快闻 按钮
	$(".b-news").click(function(){
		$(".b-news").addClass("news-bg-btn");
		$(".b-notice").removeClass("news-bg-btn");
		$(".b-rules").removeClass("news-bg-btn");

		$(".b-news-content").removeClass("news-content-unvisible");
		$(".b-notice-content").addClass("news-content-unvisible");
		$(".b-rules-content").addClass("news-content-unvisible");
	});
	
	//点击 通知公告 按钮
	$(".b-notice").click(function(){
		$(".b-news").removeClass("news-bg-btn");
		$(".b-notice").addClass("news-bg-btn");
		$(".b-rules").removeClass("news-bg-btn");

		$(".b-news-content").addClass("news-content-unvisible");
		$(".b-notice-content").removeClass("news-content-unvisible");
		$(".b-rules-content").addClass("news-content-unvisible");
	});

	//点击 规章制度 按钮
	$(".b-rules").click(function(){
		$(".b-news").removeClass("news-bg-btn");
		$(".b-notice").removeClass("news-bg-btn");
		$(".b-rules").addClass("news-bg-btn");

		$(".b-news-content").addClass("news-content-unvisible");
		$(".b-notice-content").addClass("news-content-unvisible");
		$(".b-rules-content").removeClass("news-content-unvisible");
	});

</script>

</body>
</html>