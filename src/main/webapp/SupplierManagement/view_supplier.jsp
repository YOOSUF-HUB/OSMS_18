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
	
	.search-bar-container {
	  max-width: 400px;
	  margin: 0 auto 30px auto;
	}
	
	#searchInput {
	  border-radius: 0.25rem 0 0 0.25rem;
	  padding: 10px 12px;
	  font-size: 1rem;
	  border: 1px solid #ced4da;
	}
	
	#searchBtn {
	  border-radius: 0 0.25rem 0.25rem 0;
	  padding: 6px 16px;
	  font-size: 1rem;
	}
	
	.table tbody td .badge {
	  font-size: 1rem; /* Increase font size to 16px (default 0.8rem or less) */
	  padding: 0.4em 0.7em; /* optional: adjust padding for better look */
	}




    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Supplier Directory</h2>
        <div class="input-group mb-4 search-bar-container">
		  <input type="text" id="searchInput" class="form-control" placeholder="Search...">
		  <div class="input-group-append">
		    <button class="btn btn-outline-primary" type="button" id="searchBtn">Search</button>
		  </div>
		</div>
		
      
      
      
      
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
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
			    <c:choose>
			        <c:when test="${empty allSupplier}">
			            <tr>
			                <td colspan="10" class="text-center text-muted">No supplier records are currently available.</td>
			            </tr>
			        </c:when>
			        <c:otherwise>
			            <c:forEach var="supplier" items="${allSupplier}" varStatus="loop">
			                <tr id="stock-table-db">
			                	<td id="stock-table-row-num" >(${loop.index + 1})</td> <!-- Row number -->
			                    <td><span class="badge badge-primary">SUPPL_${supplier.supplier_id}</span></td>
			                    <td>${supplier.supplier_name}</td>
			                    <td>${supplier.phone_number}</td>
			                    <td>${supplier.email}</td>
			                    <td>${supplier.supplier_address}</td>
                  				<td><span class="badge badge-info">${supplier.supplier_city}</span></td>
                  				<td><span class="badge badge-success">${supplier.supplier_country}</span></td>
			                    <td>${supplier.supplier_website}</td>
			                    <td>${supplier.s_date_added}</td>
	 			                <td class="add-stock-action-btn">
			                        <a href="SupplierManagement/update_supplier.jsp?supplier_id=${supplier.supplier_id}&supplier_name=${supplier.supplier_name}&phone_number=${supplier.phone_number}&email=${supplier.email}&supplier_address=${supplier.supplier_address}&supplier_city=${supplier.supplier_city}&supplier_country=${supplier.supplier_country}&supplier_website=${supplier.supplier_website}&s_date_added=${supplier.s_date_added}" class="btn btn-primary" id="add-stock-action-btn">Update</a>
									
									<form action="DeleteSupplierServlet" method="post"">
									    <input type="hidden" name="supplier_id" value="${supplier.supplier_id}" />
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
    
    <script>
	function filterTable() {
	    var input, filter, table, tr, td, i, j, txtValue;
	    input = document.getElementById("searchInput");
	    filter = input.value.toUpperCase();
	    table = document.querySelector("table");
	    tr = table.getElementsByTagName("tr");
	
	    for (i = 1; i < tr.length; i++) { // start from 1 if row 0 is the header
	        td = tr[i].getElementsByTagName("td");
	        tr[i].style.display = "none"; // default to hide
	        for (j = 0; j < td.length; j++) {
	            if (td[j]) {
	                txtValue = td[j].textContent || td[j].innerText;
	                if (txtValue.toUpperCase().indexOf(filter) > -1) {
	                    tr[i].style.display = "";
	                    break;
	                }
	            }
	        }
	    }
	}
	
	/* document.getElementById("searchInput").addEventListener("input", filterTable); */
	document.getElementById("searchBtn").addEventListener("click", filterTable);

	</script>
</body>
</html>
