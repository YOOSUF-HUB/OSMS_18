package customerPackage;



import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import onlineStockManagement.DBconnection;
import onlineStockManagement.stockModel;

public class CustomerController {

	
	//connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	//insert data function
	public static boolean insertdata(String cname, String bname, String email, String number, String address, String city,
	        String province, String zip) {

	    boolean isSuccess = false;

	    try {
	        con = DBconnection.getConnection();
	        stmt = con.createStatement();

	        String sql = "INSERT INTO Customer (customer_name, business_name, email, phone_number, address, city, province, zip_code) " +
	                     "VALUES ('" + cname + "','" + bname + "','" + email + "','" + number + "','" + address + "','" + city + "','" + province + "','" + zip + "')";

	       
	        int rs = stmt.executeUpdate(sql);

	        if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
	    } catch (Exception e) {
	        System.out.println("ERROR INSERTING CUSTOMER: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	
	
	public static List<CustomerModel> getCustomerById(int customerId) {

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
	            String province = rs.getString("province");
	            String zip = rs.getString("zip_code");

	            CustomerModel customer = new CustomerModel(id, cname, bname, email, number, address, city, province, zip);
	            customers.add(customer);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } 
	    return customers;
	}
	
	//getting all customer details
	public static List<CustomerModel> getAllCustomers() {
		
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
	            String province = rs.getString(8);
	            String zip = rs.getString(9);

	            CustomerModel customer = new CustomerModel(id, cname, bname, email, number, address, city, province, zip);
	            customers.add(customer);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return customers;
	}
	
	
	
	//update  function
		public static boolean updateCustomer(int id, String cname, String bname, String email, String number, String address, String city,
		        String province, String zip) {


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
		                + "province = '" + province + "', "
		                + "zip_code = '" + zip + "' "
		                + "WHERE customer_id = " + id;
		        
		        System.out.println("Executing SQL: " + sql);

		                     

		       
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


}
