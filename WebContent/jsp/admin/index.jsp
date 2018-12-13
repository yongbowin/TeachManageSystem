<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教学管理系统-首页</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/jq22.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.movebg.js"></script>
<link href="css/skitter.styles.css" type="text/css" media="all" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/jquery.skitter.js"></script>
</head>
<body>
<!-- 模态-开始 -->
<!-- 模态 透明页面背景div -->
<div class="modal-all-body"></div>

<!-- 显示全部新闻 模态 - 开始 -->
<div class="show-all-news">
	<div class="news-title-modal">学校快闻</div>
	<!-- 实线 分割线 -->
	<div class="news-solid-line-modal"></div>
	<table>
		<s:iterator value="NewsArr" id="news">
			<tr>
				<td>
					<div id="index_article_title_modal_limit">
						<a href='get_index_common_detail?commonID=<s:property value="#news.ID" />'
							target="_blank">
							<s:property value="#news.title" />
						</a>
					</div>
				</td>
				<td id="index_article_modal_time">
					<s:property value="#news.public_time" />
				</td>
			</tr>
		</s:iterator>
	</table>
</div>
<!-- 显示全部新闻 模态 - 结束 -->

<!-- 显示全部通知 模态 - 开始 -->
<div class="show-all-notice">
	<div class="news-title-modal">通知公告</div>
	<!-- 实线 分割线 -->
	<div class="news-solid-line-modal"></div>
	<table>
		<s:iterator value="NoticeArr" id="notice">
			<tr>
				<td>
					<div id="index_article_title_modal_limit">
						<a href='get_index_common_detail?commonID=<s:property value="#notice.ID" />'
							target="_blank">
							<s:property value="#notice.title" />
						</a>
					</div>
				</td>
				<td id="index_article_modal_time">
					<s:property value="#notice.public_time" />
				</td>
			</tr>
		</s:iterator>
	</table>
</div>
<!-- 显示全部通知 模态 - 结束 -->

<!-- 显示全部规章制度 模态 - 开始 -->
<div class="show-all-rules">
	<div class="news-title-modal">规章制度</div>
	<!-- 实线 分割线 -->
	<div class="news-solid-line-modal"></div>
	<table>
		<s:iterator value="RulesArr" id="rules">
			<tr>
				<td>
					<div id="index_article_title_modal_limit">
						<a href='get_index_common_detail?commonID=<s:property value="#rules.ID" />'
							target="_blank">
							<s:property value="#rules.title" />
						</a>
					</div>
				</td>
				<td id="index_article_modal_time">
					<s:property value="#rules.public_time" />
				</td>
			</tr>
		</s:iterator>
	</table>
</div>
<!-- 显示全部规章制度 模态 - 结束 -->
<!-- 模态-结束 -->

<%@ include file="../common/header.jsp" %>

<!-- 滚动图片 -->
<div id="img_center" class="w950 mauto box_skitter box_skitter_large">
	<ul>
		<li><a class="circles" href="#"><img src="images/lunbo1.jpg" alt="" title=""/></a></li>
		<li><a class="circlesInside" href="#"><img src="images/lunbo2.jpg" alt="" title=""/></a></li>
		<li><a class="circlesInside" href="#"><img src="images/lunbo3.jpg" alt="" title=""/></a></li>
		<li><a class="circlesInside" href="#"><img src="images/lunbo4.jpg" alt="" title=""/></a></li>
	</ul>
</div>

<div class="index-news-notice-rules">
	<!-- 学校快闻 -->
	<div class="news">
		<div class="news-title-word">
			<div class="news-title">学校快闻</div>
			<div class="news-more news_more_a">&raquo;更多...</div>
		</div>
		<!-- 实线 分割线 -->
		<div class="news-solid-line"></div>
		<table>
			<s:iterator value="NewsArr" id="news" status="st">
				<!-- 限制一次显示6条数据 -->
				<s:if test="#st.index<=5">
					<tr>
						<td>
							<div id="index_article_title_limit">
								<a href='get_index_common_detail?commonID=<s:property value="#news.ID" />'
									target="_blank">
									<s:property value="#news.title" />
								</a>
							</div>
						</td>
						<td id="index_article_time">
							<s:property value="#news.public_time" />
						</td>
					</tr>
				</s:if>
			</s:iterator>
		</table>
	</div>
	
	<!-- 通知公告 -->
	<div class="notice">
		<div class="news-title-word">
			<div class="news-title">通知公告</div>
			<div class="news-more news_more_b">&raquo;更多...</div>
		</div>
		<!-- 实线 分割线 -->
		<div class="news-solid-line"></div>
		<table>
			<s:iterator value="NoticeArr" id="notice" status="st">
				<!-- 限制一次显示6条数据 -->
				<s:if test="#st.index<=5">
					<tr>
						<td>
							<div id="index_article_title_limit">
								<a href='get_index_common_detail?commonID=<s:property value="#notice.ID" />'
									target="_blank">
									<s:property value="#notice.title" />
								</a>
							</div>
						</td>
						<td id="index_article_time">
							<s:property value="#notice.public_time" />
						</td>
					</tr>
				</s:if>
			</s:iterator>
		</table>
	</div>
	
	<!-- 规章制度 -->
	<div class="rules">
		<div class="news-title-word">
			<div class="news-title">规章制度</div>
			<div class="news-more news_more_c">&raquo;更多...</div>
		</div>
		<!-- 实线 分割线 -->
		<div class="news-solid-line"></div>
		<table>
			<s:iterator value="RulesArr" id="rules" status="st">
				<!-- 限制一次显示6条数据 -->
				<s:if test="#st.index<=5">
					<tr>
						<td>
							<div id="index_article_title_limit">
								<a href='get_index_common_detail?commonID=<s:property value="#rules.ID" />'
									target="_blank">
									<s:property value="#rules.title" />
								</a>
							</div>
						</td>
						<td id="index_article_time">
							<s:property value="#rules.public_time" />
						</td>
					</tr>
				</s:if>
			</s:iterator>
		</table>
	</div>

</div>

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
		$(".nav-item-1").addClass("cur");

		//页面刚加载的时候移除body-opacity属性
		$(".body-opacity-all").removeClass("body-opacity");

		$('.box_skitter_large').skitter({
			theme: 'clean',
			numbers_align: 'center',
			progressbar: true, 
			dots: true, 
			preview: true
		});
	});
	$(function(){
		$(".nav").movebg({width:125/*滑块的大小*/,extra:40/*额外反弹的距离*/,speed:300/*滑块移动的速度*/,rebound_speed:400/*滑块反弹的速度*/});
	});

	/* 显示全部消息 模态 */
	/* 新闻版块 模态 */
	$(".news_more_a").click(function(){
		$(".show-all-news").show();
		$(".show-all-notice").hide();
		$(".show-all-rules").hide();
		
		$(".modal-all-body").show();
	});
	/* 通知公告 模态 */
	$(".news_more_b").click(function(){
		$(".show-all-news").hide();
		$(".show-all-notice").show();
		$(".show-all-rules").hide();
		
		$(".modal-all-body").show();
	});
	/* 规章制度 模态 */
	$(".news_more_c").click(function(){
		$(".show-all-news").hide();
		$(".show-all-notice").hide();
		$(".show-all-rules").show();
		
		$(".modal-all-body").show();
	});

	/* 当新闻、通知、规章的列表弹出框失去焦点 之后 */
	$(".modal-all-body").click(function(){
		$(".show-all-news").hide();
		$(".show-all-notice").hide();
		$(".show-all-rules").hide();
		
		$(".modal-all-body").hide();
	});

</script>
</body>
</html>