<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resources/css/style-loader.css"/>">
<title>Page ${index}</title>
</head>
<body>
	<div class="article">${index}</div>
	<div class="article">${index}</div>
	<div class="article">${index}</div>
	<div class="article">${index}</div>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
	<script
		src='https://unpkg.com/infinite-scroll@3/dist/infinite-scroll.pkgd.js'></script>
</body>
</html>