<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>

<!DOCTYPE html>

<%
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	
	request.setCharacterEncoding("EUC-KR");
	
	String u_id = request.getParameter("u_id");
	String u_pw = request.getParameter("u_pw");
	String u_level = request.getParameter("u_level");
	String u_name = request.getParameter("u_name");
	String u_email = request.getParameter("u_email");
	String u_phone = request.getParameter("u_phone");
	String u_addr = request.getParameter("u_addr");
	
	System.out.println(u_id + "<-- u_id");
	System.out.println(u_pw + "<-- u_pw");
	System.out.println(u_level + "<-- u_level");
	System.out.println(u_name + "<-- u_name");
	System.out.println(u_email + "<-- u_email");
	System.out.println(u_phone + "<-- u_phone");
	System.out.println(u_addr + "<-- u_addr");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/gusgmlans?useUnicode=true&characterEncoding=euckr";
	String dbUser = "gusgmlans";
	String dbPass = "qudtls78!!@@";
	
	connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(connection + "<-- connection");
	
	preparedStatement = connection.prepareStatement("INSERT INTO tb_user VALUES(?, ?, ?, ?, ?, ?, ?)");
	System.out.println(preparedStatement + "<-- preparedStatement");
	
	preparedStatement.setString(1, u_id);
	preparedStatement.setString(2, u_pw);
	preparedStatement.setString(3, u_level);
	preparedStatement.setString(4, u_name);
	preparedStatement.setString(5, u_email);
	preparedStatement.setString(6, u_phone);
	preparedStatement.setString(7, u_addr);
	
	preparedStatement.executeUpdate();
	System.out.println("preparedStatement.executeUpdate");
	
	preparedStatement.close();
	
	connection.close();
	
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>