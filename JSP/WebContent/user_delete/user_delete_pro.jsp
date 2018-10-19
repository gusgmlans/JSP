<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>

<!DOCTYPE html>

<%
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	
	request.setCharacterEncoding("EUC-KR");
	
	String get_id = request.getParameter("send_id");
	System.out.println(get_id + "<-- get_id");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/db14hhm?useUnicode=true&characterEncoding=euckr";
	String dbUser = "dbid14hhm";
	String dbPass = "dbpw14hhm";
	
	connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(connection + "<-- connection");
	
	preparedStatement = connection.prepareStatement("DELETE FROM tb_user WHERE u_id = ?");
	preparedStatement.setString(1, get_id);
	System.out.println(preparedStatement + "<-- preparedStatement");

	preparedStatement.executeUpdate();
	System.out.println("preparedStatement.executeUpdate");
	
	preparedStatement.close();
	
	connection.close();
	
	response.sendRedirect(request.getContextPath() + "/user_search/user_search_list.jsp");
%>