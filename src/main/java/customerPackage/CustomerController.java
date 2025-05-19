package customerPackage;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import onlineStockManagement.DBconnection;

public class CustomerController implements ICustomerController {

	
	//connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	//insert customer function
	public boolean addCustomer(String cname, String bname, String email, String number, String address, String city,
	        String country, String zip) {

	    boolean isSuccess = false;

	    try {
	        con = DBconnection.getConnection();
	        stmt = con.createStatement();
	        
	        
	        String lastIdQuery = "SELECT customer_id FROM Customer ORDER BY customer_id DESC LIMIT 1";
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(lastIdQuery);
	        
	        String newCustomerId = "CUS1000"; 
	        
	        if (rs.next()) {
	            String lastId = rs.getString("customer_id"); 
	            int num = Integer.parseInt(lastId.substring(3)); 
	            newCustomerId = "CUS" + (num + 1); 
	        }

	        String sql = "INSERT INTO Customer (customer_id, customer_name, business_name, email, phone_number, address, city, country, zip_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        
	        pstmt.setString(1, newCustomerId);
	        pstmt.setString(2, cname);
	        pstmt.setString(3, bname);
	        pstmt.setString(4, email);
	        pstmt.setString(5, number);
	        pstmt.setString(6, address);
	        pstmt.setString(7, city);
	        pstmt.setString(8, country);
	        pstmt.setString(9, zip);

	        int rs = pstmt.executeUpdate();
	        isSuccess = rs > 0;
	        
	    } catch (Exception e) {
	        System.out.println("ERROR INSERTING CUSTOMER: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	
	
	public List<CustomerModel> getCustomerById(int customerId) {

		ArrayList<CustomerModel> customers = new ArrayList<>();
	    try {
	        con = DBconnection.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT * FROM Customer WHERE customer_id = " + customerId;
	        rs = stmt.executeQuery(sql);

	        if (rs.next()) {
	            int id = rs.getInt("customer_id");
	            String cname = rs.getString("customer_name");
	            String bname = rs.getString("business_name");
	            String email = rs.getString("email");
	            String number = rs.getString("phone_number");
	            String address = rs.getString("address");
	            String city = rs.getString("city");
	            String country = rs.getString("country");
	            String zip = rs.getString("zip_code");

	            CustomerModel customer = new CustomerModel(id, cname, bname, email, number, address, city, country, zip);
	            customers.add(customer);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } 
	    return customers;
	}
	
	//getting all customer details
	public List<CustomerModel> getAllCustomers() {
		
		ArrayList<CustomerModel> customers = new ArrayList<>();

	    try {
	        con = DBconnection.getConnection();
	        stmt = con.createStatement();
	        rs = stmt.executeQuery("SELECT * FROM Customer");

	        while (rs.next()) {
	            int id = rs.getInt(1);
	            String cname = rs.getString(2);
	            String bname = rs.getString(3);
	            String email = rs.getString(4);
	            String number = rs.getString(5);
	            String address = rs.getString(6);
	            String city = rs.getString(7);
	            String country = rs.getString(8);
	            String zip = rs.getString(9);

	            CustomerModel customer = new CustomerModel(id, cname, bname, email, number, address, city, country, zip);
	            customers.add(customer);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return customers;
	}
	
	
	
	//update customer
		public boolean updateCustomer(int id, String cname, String bname, String email, String number, String address, String city,
		        String country, String zip) {


		    try {
		        con = DBconnection.getConnection();
		        stmt = con.createStatement();

		        String sql = "UPDATE Customer SET "
		                + "customer_name = '" + cname + "', "
		                + "business_name = '" + bname + "', "
		                + "email = '" + email + "', "
		                + "phone_number = '" + number + "', "
		                + "address = '" + address + "', "
		                + "city = '" + city + "', "
		                + "country = '" + country + "', "
		                + "zip_code = '" + zip + "' "
		                + "WHERE customer_id = " + id;
		                    

		       
		        int rs = stmt.executeUpdate(sql);
		        
		        if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
		    } catch (Exception e) {
		        System.out.println("ERROR UPDATING CUSTOMER: " + e.getMessage());
		        e.printStackTrace();
		         
		    }

		    return isSuccess;
		}
		
		
		
		
		//delete function
		public boolean deleteCustomer(int id) {
			
			try {
		        con = DBconnection.getConnection();
		        stmt = con.createStatement();

		        String sql = "DELETE FROM Customer WHERE customer_id = " + id;

		       
		        int rs = stmt.executeUpdate(sql);
		        
		        if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
		    } catch (Exception e) {
		        System.out.println("ERROR DELETING CUSTOMER: " + e.getMessage());
		        e.printStackTrace();
		         
		    }

		    return isSuccess;
			
		}


}





