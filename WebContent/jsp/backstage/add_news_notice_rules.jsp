<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加新闻公告</title>
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
	
	<div class="user-detail-title">
			<s:if test="type == 0">
				添加-学校快闻
			</s:if>
			<s:elseif test="type == 1">
				添加-通知公告
			</s:elseif>
			<s:elseif test="type == 2">
				添加-规章制度
			</s:elseif>
		</div>
	
	<s:form class="user-detail-content edit_common_info" action="do_add_common" method="post">
		<input type="hidden" name="type" value='<s:property value="type" />' />
		
		<div class="success-message"><s:property value="successMessage"/></div>
		<div class="error-message"><s:property value="errorMessage"/></div>
		
		<div>
			<table>
			
				<tr>
					<td>标题：</td>
					<td><input value='<s:property value="student_score_detail.s_number" />' name="title" type="text" /></td>
				</tr>
				
				<tr>
					<td>作者：</td>
					<td><input name="author" type="text" /></td>
				</tr>
				
				<tr>
					<td>内容：</td>
					<td>
						<textarea name="content" rows="12">
							
						</textarea>
					</td>
				</tr>
				
			</table>
			<div class="btn-stu-edit"><s:submit value="保存" class="btn"></s:submit></div>
			<div class="btn" id="calcel_deit_score"><a href="b_news_notice_rules">返回</a></div>
		</div>
		</s:form>
	</div>
</div>

<!-- 后台页面底部 -->
<div class="content-bottom"></div>

<script type="text/javascript">


</script>

</body>
</html>