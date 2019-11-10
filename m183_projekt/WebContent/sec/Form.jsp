<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style type="text/css">
body {
	background-color: #eee;
	-webkit-font-smoothing: antialiased;
	-moz-font-smoothing: grayscale;
}

.ui.container {
	margin-top: 6rem;
	max-width: 22rem !important;
}

.ui.large.form>.field:first-child {
	margin-bottom: 0;
}
</style>
</head>
<body id="root">
	<div class="ui center aligned grid">
		<div class="ui container">
			<h1 class="ui huge header">Please Sign-in</h1>
			<form class="ui large form" action="sec/Form.jsp" method="post">
				<div class="field">
					<div class="ui input">
						<input name="user" placeholder="Username" type="text" />
					</div>
				</div>
				</br>
				<div class="field">
					<div class="ui input">
						<input name="password" placeholder="Password" type="password" />
					</div>
				</div>
				<button class="ui fluid large primary button" type="submit">Log in</button>
			</form>
		</div>
	</div>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".ui.checkbox").checkbox();
			$(".ui.form").form({
				fields : {
					email : {
						identifier : "user",
						rules : [{
							type : "empty",
							prompt : "Please enter your username"
							}]},
					password : {
						identifier : "password",
						rules : [{
							type : "empty",
							prompt : "Please enter your password"
							},{
							type : "length[6]",
							prompt : "Your password must be at least 6 characters"
							}]}
				},
				inline : true,
				on : "blur"
			});
		});
	</script>
</body>
</html>