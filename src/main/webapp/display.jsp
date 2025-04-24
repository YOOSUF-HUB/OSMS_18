<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALL BOOKS</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

	<table>
	
		<tr>
		
			<th>ID</th>
			<th>Name</th>
			<th>Price</th>
			<th>Category</th>
			<th>Quantity</th>
			<th>Description</th>
			<th>Description</th>
		
		</tr>
		
		<c:forEach var="book" items="${allBooks}">

		<tr>
		
			<td>${book.id}</td>
			<td>${book.name}</td>
			<td>${book.price}</td>
			<td>${book.category}</td>
			<td>${book.quantity}</td>
			<td>${book.description}</td>
			
		</tr>
		
		</c:forEach>
		 
	</table>
	
</body>
</html>