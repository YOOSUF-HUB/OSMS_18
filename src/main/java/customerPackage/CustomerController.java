package customerPackage;



import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import onlineStockManagement.DBconnection;

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

	        isSuccess = rs > 0;
	    } catch (Exception e) {
	        System.out.println("ERROR INSERTING CUSTOMER: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	
	
//	public static customerModel getCustomerById(int customerId) {
//	    CustomerModel customer = null;
//	    try {
//	        con = DBconnection.getConnection();
//	        stmt = con.createStatement();
//	        String sql = "SELECT * FROM Customers WHERE CustomerID = " + customerId;
//	        rs = stmt.executeQuery(sql);
//
//	        if (rs.next()) {
//	            int id = rs.getInt("CustomerID");
//	            String cname = rs.getString("CustomerName");
//	            String bname = rs.getString("BusinessName");
//	            String email = rs.getString("Email");
//	            String number = rs.getString("PhoneNumber");
//	            String address = rs.getString("Address");
//	            String city = rs.getString("City");
//	            String province = rs.getString("Province");
//	            String zip = rs.getString("ZipCode");
//
//	            Customer = new CustomerModel(id, cname, bname, email, number, address, city, province, zip);
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    } 
//	    return customer;
//	}
	
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


}
