<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>

<!DOCTYPE html>

<%
	Connection connection = null;
	PreparedStatement preparedStatement = null;

	request.setCharacterEncoding("EUC-KR");
	
	String get_g_code = request.getParameter("send_g_code");
	System.out.println(get_g_code + "<-- get_g_code");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/gusgmlans?useUnicode=true&characterEncoding=euckr";
	String dbUser = "gusgmlans";
	String dbPass = "qudtls78!!@@";
	
	connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(connection + "<-- connection");
	
	preparedStatement = connection.prepareStatement("DELETE FROM tb_goods WHERE g_code = ?");
	System.out.println(preparedStatement + "<-- preparedStatement");
	
	preparedStatement.setString(1, get_g_code);

	preparedStatement.executeUpdate();
	System.out.println("preparedStatement.executeUpdate");

	preparedStatement.close();
	
	connection.close();
	
	response.sendRedirect(request.getContextPath() + "/goods/goods_search_list.jsp");
%>