<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value="/resources/js/popper.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/holder.min.js"/>"></script>
<script>
	Holder.addTheme('thumb', {
		bg : '#55595c',
		fg : '#eceeef',
		text : 'Thumbnail'
	});
</script>

<script>
	var ctx = $("#ctx").val();
	jQuery(document).ready(function($) {
		$("#bt-update").click(function(event) {
			$.ajax({
				url : ctx + "update",
				dataType : "text",
				error : function() {
					alert("啟動失敗")
				},
				success : function(data) {
					alert(data)
				}
			});
		});
	});
</script>
