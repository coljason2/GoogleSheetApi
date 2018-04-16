<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/resources/meta.jsp" />
<title>Google Sheet Api</title>
</head>
<body>
	<div
		class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
		<h5 class="my-0 mr-md-auto font-weight-normal">Auto Stock Update</h5>
		<nav class="my-2 my-md-0 mr-md-3"> <a id="bt-update"
			class="btn btn-outline-primary">開始更新</a> </nav>
	</div>

	<div class="container">
		<div class="card-deck mb-3 text-center">
			<iframe
				src="https://docs.google.com/spreadsheets/d/1g2VzWZoO6JOPn4vHhGB7dkwoNsdxb7-WvLdSUPRDUqg/?usp=sharing"
				width="1080" height="960" frameborder="0" marginheight="0"
				marginwidth="0">Loading...</iframe>
		</div>
	</div>
	<input type="hidden" id="ctx" value="<c:url value="/" />" />
	<jsp:include page="/resources/script.jsp" />
</body>
</html>