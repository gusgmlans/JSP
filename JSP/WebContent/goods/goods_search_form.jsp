<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<body>
		<h1>상품검색</h1>
		<form action = "<%=request.getContextPath()%>/goods/goods_search_list.jsp" method = "post">
			<select name = "searchKey">
				<option value = "g_code">상품코드</option>
				<option value = "u_id">아이디</option>
				<option value = "g_name">상품명</option>
				<option value = "g_cate">카테고리</option>
				<option value = "g_price">가격</option>
				<option value = "g_color">색상</option>
				<option value = "g_size">사이즈</option>
				<option value = "g_date">날짜</option>
				<option value = "g_desc">상세설명</option>
			</select>
			<input type = "text" name = "searchValue">
			<input type = "submit" value = "상품검색">
		</form>
	</body>
</html>