<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formular</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body id="root">
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if (session.getAttribute("user") == null) {
			response.sendRedirect("Login.jsp");
		}
		session.removeAttribute("user");
	%>
	<div class="ui center aligned grid">
		<div class="ui container">
			<h1 class="ui huge header">Your Reservation</h1>
			<form class="ui large form" action="FormServlet" method="post">
				<div class="required field">
					<label>Last name</label>
					<div class="ui input">
						<input name="name" placeholder="Last Name" type="text" />
					</div>
				</div>
				</br>
				<div class="required field">
					<label>E-Mail</label>
					<div class="ui input">
						<input name="email" placeholder="E-Mail" type="text" />
					</div>
				</div>
				<div class="required field">
					<label>Room</label>
					<div class="ui selection dropdown">
						<input type="hidden" name="room"> <i class="dropdown icon"></i>
						<div class="default text">Room</div>
						<div class="menu">
							<div class="item" data-value="1">Room 1.0</div>
							<div class="item" data-value="2">Room 2.0</div>
							<div class="item" data-value="3">Room 3.0</div>
							<div class="item" data-value="4">Room 4.0</div>
							<div class="item" data-value="5">Room 5.0</div>
						</div>
					</div>
				</div>
				<div class="required field">
					<label>Date</label>
					<div class="ui input">
						<input name="date" type="date" />
					</div>
				</div>
				<div class="required grouped fields">
					<label for="duration">Duration</label>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="duration" value="wd" checked
								tabindex="0" class="hidden"> <label>Whole day</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="duration" value="mo" tabindex="0"
								class="hidden"> <label>Morning</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="duration" value="an" tabindex="0"
								class="hidden"> <label>Afternoon</label>
						</div>
					</div>
				</div>
				<button class="ui fluid large primary button" type="submit"
					value="send">Send</button>
				<div class="ui error message"></div>
				<div class="ui error message"
					<%if (request.getAttribute("error") == "true") {
				out.print("style='display:block;'");
			} else {
				out.print("style='display:none;'");
			}%>>
					<div class="header">Failed to save data</div>
					<p>The data couldn't be saved to the database.</p>
				</div>
			</form>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$(".ui.checkbox").checkbox();
							$(".ui.selection.dropdown").dropdown();
							$(".ui.form")
									.form(
											{
												fields : {
													name : {
														identifier : "name",
														rules : [
																{
																	type : "regExp[/^[a-zA-Z]+$/]",
																	prompt : "Your name can only contain letters and has to be one word."
																},
																{
																	type : "maxLength[50]",
																	prompt : "Your name can't be that long."
																} ]
													},
													email : {
														identifier : "email",
														rules : [ {
															type : "email",
															prompt : "Your E-Mail has to be valid."
														} ]
													},
													room : {
														identifier : "room",
														rules : [ {
															type : "empty",
															prompt : "You have to select a room."
														} ]
													},
													date : {
														identifier : "date",
														rules : [ {
															type : "empty",
															prompt : "You have to select a date."
														} ]
													}
												},
												inline : true,
												on : "blur"
											});
						});
	</script>
</body>
</html>