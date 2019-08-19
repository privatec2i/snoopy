<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Let's Chat</title>
<script src="https://js.pusher.com/5.0/pusher.min.js"></script>
<script>
	function sendMessage(){
			var musername = document.getElementById("username").value;
			var mmessage = document.getElementById("message").value;
			var mfullname = document.getElementById("fullname").value;

			$.ajax({
				type : "GET",
				url : "sendMessage",
				data : {"username":musername,"message":mmessage,"fullname":mfullname},
				success : function(data) {
					// message sent
					document.getElementById("message").value = "";
				},
				error : function(data) {
					alert("Some error occured.");
				}
			});
		
	}
</script>
<script>
	// Enable pusher logging - don't include this in production
	Pusher.logToConsole = true;

	var pusher = new Pusher('6f91cb8f07188889118f', {
		cluster : 'ap1',
		forceTLS : true
	});

	var channel = pusher.subscribe('my-channel');
	channel.bind('my-event', function(data) {
		var nameSpan = document.createElement("span");
		nameSpan.innerHTML = "<b>"+data.fullname + ": </b>";
		
		var messageSpan = document.createElement("span");
		messageSpan.innerHTML = data.message;
		
		var myDiv = document.createElement("div");
		myDiv.append(nameSpan);
		myDiv.append(messageSpan);
		
		var messageDiv = document.getElementById("messageDiv");
		messageDiv.append(myDiv);
	});
</script>
</head>
<body>
	<script>
		var username = "${session.username}";
	</script>
	<div style="width: 100%; height: 300px; background-color: #eee;" id="messageDiv">
		
	</div>
	<div>
		<div>
			<s:hidden name="username" id="username" value="%{#session.username}"/>
			<s:hidden name="fullname" id="fullname" value="%{#session.fullname}"/>
			<s:textfield name="message" id="message" style="width: 96%;float:left;"></s:textfield>
			<button id="sendbutton" name="sendbutton" value="Send" onclick="sendMessage();">Send</button>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
</body>
</html>