<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评教管理</title>
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
		<div class="common-right-title">所有教师得分-平均分</div>
		<div class="b-user-manage">
			
			<div class="choise-result">
				<table class="user-result-tab msg-tab" cellpadding="0" cellspacing="0">
					<tr>
						<td>工号</td>
						<td>姓名</td>
						<td>年级</td>
						<td>科目</td>
						<td>备课能力</td>
						<td>授课能力</td>
						<td>专业能力</td>
						<td>实践能力</td>
						<td>布置作业能力</td>
						<td>课程满意度</td>
						<td>综合能力</td>
						<td>总平均分</td>
						<td>操作</td>
					</tr>
					
					<!-- 所有留言列表 -->
					<s:iterator value="BEvaluationArr" id="bEvaluation">
						<tr>
							<td><s:property value="#bEvaluation.t_number" /></td>
							<td><s:property value="#bEvaluation.t_name" /></td>
							<td><s:property value="#bEvaluation.t_grade" /></td>
							<td><s:property value="#bEvaluation.t_subject" /></td>
							<td><s:property value="#bEvaluation.prepare" /></td>
							<td><s:property value="#bEvaluation.teach" /></td>
							<td><s:property value="#bEvaluation.professional" /></td>
							<td><s:property value="#bEvaluation.practical" /></td>
							<td><s:property value="#bEvaluation.task" /></td>
							<td><s:property value="#bEvaluation.course" /></td>
							<td><s:property value="#bEvaluation.comprehensive" /></td>
							<td><s:property value="#bEvaluation.total_avg" /></td>
							<td>
								<a href='b_del_evalu?teacherID=<s:property value="#bEvaluation.teacher_id" />'>删除</a>
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