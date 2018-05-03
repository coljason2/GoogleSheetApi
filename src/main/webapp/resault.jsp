<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	x = 0;
	$(document).ready(function() {
		$(window).scroll(function() {
			$("span").text(x += 1);
		});
	});
</script>
<title>Resault Page</title>
</head>
<body>
	<p>
		Scrolled <span>0</span> times.
	</p>
	<div>${query}</div>
</body>





</html>