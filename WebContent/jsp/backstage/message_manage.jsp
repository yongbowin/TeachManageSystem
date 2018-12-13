<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言管理</title>
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
		<div class="common-right-title">所有留言</div>
		<div class="b-user-manage">
			
			<div class="choise-result">
				<table class="user-result-tab msg-tab" cellpadding="0" cellspacing="0">
					<tr>
						<td id="msg_user_name">姓名</td>
						<td id="msg_user_time">留言时间</td>
						<td id="msg_user_classify">用户类型</td>
						<td id="msg_user_content">留言内容</td>
						<td id="msg_user_operate">操作</td>
					</tr>
					
					<!-- 所有留言列表 -->
					<s:iterator value="BMessageArr" id="bMessage">
						<tr>
							<td><s:property value="#bMessage.username" /></td>
							<td><s:property value="#bMessage.msg_time" /></td>
							<td>
								<s:if test="#bMessage.status == 0">
								学生
								</s:if>
								<s:elseif test="#bMessage.status == 1">
								老师
								</s:elseif>
								<s:else>-</s:else>
							</td>
							<td><div id="msg_content_limit"><s:property value="#bMessage.msg_text" /></div></td>
							<td><a href='del_message?messageID=<s:property value="#bMessage.ID" />'>删除</a>
								&nbsp;&nbsp;
								<a href='get_message_detail?messageID=<s:property value="#bMessage.ID" />'>详细信息</a></td>
						</tr>
					</s:iterator>
						
				</table>
			</div>
		
		</div>
	</div>
</div>

<!-- 后台页面底部 -->
<div class="content-bottom"></div>

</body>
</html>