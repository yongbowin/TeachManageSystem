<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="body-bg">
<div class="header">
	<div class="header-left">
		<div class="logo"></div>
		<div class="logo-name"><a href="index">教学管理平台</a></div>
	</div>
	<div class="header-right">
		<div class="btn signOut"><a href="login">退出</a></div>
		<div class="current-user">
			<marquee scrollamount="3">
			当前用户：<s:property value="#session.username"/>
			</marquee>
		</div>
	</div> 
</div>
</div>

<!-- 学生登录 -->
<s:if test="#session.curr_status == 0">
<input id="input_status" type="hidden" value="" />
<div class="wraper wraper-s">
	<div class="nav">
		<ul>
			<li class="nav-item nav-item-1"><a href="index">首页</a></li>
			<li class="nav-item nav-item-7"><a href="school_introduction">学校概况</a></li>
			<li class="nav-item nav-item-0"><a href="student_school_detail">学生学籍</a></li>
			<li class="nav-item nav-item-2"><a href="teach_res">教学资料</a></li>
			<li class="nav-item nav-item-4"><a href="student_evaluation">学生评教</a></li>
			<li class="nav-item nav-item-5"><a href="check_score">学生成绩</a></li>
			<li class="nav-item nav-item-6"><a href="message">留言板</a></li>
		</ul>
		<!--移动的滑动-->
        <div class="move-bg"></div>
        <!--移动的滑动 end-->
	</div>
</div>
</s:if>
<!-- 老师登录 -->
<s:elseif test="#session.curr_status == 1">
<div class="wraper wraper-t">
	<div class="nav">
		<ul>
			<li class="nav-item nav-list-t nav-item-1"><a href="index">首页</a></li>
			<li class="nav-item nav-list-t nav-item-7"><a href="school_introduction">学校概况</a></li>
			<li class="nav-item nav-list-t nav-item-2"><a href="teach_res">教学资料</a></li>
			<li class="nav-item nav-list-t nav-item-3"><a href="question_system">题库系统</a></li>
			<li class="nav-item nav-list-t nav-item-4"><a href="teacher_check_evaluation">学生评教</a></li>
			<li class="nav-item nav-list-t nav-item-5"><a href="check_score">学生成绩</a></li>
			<li class="nav-item nav-list-t nav-item-6"><a href="message">留言板</a></li>
		</ul>
		<!--移动的滑动-->
        <div class="move-bg"></div>
        <!--移动的滑动 end-->
	</div>
</div>
</s:elseif>
<!-- 提醒 重新登录 -->
<s:else>
<div class="wraper">
	<div class="nav">
		<ul>
			<li class="nav-item"><a href="login">首页</a></li>
			<li class="nav-item"><a href="school_introduction">学校概况</a></li>
			<li class="nav-item"><a href="login">学生学籍</a></li>
			<li class="nav-item"><a href="login">教学资料</a></li>
			<li class="nav-item"><a href="login">题库系统</a></li>
			<li class="nav-item"><a href="login">学生评教</a></li>
			<li class="nav-item"><a href="login">学生成绩</a></li>
			<li class="nav-item"><a href="login">留言板</a></li>
		</ul>
		<!--移动的滑动-->
        <div class="move-bg"></div>
        <!--移动的滑动 end-->
	</div>
</div>
</s:else>