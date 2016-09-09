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
<title>User Deleter</title>
</head>
<body>
<p>User deleted.</p>
<% 
String req = request.getQueryString();
String[] requests = req.split("&");

for (String s : requests){
    String[] pair = s.split("=");
    DAO.deleteUser(Integer.valueOf(pair[1]));
}
%>

</body>
</html>