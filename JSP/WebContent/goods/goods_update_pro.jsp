<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.SQLException"%>

<!DOCTYPE html>

<%
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	
	request.setCharacterEncoding("EUC-KR");
	
	String g_code = request.getParameter("g_code");
	String u_id = request.getParameter("u_id");
	String g_name = request.getParameter("g_name");
	String g_cate = request.getParameter("g_cate");
	String g_price = request.getParameter("g_price");
	String g_color = request.getParameter("g_color");
	String g_size = request.getParameter("g_size");
	String g_date = request.getParameter("g_date");
	String g_desc = request.getParameter("g_desc");

	System.out.println(g_code + "<-- g_code");
	System.out.println(u_id + "<-- u_id");
	System.out.println(g_name + "<-- g_name");
	System.out.println(g_cate + "<-- g_cate");
	System.out.println(g_price + "<-- g_price");
	System.out.println(g_color + "<-- g_color");
	System.out.println(g_size + "<-- g_size");
	System.out.println(g_date + "<-- g_date");
	System.out.println(g_desc + "<-- g_desc");

	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/gusgmlans?useUnicode=true&characterEncoding=euckr";
	String dbUser = "gusgmlans";
	String dbPass = "qudtls78!!@@";
	
	connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(connection + "<-- connection");
	
	preparedStatement = connection.prepareStatement("UPDATE tb_goods SET g_name = ?, g_cate = ?, g_price = ?, g_color = ?, g_size = ?, g_date = now(), g_desc = ? WHERE g_code = ?");
	System.out.println(preparedStatement + "<-- preparedStatement");
	
	preparedStatement.setString(1, g_name);
	preparedStatement.setString(2, g_cate);
	preparedStatement.setString(3, g_price);
	preparedStatement.setString(4, g_color);
	preparedStatement.setString(5, g_size);
	preparedStatement.setString(6, g_desc);
	preparedStatement.setString(7, g_code);

	preparedStatement.executeUpdate();
	System.out.println("preparedStatement.executeUpdate");

	preparedStatement.close();
		
	connection.close();

	response.sendRedirect(request.getContextPath() + "/goods/goods_search_list.jsp");
%>