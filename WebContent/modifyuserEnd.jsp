<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.golembiewski.lab24.DAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Modified</title>
</head>
<body>
	<jsp:useBean id="obj" class="com.golembiewski.lab24.User">
	</jsp:useBean>
	<jsp:setProperty property="*" name="obj" />
	<h1>The selected account has been changed.</h1>
	<%
		DAO.modifyUser(obj);
	%>
	<br>
	<br>
	<a href="listusers.jsp">List Users</a>
</body>

</body>
</html>