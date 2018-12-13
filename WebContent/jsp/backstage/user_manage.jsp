<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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
		<div class="b-user-manage">
		
			<div class="choise-search">
				<div class="choise-search-classify">
				选择类型：
				<select class="choise-search-select" name="choise_search_select">
					<option value="-1">所有用户</option>
					<option value="0">学生</option>
					<option value="1">老师</option>
					<option value="2">管理员</option>
				</select>
				</div>
				<div class="btn-search b-user-search" id="search_classify">搜索</div>
				
			</div>

			<div class="choise-result">
				<table class="user-result-tab" cellpadding="0" cellspacing="0">
					<tr>
						<td id="user_name">姓名</td>
						<td id="user_sex">性别</td>
						<td id="user_age">年龄</td>
						<td id="user_time">注册时间</td>
						<td id="user_classify">用户类型</td>
						<td id="user_operate">操作</td>
					</tr>
					
					<!-- 所有用户列表 -->
					<s:if test="#session.common_selected == -1">
						<!-- 管理员 -->
						<s:iterator value="BAdminArr" id="admin">
							<tr>
								<td><s:property value="#admin.name" /></td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>管理员</td>
								<td><a href="#">删除</a></td>
							</tr>
						</s:iterator>
						
						<!-- 学生 -->
						<s:iterator value="BStudentArr" id="student">
							<tr>
								<td><s:property value="#student.s_name" /></td>
								<td><s:property value="#student.s_sex" /></td>
								<td><s:property value="#student.s_age" /></td>
								<td><s:property value="#student.s_register_time" /></td>
								<td>学生</td>
								<td><a href='del_student?studentID=<s:property value="#student.ID" />'>删除</a>
									&nbsp;&nbsp;
									<a href='get_student_detail?studentID=<s:property value="#student.ID" />'>学籍信息</a></td>
							</tr>
						</s:iterator>
						
						<!-- 老师 -->
						<s:iterator value="BTeacherArr" id="teacher">
							<tr>
								<td><s:property value="#teacher.t_name" /></td>
								<td><s:property value="#teacher.t_sex" /></td>
								<td><s:property value="#teacher.t_age" /></td>
								<td><s:property value="#teacher.t_register_time" /></td>
								<td>老师</td>
								<td><a href='del_teacher?teacherID=<s:property value="#teacher.ID" />'>删除</a>
									&nbsp;&nbsp;
									<a href='get_teacher_detail?teacherID=<s:property value="#teacher.ID" />'>详细信息</a></td>
							</tr>
						</s:iterator>
						
					</s:if>
					
					<s:if test="#session.common_selected == 2">
					<!-- 管理员列表 -->
					<s:iterator value="BAdminArr" id="admin">
						<tr>
							<td><s:property value="#admin.name" /></td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>管理员</td>
							<td><a href="#">删除</a></td>
						</tr>
					</s:iterator>
					</s:if>
					
					<s:if test="#session.common_selected == 0">
					<!-- 学生列表 -->
					<s:iterator value="BStudentArr" id="student">
						<tr>
							<td><s:property value="#student.s_name" /></td>
							<td><s:property value="#student.s_sex" /></td>
							<td><s:property value="#student.s_age" /></td>
							<td><s:property value="#student.s_register_time" /></td>
							<td>学生</td>
							<td><a href='del_student?studentID=<s:property value="#student.ID" />'>删除</a>
								&nbsp;&nbsp;
								<a href='get_student_detail?studentID=<s:property value="#student.ID" />'>学籍信息</a></td>
						</tr>
					</s:iterator>
					</s:if>
					
					<s:if test="#session.common_selected == 1">
					<!-- 老师列表 -->
					<s:iterator value="BTeacherArr" id="teacher">
						<tr>
							<td><s:property value="#teacher.t_name" /></td>
							<td><s:property value="#teacher.t_sex" /></td>
							<td><s:property value="#teacher.t_age" /></td>
							<td><s:property value="#teacher.t_register_time" /></td>
							<td>老师</td>
							<td><a href='del_teacher?teacherID=<s:property value="#teacher.ID" />'>删除</a>
								&nbsp;&nbsp;
								<a href='get_teacher_detail?teacherID=<s:property value="#teacher.ID" />'>详细信息</a></td>
						</tr>
					</s:iterator>
					</s:if>
				</table>
			</div>
		
		</div>
	</div>
</div>

<!-- 后台页面底部 -->
<div class="content-bottom"></div>

<script type="text/javascript">

	$("#search_classify").click(function(){

		var classify_status = $(".choise-search-select option:selected").val();

		$.ajax({
			url: "b_user_classify",
			type: "post",
			data: "search_selected=" + classify_status,
			success: function(){
				window.location.href = "b_user_manage";
			}
		});
	}); 

</script>

</body>
</html>