 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Stock</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>

        
	body {
	    background-color: #f8f9fa;
	    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	}
	
	h2 {
	    text-align: center;
	    margin-bottom: 30px;
	    color: #343a40;
	}
	
	.table {
	    background-color: white;
	    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
	    border-radius: 8px;
	    /* overflow: hidden; */
	    
	    overflow: visible !important; /* Allow popups to overflow */
  		position: relative; /* Needed to correctly layer popups */
	}
	
	
	.table thead {
	    background-color: #343a40;
	    color: #fff;
	    width:100%;
	}
	
	.table thead th {
	    text-align: center;
	    vertical-align: middle;
	}
	
	.table tbody td {
    vertical-align: middle;
    text-align: center;
    font-size: 0.95rem; /* or use 12px if you prefer px */
	}

	
	.table tbody tr:hover {
	    background-color: #f1f1f1;
	    transition: background-color 0.3s ease;
	}
	
	.btn {
	    padding: 6px 14px;
	    font-size: 0.875rem;
	    border-radius: 6px;
	    transition: all 0.2s ease-in-out;
	}
	
	.btn-secondary:hover {
	    background-color: #5a6268;
	}
	
	.btn-danger:hover {
	    background-color: #c82333;
	}
	
	
	.container {
	    max-width: 1600px; /* Bootstrap default is 960px */
	    margin: auto;
	    padding: 20px;
	    
	    overflow: visible !important; /* Let things inside pop out */
  		position: relative; /* Helps with z-index layering */
	}
	
	
	#view-stock-btn-other{
		padding: 10px 20px;
		margin-top: 20px;
		margin-left: 20px;
		margin-bottom: 20px;
		font-size: 1rem ;
	
	}
	
	@media (max-width: 768px) {
	    .table th, .table td {
	        font-size: 0.8rem;
	    }
	
	    h2 {
	        font-size: 1.4rem;
	    }
	}
	
	
	
	#add-stock-action-btn{
	
		margin-top: 5px;
	
	}
	
	#stock-table-row-num{
		
		font-size:1rem;
	
	}




    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Current Stock Inventory</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                	<th>#</th> <!-- Row number header -->
                    <th>Supplier ID</th>
                    <th>Name</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>Country</th>
                    <th >Website</th>
                    <th>Date</th> 
                </tr>
            </thead>
            <tbody>
			    <c:choose>
			        <c:when test="${empty allSupplier}">
			            <tr>
			                <td colspan="10" class="text-center text-muted">Table is Empty</td>
			            </tr>
			        </c:when>
			        <c:otherwise>
			            <c:forEach var="supplier" items="${allSupplier}" varStatus="loop">
			                <tr id="stock-table-db">
			                	<td id="stock-table-row-num" >(${loop.index + 1})</td> <!-- Row number -->
			                    <td>${supplier.supplier_id}</td>
			                    <td>${supplier.supplier_name}</td>
			                    <td>${supplier.phone_number}</td>
			                    <td>${supplier.email}</td>
			                    <td>${supplier.supplier_address}</td>
			                    <td>${supplier.supplier_city}</td> 
			                    <td>${supplier.supplier_country}</td>
			                    <td>${supplier.supplier_website}</td>
			                    <td>${supplier.s_date_added}</td>
	 			                <td class="add-stock-action-btn">
			                        <a href="StockManagement/update_stock.jsp?item_id=${stock.item_id}&item_name=${stock.item_name}&item_model=${stock.item_model}&item_manufacturer=${stock.item_manufacturer}&quantity=${stock.quantity}&unit_cost=${stock.unit_cost}&selling_price=${stock.selling_price}&date_added=${stock.date_added}&description=${stock.description}" class="btn btn-primary" id="add-stock-action-btn">Update</a>
									
									<form action="DeleteStockServlet" method="post"">
									    <input type="hidden" name="item_id" value="${stock.item_id}" />
									    <button type="submit" class="btn btn-danger btn-sm" id="add-stock-action-btn">Delete</button>
									</form>


			                    </td>
			                </tr>
			            </c:forEach>
			        </c:otherwise>
			    </c:choose>

            </tbody>
        </table>
        <a href="SupplierManagement/create_supplier.jsp" class="btn btn-primary" id="view-stock-btn-other">Add Supplier</a>
        <a href="StockManagerDashboard.jsp" class="btn btn-secondary" id="view-stock-btn-other">Back to Dashboard</a>
        
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
