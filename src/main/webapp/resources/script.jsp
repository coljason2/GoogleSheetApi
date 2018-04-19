<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var ctx = $("#ctx").val();
	jQuery(document).ready(function($) {
		$("#bt-update").click(function(event) {
			event.preventDefault();
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
