<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- Using Struts2 Tags in JSP --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<title>Login Page</title>
	<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/6.4.0/firebase-app.js"></script>
<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#config-web-app -->
<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyDKge4gV8lvwYY0C3NBZeTJj9zqzy8ICRE",
    authDomain: "privatec2i-29db8.firebaseapp.com",
    databaseURL: "https://privatec2i-29db8.firebaseio.com",
    projectId: "privatec2i-29db8",
    storageBucket: "",
    messagingSenderId: "998162121992",
    appId: "1:998162121992:web:d1d6199edc712309"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
</script>
	</head>
	<body>
		<h3>Welcome to Snoopy World!!</h3>
		<img style="width:300px;height:300px;" src="resources/images/snoopy.png">
		<s:form action="letsChat">
			<s:textfield name="username" label="User Name"></s:textfield>.
			<s:textfield name="fullname" label="Full Name"></s:textfield>
			<s:submit value="Lets Chat"></s:submit>
		</s:form>
	</body>
</html>