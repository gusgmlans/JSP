<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<%
	String S_ID = (String)session.getAttribute("S_ID");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
	String S_NAME = (String)session.getAttribute("S_NAME");

	System.out.println(S_ID + "<-- S_ID");
	System.out.println(S_LEVEL + "<-- S_LEVEL");
	System.out.println(S_NAME + "<-- S_NAME");
%>

<!-- Begin Header -->
<div id = "header">
상단<br>
<%
	if(S_LEVEL == null){
%>         
	<!-- 로그인 전 화면 시작 -->		       	 
	<form action = "<%=request.getContextPath()%>/user_login/login_pro.jsp" method = "post">
		아이디: <input type="text" name="id" value="id001">
		비  번: <input type="password" name="pw" value="pw001">
		<input type="submit" value="로그인">
	</form><br>		   
	<!-- 로그인 전 화면 End -->
	<a href="<%=request.getContextPath()%>/user_insert/user_insert_form.jsp">회원가입</a>

<%
	}else{
%>
	<%=S_NAME%>님 <%=S_LEVEL%>로 로그인중... 
	<a href = "<%=request.getContextPath()%>/user_login/logout_pro.jsp">로그아웃</a><br><br>
<%
		if(S_LEVEL.equals("구매자")){
%>
	<a href = "<%=request.getContextPath()%>/goods/goods_search_list.jsp">상품검색</a>
<%
		}else if(S_LEVEL.equals("판매자")){
%>
	<a href = "<%=request.getContextPath()%>/goods/goods_insert_form.jsp">상품등록</a>
	<a href = "<%=request.getContextPath()%>/goods/goods_search_list.jsp">상품검색</a>	
<%
		}else if(S_LEVEL.equals("관리자")){
%>
	<a href = "<%=request.getContextPath()%>/user_search/user_search_list.jsp">회원검색</a>
	<a href = "<%=request.getContextPath()%>/goods/goods_insert_form.jsp">상품등록</a>
	<a href = "<%=request.getContextPath()%>/goods/goods_search_list.jsp">상품검색</a>
<%
		}
	}
%>
</div>
<!-- End Header -->