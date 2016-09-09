<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.golembiewski.lab24.DAO"%>
<%@ page import="com.golembiewski.lab24.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Users</title>
</head>
<body>
	<jsp:useBean id="obj" class="com.golembiewski.lab24.User">
	</jsp:useBean>
	<jsp:setProperty property="*" name="obj" />
	<table>
		<%
			List<User> users = DAO.getAllUsers();
			for (User u : users) {
				out.println ("<tr><td>" + u.getID() + "</td><td>" +
						u.getUsername() + "</td><td>" + u.getEmail() 
						+ "</td><td>" + u.getFullname() + "</td>"
						+ "<td><a href=\"deleteuser.jsp?id=" 
						+ u.getID()+ "\">Delete</a>"
						+ "</td></tr>");

			}
		%>
	</table>

</body>
</html>