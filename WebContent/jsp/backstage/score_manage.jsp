<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩管理</title>
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
		<div class="common-right-title">学生成绩</div>
		<div class="b-user-manage">
		
			<div class="add-score-btn"><div class="btn"><a href="add_score">添加</a></div></div>
			
			<div class="choise-result">
				<table class="user-result-tab" cellpadding="0" cellspacing="0">
					<tr>
						<td id="score_id">姓名</td>
						<td id="score_id">学号</td>
						<td id="score_id_1">语文</td>
						<td id="score_id_1">数学</td>
						<td id="score_id_1">英语</td>
						<td id="score_id_1">物理</td>
						<td id="score_id_1">化学</td>
						<td id="score_id_3">总分</td>
						<td id="score_id_3">年级</td>
						<td id="score_id_2">操作</td>
					</tr>
					
					<!-- 报名学生列表 -->
					<s:iterator value="BScoreArr" id="bScore">
						<tr>
							<td><s:property value="#bScore.name" /></td>
							<td><s:property value="#bScore.student_id" /></td>
							<td><s:property value="#bScore.chinese_course" /></td>
							<td><s:property value="#bScore.math_course" /></td>
							<td><s:property value="#bScore.english_course" /></td>
							<td><s:property value="#bScore.physics_course" /></td>
							<td><s:property value="#bScore.chemistry_course" /></td>
							<td><s:property value="#bScore.sum" /></td>
							<td><s:property value="#bScore.sc_grade" /></td>
							<td><a href='del_student_score?scoreStudentID=<s:property value="#bScore.student_id" />'>删除</a>
								&nbsp;&nbsp;
								<a href='get_student_score_detail?scoreStudentID=<s:property value="#bScore.student_id" />'>编辑</a></td>
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