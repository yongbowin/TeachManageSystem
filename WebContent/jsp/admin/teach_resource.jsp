<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教学资料</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/jq22.css" rel="stylesheet" type="text/css" />
<link href="css/upload/zyUpload.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- 导航条 -->
<script src="js/jquery.movebg.js"></script>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class="content-main">

	<!-- 判断是老师登录还是学生登录 -->
	<!-- 当是学生登录的时候 -->
	<s:if test="#session.curr_status == 0">
	
		<div class="content-main-nav">
			<!-- 左侧导航栏 -->
			<div class="content-main-left">
				<div class="nav-head-bar"><div class="nav-head-bar-3"></div><div class="nav-left-bar res-down-bar-stu">资料下载</div></div>
				<div class="nav-head-bar"><div class="nav-head-bar-4"></div><div class="nav-left-bar res-homework-bar-stu">作业上传</div></div>
			</div>
			
			<!-- 右侧详细内容 -->
			<div class="content-main-right">
				
				<!-- 资料下载-开始 -->
				<div class="resource_download_content_stu">
					<div class="res-up-down-title">资料下载</div>
					<div class="res-up-down-content">
						<table id="res_down_tab" cellpadding="0" cellspacing="0">
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
							
							<s:iterator value="TeacherResourceArr" id="teachres">
							
								<tr>
									<td>
										<div id="res_title_limit">
											<s:property value="#teachres.file_path" />
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
										<a href='downFileRes?filePath=<s:property value="#teachres.file_path" />'>下载</a>
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>
				<!-- 资料下载-结束 -->
				
				<!-- 作业上传 -->
				<div class="resource_homework_content_stu">
				
					<div class="res-up-down-title">作业上传</div>
					<div class="res-up-down-content">
					<!-- 搜索 所在年级 某学科 的作业 -->
					<div class="res-up-down-type">
							<div class="res-up-down-type-1">
								年级：
								<select name="hw_grade" class="hw-grade-select">
									<option>7</option>
									<option>8</option>
									<option>9</option>
								</select>
							</div>
							
							<div class="res-up-down-type-2">
								科目：
								<select name="hw_subject" class="hw-subject-select">
									<option>语文</option>
									<option>数学</option>
									<option>英语</option>
									<option>物理</option>
									<option>化学</option>
								</select>
							</div>
							
							<div class="btn hw-btn" id="hw_btn">搜索作业</div>
						</div>
						
						<!-- 作业列表-开始 -->
						
						<table id="res_down_tab" cellpadding="0" cellspacing="0">
							<tr>
								<td>题目</td>
								<td>年级</td>
								<td>科目</td>
								<td>布置人</td>
								<td>开始时间</td>
								<td>截止时间</td>
								<td>操作</td>
							</tr>
							
							<!-- 如果返回的是 ArrangeHomeworkArr 对象，则显示下边的列表（没必要用jquery控制）
								 如果没有返回该对象，则不显示 -->
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
										<a href='getHWDetail?HWID=<s:property value="#arrangeHomework.ID" />'>查看详情</a>
									</td>
								</tr>
							</s:iterator>
							
							<!-- 如果返回的是 HomeworkSearchResultArr 对象，则显示下边的列表（没必要用jquery控制）
								 如果没有返回该对象，则不显示 -->
							<s:iterator value="HomeworkSearchResultArr" id="homework">
							
								<tr>
									<td>
										<div id="res_title_limit">
											<s:property value="#homework.hw_title" />
										</div>
									</td>
									<td><s:property value="#homework.hw_grade" /></td>
									<td><s:property value="#homework.hw_subject" /></td>
									<td><s:property value="#homework.teacher_name" /></td>
									<td><s:property value="#homework.hw_start_time" /></td>
									<td><s:property value="#homework.hw_end_time" /></td>
									<td>
										<a href='getHWDetail?HWID=<s:property value="#arrangeHomework.ID" />'>查看详情</a>
									</td>
								</tr>
							</s:iterator>
							
						</table>
						<!-- 作业列表-结束 -->
					
						<div class="success-error">
							<div class="success-message"><s:property value="successMessage"/></div>
							<div class="error-message"><s:property value="errorMessage"/></div>
						</div>
					</div>
				</div>
				
			</div>
		
		</div>
		
	</s:if>
	
	<!-- 当是老师登录的时候 -->
	<s:elseif test="#session.curr_status == 1">
		
		<div class="content-main-nav">
			<!-- 左侧导航栏 -->
			<div class="content-main-left">
				<div class="nav-head-bar"><div class="nav-head-bar-1"></div><div class="nav-left-bar res-up-bar">资料上传</div></div>
				<div class="nav-head-bar"><div class="nav-head-bar-2"></div><div class="nav-left-bar res-down-bar">资料下载</div></div>
				<div class="nav-head-bar"><div class="nav-head-bar-0"></div><div class="nav-left-bar res-homework-bar">作业布置</div></div>
				<div class="nav-head-bar"><div class="nav-head-bar-5"></div><div class="nav-left-bar res-hw-manage-bar">作业管理</div></div>
			</div>
			
			<!-- 右侧详细内容 -->
			<div class="content-main-right">
				
				<!-- 资料上传 -->
				<div class="resource_upload_content">
				
					<div class="res-up-down-title">资料上传</div>
					<div class="res-up-down-content">
					<s:form action="do_add_file" enctype="multipart/form-data" method="post">
					
						<div class="res-up-down-type">
							<div class="res-up-down-type-1">
								年级：
								<select name="res_grade" class="res-up-down-type-select">
									<option>7</option>
									<option>8</option>
									<option>9</option>
								</select>
							</div>
							
							<div class="res-up-down-type-2">
								科目：
								<select name="res_subject" class="res-up-down-type-select">
									<option>语文</option>
									<option>数学</option>
									<option>英语</option>
									<option>物理</option>
									<option>化学</option>
								</select>
							</div>
							
							<div class="res-up-down-type-3">
								资料类型：
								<select name="res_type" class="res-up-down-type-select">
									<option>课件</option>
									<option>实验指导</option>
									<option>习题讲解</option>
									<option>复习资料</option>
								</select>
							</div>
						</div>
						<!-- 文件名和文件描述 -->
						<div class="res-name-desc">
							<div class="res-name">
								<label>请输入文件名：</label><input id="res_name" type="text" name="res_name" />
							</div>
							<div class="res-desc">
								<label>请输入描述：&nbsp;</label>
								<textarea id="res_desc" name="res_desc" rows="3"></textarea>
							</div>
						</div>
						<!-- 上传文件 -->
						<div class="res-up-down-file">
							<label>请选择文件：&nbsp;&nbsp;</label><input id="file_res" type="file" name="fileTestData" />
						</div>
						<s:submit value="上传" class="btn btn-upload"></s:submit>
					</s:form>
					
						<div class="success-error">
							<div class="success-message"><s:property value="successMessage"/></div>
							<div class="error-message"><s:property value="errorMessage"/></div>
						</div>
					</div>
				</div>
				
				<!-- 资料下载-开始 -->
				<div class="resource_download_content">
					<div class="res-up-down-title">资料下载</div>
					<div class="res-up-down-content">
						<table id="res_down_tab" cellpadding="0" cellspacing="0">
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
							
							<s:iterator value="TeacherResourceArr" id="teachres">
							
								<tr>
									<td>
										<div id="res_title_limit">
											<s:property value="#teachres.file_path" />
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
										<a href='downFileRes?filePath=<s:property value="#teachres.file_path" />'>下载</a>
										<a href='delFile?fileID=<s:property value="#teachres.ID" />'>删除</a>
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>
				<!-- 资料下载-结束 -->
				
				<!-- 作业布置-开始 -->
				<div class="resource_homework_content">
					<div class="res-up-down-title">作业布置</div>
					<form action="arrange_homework" method="post">
						<table class="resource_homework_tab">
							<tr>
								<td>科目：</td>
								<td>
									<select name="homework_subject">
										<option>语文</option>
										<option>数学</option>
										<option>英语</option>
										<option>物理</option>
										<option>化学</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>年级：</td>
								<td>
									<select name="homework_grade">
										<option>7</option>
										<option>8</option>
										<option>9</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>开始时间：</td>
								<td><input name="homework_start_time" type="text" /></td>
							</tr>
							<tr>
								<td>结束时间：</td>
								<td><input name="homework_end_time" type="text" /></td>
							</tr>
							<tr>
								<td>题目：</td>
								<td><textarea name="homework_title"></textarea></td>
							</tr>
						</table>
						<div class="homework-teacher-btn">
							<s:submit value="提交" class="btn s-homework-teacher-btn"></s:submit>
						</div>
					</form>
				</div>				
				<!-- 作业布置-结束 -->
				
				<!-- 作业管理-开始 -->
				<div class="resource_hw_manage_content">
					<div class="res-up-down-title">作业管理</div>
					<div class="res-up-down-content">
						<table id="res_down_tab" cellpadding="0" cellspacing="0">
							<tr>
								<td>题目</td>
								<td>年级</td>
								<td>科目</td>
								<td>布置人</td>
								<td>开始时间</td>
								<td>截止时间</td>
								<td>操作</td>
							</tr>
							
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
										<a href="#">编辑</a>
										<a href='delHomework?hwID=<s:property value="#arrangeHomework.ID" />'>删除</a>
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>
				<!-- 作业管理-结束 -->
				
			</div>
		
		</div>
		
	</s:elseif>

