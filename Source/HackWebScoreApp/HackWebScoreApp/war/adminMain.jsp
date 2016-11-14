<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="index.css"></link>
</head>
<body>
<br><br><br>
<button id="popup" onclick="div_show()" class="button button-block">Manage Teams</button>
<div id="Form">
<!-- Popup Div Starts Here -->
<div id="popupContact">
<!-- Contact Us Form -->
<form action="#" id="form" method="post" name="form">
<img id="close" src="images.png" onclick ="div_hide()">
<h2>Team Details</h2>
<input id="uniqueid" name="id" placeholder="UniqueId" type="text">
<input id="name" name="name" placeholder="Name" type="text">
<input id="email" name="email" placeholder="Email" type="text">
<textarea id="msg" name="members" placeholder="TeamMembers"></textarea>
<a href="javascript:%20check_empty()" id="submit">Send</a>
</form>
</div>
<!-- Popup Div Ends Here -->
</div>
<!-- Display Popup Button -->
<button type="button" onclick="location.href='checkScores.jsp'" class="button button-block">Check Scores</button> 
<button type="button" onclick="location.href='visualize.jsp'" class="button button-block">Visualize Scores</button>
<script>
//Validating Empty Field
function check_empty() {
if (document.getElementById('uniqueid').value=="" || document.getElementById('name').value == "" || document.getElementById('email').value == "" || document.getElementById('msg').value == "") {
alert("Fill All Fields !");
} else {
document.getElementById('form').submit();
alert("Form Submitted Successfully...");
}
}
//Function To Display Popup
function div_show() {
document.getElementById('Form').style.display = "block";
}
//Function to Hide Popup
function div_hide(){
document.getElementById('Form').style.display = "none";
}
</script> 
</body>
</html>