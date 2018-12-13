<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报名管理</title>
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
		<div class="common-right-title">小升初报名学生名单</div>
		<div class="b-user-manage">
			
			<div class="choise-result">
				<table class="user-result-tab" cellpadding="0" cellspacing="0">
					<tr>
						<td>姓名</td>
						<td>性别</td>
						<td>生日</td>
						<td>报名时间</td>
						<td>用户类型</td>
						<td>审核</td>
						<td>操作</td>
					</tr>
					
					<!-- 报名学生列表 -->
					<s:iterator value="BApplyEntranceArr" id="applyEntrance">
						<tr>
							<td><s:property value="#applyEntrance.apply_name" /></td>
							<td><s:property value="#applyEntrance.apply_sex" /></td>
							<td><s:property value="#applyEntrance.apply_age" /></td>
							<td><s:property value="#applyEntrance.apply_birthday" /></td>
							<td>小升初</td>
							<td>
								<!-- 当未审核的时候 -->
								<%-- <input type="hidden" id="apply_status_val" value='<s:property value="#applyEntrance.apply_status" />' /> --%>
								<input type="hidden" id="apply_val_id" value='<s:property value="#applyEntrance.ID" />' />
								<div class="check-apply">
									<s:if test="#applyEntrance.apply_status == '' ||  
										#applyEntrance.apply_status == null ">
										<div class="refuse-apply">拒绝</div>
										<div class="pass-apply">通过</div>
									</s:if>
									<s:if test="#applyEntrance.apply_status == 1 ">
										审核通过
									</s:if>
									<s:if test="#applyEntrance.apply_status == 2 ">
										已拒绝
									</s:if>
								</div>
							</td>
							<td><a href='del_apply_entrance?applyEntranceID=<s:property value="#applyEntrance.ID" />'>删除</a>
								&nbsp;&nbsp;
								<a href='get_apply_entrance_detail?applyEntranceID=<s:property value="#applyEntrance.ID" />'>详细信息</a></td>
						</tr>
					</s:iterator>
						
				</table>
			</div>
		
		</div>
	</div>
</div>

<!-- 后台页面底部 -->
<div class="content-bottom"></div>

<script type="text/javascript">

$(function(){
	$(".refuse-apply").click(function(){
		// 该学生的id
		var apply_stu_id = $(this).parent().prev().val();
		$.ajax({
			url: "refuse_apply_in",
			type: "post",
			data: "applyStuID=" + apply_stu_id,
			success: function(){
				//alert(json);
			}
		});
		// 最后再将其中内容替换掉
 		$(this).parent().html("已拒绝");
	});
	$(".pass-apply").click(function(){
		// 该学生的id
		var apply_stu_id = $(this).parent().prev().val();
		$.ajax({
			url: "pass_apply_in",
			type: "post",
			data: "applyStuID=" + apply_stu_id,
			success: function(){
				//alert("成功");
			}
		});
		// 最后再将其中内容替换掉
		$(this).parent(".check-apply").html("审核通过");
	});
	
});

</script>

</body>
</html>