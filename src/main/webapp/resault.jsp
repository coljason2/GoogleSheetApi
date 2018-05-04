<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-infinitescroll/3.0.3/infinite-scroll.pkgd.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/loader-ellips.css"/>">
<style>
.article {
	/* 排版用，不影響功能，*/
	height: 300px;
	margin: 50px;
	background: #ccc;
	font-size: 50px;
	line-height: 300px;
	text-align: center;
}
</style>
<title>Resault Page</title>
</head>
<body>
	<input type="hidden" id="ctx" value="<c:url value="/" />" />
	<div class="example">
		<div class="article">1</div>
		<div class="article">2</div>
		<div class="article">3</div>
		<div class="article">4</div>

		<!-- 捲軸狀態 -->
		<div class="scroller-status">
			<div class="loader-ellips infinite-scroll-request">
				<span class="loader-ellips__dot"></span> <span
					class="loader-ellips__dot"></span> <span class="loader-ellips__dot"></span>
				<span class="loader-ellips__dot"></span>
			</div>
			<p class="infinite-scroll-last">開始加載</p>
			<p class="infinite-scroll-error">沒有頁面可以讀取了</p>
		</div>
	</div>
	<script>
		var ctx = $("#ctx").val();
		var infScroll = new InfiniteScroll(".example", {
			path : function() {
				// 頁面路徑
				//if (this.loadCount < 3) {
				// 只讀取前兩頁資料
				var nextIndex = this.loadCount + 2; // 2
				console.log(ctx + "page/" + nextIndex);
				return ctx + "page/" + nextIndex; //  start load from /page/2
				//}
			},
			append : ".article", // 匯入物件類別
			history : false,
			status : ".scroller-status", // 捲軸狀態類別

		})
	</script>

</body>





</html>