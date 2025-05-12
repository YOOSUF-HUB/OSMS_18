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
	
	
	/* Description Popup CSS*/
	
	.description-container {
	  position: relative; /* Sets the context for absolutely positioned children (like .description-hover) */
	  display: inline-block; /* Keeps the container as small as its contents (prevents stretching across the cell) */
	}
	
	.description-scroll {
	  max-height: 50px; /* Limits the visible height of the description */
	  overflow-y: auto; /* Adds vertical scrollbar when content exceeds max-height */
	  text-align: left; /* Aligns text to the left */
	  padding: 5px; /* Adds inner space around the text */
	  white-space: pre-wrap; /* Preserves line breaks and wraps long lines */
	  word-break: break-word; /* Breaks long words to fit within box */
	  border: 1px solid #ddd; /* Light gray border around the box */
	  border-radius: 4px; /* Slightly rounded corners */
	  background-color: #fefefe; /* Very light background color */
	  width: 200px; /* Fixed width of the small box */
	  cursor: pointer; /* Shows a pointer cursor to indicate interactivity */
	}
	
	/* Hidden full view by default */
	.description-hover {
	  display: none; /* Initially hidden */
	  position: absolute; /* Positioned relative to .description-container */
	  top: 100%; /* Places it just below the small box */
	  left: 0; /* Aligns it with the left edge of the container */
	  z-index: 999; /* Ensures it appears above other elements */
	  width: 300px; /* Wider box for full description */
	  max-height: 300px; /* Limits height, with scroll if content is longer */
	  overflow-y: auto; /* Enables scrolling if content overflows */
	  background-color: #fff; /* White background */
	  border: 1px solid #ccc; /* Slightly darker border for contrast */
	  border-radius: 6px; /* More rounded corners for popup */
	  padding: 10px; /* Inner spacing for readability */
	  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Soft drop shadow for floating effect */
	  white-space: pre-wrap; /* Preserves line breaks */
	  word-break: break-word; /* Prevents overflow by breaking long words */
	}
	
	/* Show the full description on hover */
	.description-container:hover .description-hover {
	  display: block; /* Makes the hidden full description appear when hovering over the container */
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
	




    </style>
</head>
<body>


    <div class="container mt-5">
        <h2>Current Stock Inventory</h2>
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
                    <th>Stock ID</th>
                    <th>Product Name</th>
                    <th>Product Model</th>
                    <th>Product Manufacturer</th>
                    <th>Quantity</th>
                    <th>Purchase Price</th>
                    <th>Selling Price</th>
                    <th >Date</th>
                    <th>Description</th>
                    <th>Actions</th> 
                </tr>
            </thead>
            <tbody id="stock-table">
			    <c:choose>
			        <c:when test="${empty allStocks}">
			            <tr>
			                <td colspan="10" class="text-center text-muted">Stock table contains no entries at this time.</td>
			            </tr>
			        </c:when>
			        <c:otherwise>
			            <c:forEach var="stock" items="${allStocks}" varStatus="loop">
			                <tr id="stock-table-db">
			                	<td id="stock-table-row-num" >(${loop.index + 1})</td> <!-- Row number -->
			                    <td>${stock.item_id}</td>
			                    <td>${stock.item_name}</td>
			                    <td>${stock.item_model}</td>
			                    <td>${stock.item_manufacturer}</td>
			                    <td>${stock.quantity}</td>
			                    <td>${stock.unit_cost}</td> 
			                    <td>${stock.selling_price}</td>
			                    <td>${stock.date_added}</td>
								<td>
								  <div class="description-container">
								    <div class="description-scroll">${stock.description}</div>
								    <div class="description-hover">${stock.description}</div>
								  </div>
								</td>
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
        
        <div id="noReportsMessage" class="alert alert-info" style="display:none;" role="alert">
                    No reports found matching your search criteria.
		</div>
		
        <a href="StockManagement/create_stock.jsp" class="btn btn-primary" id="view-stock-btn-other">Add Stock</a>
        <a href="StockManagerDashboard.jsp" class="btn btn-danger" id="view-stock-btn-other">Back to Dashboard</a>
        
        
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>




function searchReports() {
    var input, filter, table, tr, td, i, txtValue, found;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("stock-table");
    tr = table.getElementsByTagName("tr");
    found = false;
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2]; 
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
                found = true;
            } else {
                tr[i].style.display = "none";
            }
        }
    }
    
    if (!found) {
        document.getElementById("noReportsMessage").style.display = "block";
    } else {
        document.getElementById("noReportsMessage").style.display = "none";
    }
}

document.getElementById("searchBtn").addEventListener("click", searchReports);

</script>


</body>
</html>
