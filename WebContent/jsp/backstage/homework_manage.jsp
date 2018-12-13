<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作业管理</title>
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
		<div class="common-right-title">所有作业</div>
		<div class="b-user-manage">
			
			<div class="choise-result">
				<table class="user-result-tab msg-tab" cellpadding="0" cellspacing="0">
					<tr>
						<td>题目</td>
						<td>年级</td>
						<td>科目</td>
						<td>布置人</td>
						<td>开始时间</td>
						<td>截止时间</td>
						<td>操作</td>
					</tr>
					
					<!-- 所有 作业 列表 -->
					<s:iterator value="ArrangeHomeworkArr" id="arrangeHomework">
						<tr>
							<td>
								<div id="res_title_limit">
									<s:property value="#arrangeHomework.hw_title" />
								</div>
							</td>
							<td><s:property value="#arrangeHomework.hw_grade" /></td>
							<td><s:property value="#arrangeHomework.hw_subject" /></td>
							<td><s:property value="#arrangeHomework.teacher_name" /></td>
							<td><s:property value="#arrangeHomework.hw_start_time" /></td>
							<td><s:property value="#arrangeHomework.hw_end_time" /></td>
							<td>
								<a href='bHomeworkDetail?hwID=<s:property value="#arrangeHomework.ID" />'>查看详情</a>
								<a href='bDelHomework?hwID=<s:property value="#arrangeHomework.ID" />'>删除</a>
							</td>
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