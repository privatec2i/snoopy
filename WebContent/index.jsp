<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- Using Struts2 Tags in JSP --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<title>Login Page</title>
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