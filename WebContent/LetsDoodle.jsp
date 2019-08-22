<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- Using Struts2 Tags in JSP --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lets Doodle</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<script src="https://js.pusher.com/5.0/pusher.min.js"></script>
<script>
	// Enable pusher logging - don't include this in production
	Pusher.logToConsole = true;

	var pusher = new Pusher('6f91cb8f07188889118f', {
		cluster : 'ap1',
		forceTLS : true
	});

	var channel = pusher.subscribe('drawingchannel');
	channel.bind('drawingevent', function(data) {
		drawViaPusher(data.xpos,data.ypos);
	});
</script>
</head>
<body>
	<canvas id="draw"></canvas>
	
	<script src="app.js"></script>
	
</body>
</html>