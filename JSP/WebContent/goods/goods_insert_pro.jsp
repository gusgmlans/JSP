<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>

<!DOCTYPE html>

<%
	Connection connection = null;
	PreparedStatement preparedStatement1 = null;
	ResultSet resultSet1 = null;
	PreparedStatement preparedStatement2 = null;

	request.setCharacterEncoding("EUC-KR");

	String u_id = request.getParameter("u_id");
	String g_name = request.getParameter("g_name");
	String g_cate = request.getParameter("g_cate");
	String g_price = request.getParameter("g_price");
	String g_color = request.getParameter("g_color");
	String g_size = request.getParameter("g_size");
	String g_desc = request.getParameter("g_desc");
	
	System.out.println(u_id + "<-- u_id");
	System.out.println(g_name + "<-- g_name");
	System.out.println(g_cate + "<-- g_cate");
	System.out.println(g_price + "<-- g_price");
	System.out.println(g_color + "<-- g_color");
	System.out.println(g_size + "<-- g_size");
	System.out.println(g_desc + "<-- g_desc");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/db14hhm?useUnicode=true&characterEncoding=euckr";
	String dbUser = "dbid14hhm";
	String dbPass = "dbpw14hhm";
	
	connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(connection + "<-- connection");
	
	preparedStatement1 = connection.prepareStatement("SELECT MAX(CAST(SUBSTRING(g_code, 7) AS DECIMAL)) AS maxCode FROM tb_goods");
	System.out.println(preparedStatement1 + "<-- preparedStatement1");
	
	resultSet1 = preparedStatement1.executeQuery();
	System.out.println("preparedStatement1.executeQuery");
	
	int max1 = 0;
	
	String tempCode = "goods_";
	
	String g_code = "goods_1";
	
	if (resultSet1.next()) {
		max1 = resultSet1.getInt("maxCode");
		System.out.println(max1 + "<-- max1");
		int max2 = max1 + 1;
		System.out.println(max2 + "<-- max2");
		g_code = tempCode + max2;
	}
	
	resultSet1.close();
	
	preparedStatement1.close();
	
	System.out.println(g_code + "<-- g_code");
	
	preparedStatement2 = connection.prepareStatement("INSERT INTO tb_goods VALUES (?, ?, ?, ?, ?, ?, ?, now(), ?)");
	System.out.println(preparedStatement2 + "<-- preparedStatement2");
	
	preparedStatement2.setString(1, g_code);
	preparedStatement2.setString(2, u_id);
	preparedStatement2.setString(3, g_name);
	preparedStatement2.setString(4, g_cate);
	preparedStatement2.setString(5, g_price);
	preparedStatement2.setString(6, g_color);
	preparedStatement2.setString(7, g_size);
	preparedStatement2.setString(8, g_desc);
	
	preparedStatement2.executeUpdate();
	System.out.println("preparedStatement2.executeUpdate");
	
	preparedStatement2.close();
	
	connection.close();

	response.sendRedirect(request.getContextPath() + "/goods/goods_search_list.jsp");
%>