<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet prefetch'
	href="<c:url value="/resources/css/style-loader.css"/>">
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

body {
	font-family: sans-serif;
	line-height: 1.4;
	font-size: 18px;
	padding: 20px;
	max-width: 640px;
	margin: 0 auto;
}

.page-load-status {
	display: none; /* hidden by default */
	padding-top: 20px;
	border-top: 1px solid #DDD;
	text-align: center;
	color: #777;
}

#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 4px;
	background-color: white;
}
</style>
<title>Resault Page</title>
</head>
<body>
	<button onclick="topFunction()" id="myBtn" title="Go to top">
		<img
			src="https://cdn1.iconfinder.com/data/icons/arrows-97/24/444-512.png"
			width="40" height="40">
	</button>

	<input type="hidden" id="ctx" value="<c:url value="/" />" />
	<div class="container">
		<div class="article">1</div>
		<div class="article">2</div>
		<div class="article">3</div>
		<div class="article">4</div>
	</div>
	<!-- 捲軸狀態 -->
	<div class="page-load-status">
		<div class="loader-ellips infinite-scroll-request">
			<span class="loader-ellips__dot"></span> <span
				class="loader-ellips__dot"></span> <span class="loader-ellips__dot"></span>
			<span class="loader-ellips__dot"></span>
		</div>
		<p class="infinite-scroll-last">開始加載</p>
		<p class="infinite-scroll-error">沒有頁面可以讀取了</p>
	</div>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
	<script
		src='https://unpkg.com/infinite-scroll@3/dist/infinite-scroll.pkgd.js'></script>
	<script>
		var ctx = $("#ctx").val();
		$('.container').infiniteScroll({
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
			status : ".page-load-status", // 捲軸狀態類別

		})
		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction()
		};
		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				document.getElementById("myBtn").style.display = "block";
			} else {
				document.getElementById("myBtn").style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>

</body>





</html>