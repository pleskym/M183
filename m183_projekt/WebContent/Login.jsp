<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body id="root">
	<div class="ui center aligned grid">
		<div class="ui container">
			<h1 class="ui huge header">Please Sign-in</h1>
			<form class="ui large form" action="LoginServlet" method="post">
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
				<button class="ui fluid large primary button" type="submit" value="login">Sign-in</button>
			</form>
			<div class="ui error message" <%
			if(request.getAttribute("error") == "true") {
				out.print("style='display:block;'");
			} else {
				out.print("style='display:none;'");
			}
			%>>
				<div class="header">Login failed</div>
				<p>Your username or password is wrong or there is an error with the database.</p>
			</div>
		</div>
	</div>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".ui.checkbox").checkbox();
			$(".ui.form").form({
				fields : {
					user : {
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
							type : "length[10]",
							prompt : "Your password must be at least 10 characters"
							}]}
				},
				inline : true,
				on : "blur"
			});
		});
	</script>
</body>
</html>