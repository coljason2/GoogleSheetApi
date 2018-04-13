<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Google Sheet Api</title>
</head>
<body>
	<h2>Stock Update</h2>
	<a href="${ctx}/stockUpdate" target="blank">開始更新</a>
	<div>
		<iframe
			src="https://docs.google.com/spreadsheets/d/1g2VzWZoO6JOPn4vHhGB7dkwoNsdxb7-WvLdSUPRDUqg/?usp=sharing"
			width="1080" height="960" frameborder="0" marginheight="0"
			marginwidth="0">Loading...</iframe>
	</div>
</body>
</html>