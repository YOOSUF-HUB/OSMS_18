<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSERT FORM FOR BOOK SHOP MANAGEMENT SYSTEM</title>
</head>
<body>

	<form action="InsertServlet" method="post">
	
	<table>
	

		
		<tr>
			<td>Name: </td>
			<td><input type = "text" name="name" required></td>
		</tr>
		
		
		<tr>
			<td>price: </td>
			<td><input type = "text" name="price" required></td>
		</tr>
		
		<tr>
			<td>category: </td>
			<td><input type = "text" name="category" required></td>
		</tr>
		
		<tr>
			<td>quantity: </td>
			<td><input type = "text" name="quantity" required></td>
		</tr>
		
		<tr>
			<td>description: </td>
			<td><input type = "text" name="description" required></td>
		</tr>
	
		<tr>
			<td>description: </td>
			<td><input type = "text" name="description" readonly></td>
		</tr>

		<tr>
		<td colspan="2"> <input type="submit"  value="Submit"></td>
		</tr>
		
		
	</table>
	
	</form>
</body>
</html>