</div>

<div style="clear: both;"></div>

<%@ include file="../common/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	$(".nav-item-0").removeClass("cur");
	$(".nav-item-1").removeClass("cur");
	$(".nav-item-2").removeClass("cur");
	$(".nav-item-3").removeClass("cur");
	$(".nav-item-4").removeClass("cur");
	$(".nav-item-5").removeClass("cur");
	$(".nav-item-6").removeClass("cur");
	$(".nav-item-7").removeClass("cur");
	$(".nav-item-2").addClass("cur");

	//老师
	//显示 removeClass
	$(".resource_upload_content").removeClass("div-visible");
	//隐藏 addClass
	$(".resource_download_content").addClass("div-visible");
	$(".resource_homework_content").addClass("div-visible");
	$(".resource_hw_manage_content").addClass("div-visible");
	//老师
	//当页面刚载入时，将左侧的菜单条置为 选中 状态
	$(".nav-head-bar-1").addClass("sch-left-active");
	$(".nav-head-bar-2").removeClass("sch-left-active");
	$(".nav-head-bar-0").removeClass("sch-left-active");
	$(".nav-head-bar-5").removeClass("sch-left-active");

	//学生
	$(".resource_download_content_stu").removeClass("div-visible");
	$(".resource_homework_content_stu").addClass("div-visible");
	//学生
	$(".nav-head-bar-3").addClass("sch-left-active");
	$(".nav-head-bar-4").removeClass("sch-left-active");

	//获取url中的参数
	var search_param = getUrlParam('search_btn_click_param');
	//alert(xx);
	if(search_param == 1){
		//学生
		$(".resource_download_content_stu").addClass("div-visible");
		$(".resource_homework_content_stu").removeClass("div-visible");

		//$(".all-hw").addClass("div-visible");
		//$(".search-hw").removeClass("div-visible");
		
		//学生
		$(".nav-head-bar-3").removeClass("sch-left-active");
		$(".nav-head-bar-4").addClass("sch-left-active");
	} else {
		//学生
		$(".resource_download_content_stu").removeClass("div-visible");
		$(".resource_homework_content_stu").addClass("div-visible");
		//学生
		$(".nav-head-bar-3").addClass("sch-left-active");
		$(".nav-head-bar-4").removeClass("sch-left-active");
	}

});

	//获取url中参数
	function getUrlParam(name) {
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	    if (r != null) return unescape(r[2]); return null; //返回参数值
	}

	$(function(){
		$(".nav").movebg({width:125/*滑块的大小*/,extra:40/*额外反弹的距离*/,speed:300/*滑块移动的速度*/,rebound_speed:400/*滑块反弹的速度*/});
	});

	/* 控制页面显示的内容 */
	//刚载入页面的时候，显示所有的div
	$(".nav-item-7").click(function(){
		//alert("主菜单被点击！");
		$(".resource_upload_content").removeClass("div-visible");
		$(".resource_download_content").addClass("div-visible");
		$(".resource_homework_content").addClass("div-visible");
		$(".resource_hw_manage_content").addClass("div-visible");
		
		$(".resource_download_content_stu").removeClass("div-visible");
		$(".resource_homework_content_stu").addClass("div-visible");
		

		$(".nav-head-bar-1").addClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-0").removeClass("sch-left-active");
		$(".nav-head-bar-5").removeClass("sch-left-active");
		
		$(".nav-head-bar-3").addClass("sch-left-active");
		$(".nav-head-bar-4").removeClass("sch-left-active");
		
	});
	//当点击左侧 资料上传 菜单的时候，只显示资料上传 相应条目
	$(".res-up-bar").click(function(){
		//alert("老师-资料上传");
		$(".resource_upload_content").removeClass("div-visible");
		$(".resource_download_content").addClass("div-visible");
		$(".resource_homework_content").addClass("div-visible");
		$(".resource_hw_manage_content").addClass("div-visible");

		$(".nav-head-bar-1").addClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-0").removeClass("sch-left-active");
		$(".nav-head-bar-5").removeClass("sch-left-active");
	});
	//当老师点击 资料下载 时
	$(".res-down-bar").click(function(){
		//alert("老师-资料下载");
		$(".resource_upload_content").addClass("div-visible");
		$(".resource_download_content").removeClass("div-visible");
		$(".resource_homework_content").addClass("div-visible");
		$(".resource_hw_manage_content").addClass("div-visible");

		$(".nav-head-bar-1").removeClass("sch-left-active");
		$(".nav-head-bar-2").addClass("sch-left-active");
		$(".nav-head-bar-0").removeClass("sch-left-active");
		$(".nav-head-bar-5").removeClass("sch-left-active");
	});
	//当老师 点击左侧 作业布置 菜单的时候，只显示作业布置 相应条目
	$(".res-homework-bar").click(function(){
		//alert("老师-作业布置");
		$(".resource_upload_content").addClass("div-visible");
		$(".resource_download_content").addClass("div-visible");
		$(".resource_homework_content").removeClass("div-visible");
		$(".resource_hw_manage_content").addClass("div-visible");

		$(".nav-head-bar-1").removeClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-0").addClass("sch-left-active");
		$(".nav-head-bar-5").removeClass("sch-left-active");
	});
	//当老师 点击左侧 作业管理 菜单的时候，只显示作业管理 相应条目
	$(".res-hw-manage-bar").click(function(){
		//alert("老师-作业管理");
		$(".resource_upload_content").addClass("div-visible");
		$(".resource_download_content").addClass("div-visible");
		$(".resource_homework_content").addClass("div-visible");
		$(".resource_hw_manage_content").removeClass("div-visible");

		$(".nav-head-bar-1").removeClass("sch-left-active");
		$(".nav-head-bar-2").removeClass("sch-left-active");
		$(".nav-head-bar-0").removeClass("sch-left-active");
		$(".nav-head-bar-5").addClass("sch-left-active");
	});

	//当学生点击 资料下载 时
	$(".res-down-bar-stu").click(function(){
		//alert("学生-资料下载");
		$(".resource_download_content_stu").removeClass("div-visible");
		$(".resource_homework_content_stu").addClass("div-visible");

		$(".nav-head-bar-3").addClass("sch-left-active");
		$(".nav-head-bar-4").removeClass("sch-left-active");
	});
	//当学生点击 作业上传 时
	$(".res-homework-bar-stu").click(function(){
		//alert("学生-作业上传");
		$(".resource_download_content_stu").addClass("div-visible");
		$(".resource_homework_content_stu").removeClass("div-visible");

		$(".nav-head-bar-3").removeClass("sch-left-active");
		$(".nav-head-bar-4").addClass("sch-left-active");
	});

	//上传表单验证
	$(".btn-upload").click(function(){
		//alert($("#res_name").val());
		if($("#res_name").val() == ''){
			alert("警告：请输入文件名！");
			return false;
		} else if($("#res_desc").val() == ''){
			alert("警告：请输入文件描述！");
			return false;
		} else if($("#file_res").val() == ''){
			alert("警告：请选择文件！");
			return false;
		}
	});

	//在学生 作业上传 页面 搜索 作业
	$("#hw_btn").click(function(){

		var hw_grade_val = $(".hw-grade-select option:selected").val();
		var hw_subject_val = $(".hw-subject-select option:selected").val();

		$.ajax({
			url: "search_hw",
			type: "post",
			data: "hw_grade_val=" + hw_grade_val + "&hw_subject_val=" + hw_subject_val,
			contentType: "application/x-www-form-urlencoded; charset=utf-8", 
			success: function(){
				// 针对url参数中有中文乱码的问题，可以用contentType，但是对于下边的重定向操作，
				// 需要进行两次编码操作，后台再进行解码
				window.location.href = "teach_res?search_btn_click_param=1&hw_grade_val=" 
					+ hw_grade_val + "&hw_subject_val=" + encodeURI(encodeURI(hw_subject_val)); 
			}
		});
	}); 

</script>

</body>
</html>