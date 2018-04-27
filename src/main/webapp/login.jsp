<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap_v3.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/login-style.css"/>">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<title>登入使用服務</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="account-wall">
					<div id="my-tab-content" class="tab-content">
						<div class="tab-pane active" id="login">
							<img class="profile-img"
								src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
								alt="">
							<form class="form-signin" action="signin"
								method="post"> <input type="text" class="form-control"
									placeholder="Username" name="username" required autofocus>
								<input type="password" class="form-control"
									placeholder="Password" name="password" required> <input
									type="submit" class="btn btn-lg btn-default btn-block"
									value="Sign In" /> <input type="hidden"
									name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>
							<div id="tabs" data-tabs="tabs">
								<p class="text-center">
									<a href="#register" data-toggle="tab">Need an Account?</a>
								</p>
								<p class="text-center">
									<a href="#select" data-toggle="tab">Select Account</a>
								</p>
							</div>
						</div>
						<div class="tab-pane" id="register">
							<form class="form-signin" action="" method="">
								<input type="text" class="form-control"
									placeholder="User Name ..." required autofocus> <input
									type="email" class="form-control"
									placeholder="Emaill Address ..." required> <input
									type="password" class="form-control" placeholder="Password ..."
									required> <input type="submit"
									class="btn btn-lg btn-default btn-block" value="Sign Up" />
							</form>
							<div id="tabs" data-tabs="tabs">
								<p class="text-center">
									<a href="#login" data-toggle="tab">Have an Account?</a>
								</p>
							</div>
						</div>
						<div class="tab-pane" id="select">
							<div id="tabs" data-tabs="tabs">
								<div class="media account-select">
									<a href="#user1" data-toggle="tab">
										<div class="pull-left">
											<img class="select-img"
												src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
												alt="">
										</div>
										<div class="media-body">
											<h4 class="select-name">User Name 1</h4>
										</div>
									</a>
								</div>
								<hr />
								<div class="media account-select">
									<a href="#user2" data-toggle="tab">
										<div class="pull-left">
											<img class="select-img"
												src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
												alt="">
										</div>
										<div class="media-body">
											<h4 class="select-name">User Name 2</h4>
										</div>
									</a>
								</div>
								<hr />
								<p class="text-center">
									<a href="#login" data-toggle="tab">Back to Login</a>
								</p>
							</div>
						</div>
						<div class="tab-pane" id="user1">
							<img class="profile-img"
								src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
								alt="">
							<h3 class="text-center">User Name 1</h3>
							<form class="form-signin" action="" method="">
								<input type="hidden" class="form-control" value="User Name">
								<input type="password" class="form-control"
									placeholder="Password" autofocus required> <input
									type="submit" class="btn btn-lg btn-default btn-block"
									value="Sign In" />
							</form>
							<p class="text-center">
								<a href="#login" data-toggle="tab">Back to Login</a>
							</p>
							<p class="text-center">
								<a href="#select" data-toggle="tab">Select another Account</a>
							</p>
						</div>
						<div class="tab-pane" id="user2">
							<img class="profile-img"
								src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
								alt="">
							<h3 class="text-center">User Name 2</h3>
							<form class="form-signin" action="" method="">
								<input type="hidden" class="form-control" value="User Name">
								<input type="password" class="form-control"
									placeholder="Password" autofocus required> <input
									type="submit" class="btn btn-lg btn-default btn-block"
									value="Sign In" />
							</form>
							<p class="text-center">
								<a href="#login" data-toggle="tab">Back to Login</a>
							</p>
							<p class="text-center">
								<a href="#select" data-toggle="tab">Select another Account</a>
							</p>
							<c:if test="${not empty sessionScope.message}">
								<span style="color: green"><c:out
										value="${sessionScope.message}" /></span>
								<c:remove var="message" scope="session" />
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>