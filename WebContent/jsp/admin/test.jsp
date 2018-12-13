<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试页面</title>
</head>
<body>
<table>
<s:iterator value="tJudgmentArr" id="tChoice1">
	<tr>
		<td id="choice_cont_id">
			<s:property value="#tChoice1.ID" />.&nbsp;&nbsp;
			<s:property value="#tChoice1.q_content" />
		</td>
	</tr>							
</s:iterator>
</table>

</body>
</html>