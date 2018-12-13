<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言详情</title>
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
	
	<div class="user-detail-content">
		<input type="hidden" name="messageID" value='<s:property value="messageID" />' />
		
		<div class="user-detail-title"><s:property value="message_detail.username" />-留言信息</div>
		
		<div>
			<table>
			
				<tr>
					<td id="msg_detail_td_1">发布人：</td>
					<td><s:property value="message_detail.username" /></td>
				</tr>
				
				<tr>
					<td id="msg_detail_td_2">发布时间：</td>
					<td><s:property value="message_detail.msg_time" /></td>
				</tr>
				
				<tr>
					<td id="msg_detail_td_3">用户类型：</td>
					<td>
						<s:if test='<s:property value="message_detail.status" /> == 0'>
						学生
						</s:if>
						<s:elseif test='<s:property value="message_detail.status" /> == 1'>
						老师
						</s:elseif>
						<s:else>-</s:else>
					</td>
				</tr>
				
				<tr id="msg_detail_td_4">
					<td>留言内容：</td>
					<td><s:property value="message_detail.msg_text" /></td>
				</tr>
				
			</table>
			<div class="btn btn-stu-edit"><a href="b_msg_manage">返回</a></div>
		</div>
		</div>
	</div>
</div>

<!-- 后台页面底部 -->
<div class="content-bottom"></div>

<script type="text/javascript">


</script>

</body>
</html>