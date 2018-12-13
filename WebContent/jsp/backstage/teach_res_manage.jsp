<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教学资料</title>
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
		<div class="common-right-title">所有资料</div>
		<div class="b-user-manage">
			
			<div class="choise-result">
				<table class="user-result-tab msg-tab" cellpadding="0" cellspacing="0">
					<tr>
						<td>文件名</td>
						<td>年级</td>
						<td>科目</td>
						<td>类型</td>
						<td>文件描述</td>
						<td>上传人</td>
						<td>上传时间</td>
						<td>操作</td>
					</tr>
					
					<!-- 所有留言列表 -->
					<s:iterator value="TeacherResourceArr" id="teachres">
						<tr>
							<td>
								<div id="res_title_limit">
									<s:property value="#teachres.file_name" />
								</div>
							</td>
							<td><s:property value="#teachres.file_grade" /></td>
							<td><s:property value="#teachres.file_subject" /></td>
							<td><s:property value="#teachres.file_type" /></td>
							<td>
								<div id="res_desc_limit">
									<s:property value="#teachres.file_desc" />
								</div>
							</td>
							<td><s:property value="#teachres.file_up_author" /></td>
							<td><s:property value="#teachres.file_up_time" /></td>
							<td>
								<a href="#">下载</a>
								<a href='bDelFile?fileID=<s:property value="#teachres.ID" />'>删除</a>
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