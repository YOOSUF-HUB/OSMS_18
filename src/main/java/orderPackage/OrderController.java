package orderPackage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import onlineStockManagement.DBconnection;

public class OrderController {
	
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
		
		
		
	//insert data function
	public static boolean insertdata (int item_id, int quantity, Date orderDate, int cusId, float total_price) {
		
		isSuccess = false;
		
		try {
			//do connection call
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL 
			String sql = "INSERT INTO Orders (item_id, quantity, orderDate, customer_id, total_price) VALUE('"+item_id+"','"+quantity+"','"+orderDate+"','"+cusId+"', '"+total_price+"')";
			
			int rs = stmt.executeUpdate(sql);
			if(rs>0) {
					isSuccess = true;
			}
			else {
				isSuccess = false;
			}
				
		}
		catch(Exception e){
			e.printStackTrace();
				
		}
		
		
		return isSuccess;
		
	}
	
	
	public static List<OrderModel> getOrderById(int orderId){
		ArrayList<OrderModel> orders = new ArrayList<>();
		
		try {
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			// Corrected SQL Query with proper JOIN syntax
            String sql = "SELECT O.order_id AS orderid, S.item_name AS itemname, O.quantity AS qty, O.orderDate AS odate, O.order_status AS ostatus, C.business_name AS bname, C.city AS city, O.total_price as total_price "
                    + "FROM Orders O "
                    + "JOIN Customer C ON O.customer_id = C.customer_id "
                    + "JOIN Stock_Items S ON O.item_id = S.item_id "
                    + "WHERE order_id = " + orderId;

            rs = stmt.executeQuery(sql); // Execute the correct SQL query

            while (rs.next()) {
                int orderid = rs.getInt("orderid");  
                String itemname = rs.getString("itemname");
                String qty = rs.getString("qty");
                String odate = rs.getString("odate");
                String ostatus = rs.getString("ostatus");
                String bname = rs.getString("bname");
                String city = rs.getString("city");
                float tprice= rs.getFloat("total_price");
      

                OrderModel order = new OrderModel(orderid, itemname, qty, odate, ostatus,bname, city, tprice);
                orders.add(order);
        
            }
		}catch (Exception e) {
	        e.printStackTrace();
	    } 
	    return orders;
	}
	
	
	// getting all order details
	public static List<OrderModel> getAllOrders(){
		
		ArrayList<OrderModel> orders = new ArrayList<> ();
		
		try {
            con = DBconnection.getConnection();
            stmt = con.createStatement();
            
           
            String sql = "SELECT O.order_id AS orderid, S.item_name AS itemname, O.quantity AS qty, O.orderDate AS odate, O.order_status AS ostatus, C.business_name AS bname, C.city AS city, O.total_price as total_price "
                    + "FROM Orders O "
                    + "JOIN Customer C ON O.customer_id = C.customer_id "
                    + "JOIN Stock_Items S ON O.item_id = S.item_id "
                    + "ORDER BY orderid";

            rs = stmt.executeQuery(sql); // Execute the correct SQL query

            while (rs.next()) {
                int orderid = rs.getInt("orderid");  
                String itemname = rs.getString("itemname");
                String qty = rs.getString("qty");
                String odate = rs.getString("odate");
                String ostatus = rs.getString("ostatus");
                String bname = rs.getString("bname");
                String city = rs.getString("city");
                float tprice= rs.getFloat("total_price");

                OrderModel order = new OrderModel(orderid, itemname, qty, odate, ostatus, bname, city, tprice);
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		return orders;
	}
	
	
	
	public static boolean updateOrder(int orderId, int qty, float totalPrice) {
	    boolean isSuccess = false;
	    try {
	        con = DBconnection.getConnection();
	        stmt = con.createStatement();
	        String sql = "UPDATE Orders SET  quantity = " + qty +
	                     ", total_price = " + totalPrice + 
	                     " WHERE order_id = " + orderId;
	        int rs = stmt.executeUpdate(sql);
	        isSuccess = rs > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	}
	
	
	//delete function
	public static boolean deleteOrder(int id) {
		
		try {
	        con = DBconnection.getConnection();
	        stmt = con.createStatement();

	        String sql = "DELETE FROM Orders WHERE order_id = " + id;

	       
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


	// order_id, item_id, quantity, orderDate, customer_id, total_price, order_status

	public static boolean updateOrderStatus(int orderid, String ostatus, int qty) throws SQLException {
	    boolean isSuccess = false;

	    String sql = "UPDATE Orders SET order_status = ? WHERE order_id = ?";
	    
	    
	    try (Connection con = DBconnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, ostatus);
	        ps.setInt(2, orderid);

	        isSuccess = ps.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}





}
