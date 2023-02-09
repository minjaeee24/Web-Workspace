<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String pizza	 = (String)	  request.getAttribute("pizza");
	String[] topping = (String[]) request.getAttribute("topping");
	String[] side 	 = (String[]) request.getAttribute("side");
	int price 		 = (int) request.getAttribute("price");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2{color:pink;}
	#pizza{color:red;}
	#topping{color:green;}
	#side{color:blue;}
</style>
</head>
<body>
	<h2 style="color:black">주문 내역</h2>
	
	피자는 <span id='pizza'><%= pizza %></span>
	, 토핑은 <span id='topping'>
	<% if(topping == null) { %>
		없고
	<% }else { %>
		<%= String.join(",", topping) %>
	<% } %>
	</span>
	, 사이드는 <span id='side'>
<% if(side == null) { %>
		선택을 안 했습니다.
	<% }else { %>
		
		<% for(int i = 0; i < side.length; i++) { %>
			<%= side[i] %>
		<% } %>
		
	<% } %>	
	</span>
	주문하셨습니다.
	<br><br>
	
	총합 : <%= price %>원
	
	<h2>즐거운 식사시간 되세요 ~</h2>
</body>
</html>