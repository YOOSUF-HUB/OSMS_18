package orderPackage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
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
	public static boolean insertdata (int item_id, int quantity, Date orderDate, int cusId) {
		
		isSuccess = false;
		
		try {
			//do connection call
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL 
			String sql = "INSERT INTO Orders (item_id, quantity, orderDate, customer_id) VALUE('"+item_id+"','"+quantity+"','"+orderDate+"','"+cusId+"')";
			
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
	
	
	// getting all order details
	public static List<OrderModel> getAllOrders(){
		
		ArrayList<OrderModel> orders = new ArrayList<> ();
		
		try {
            con = DBconnection.getConnection();
            stmt = con.createStatement();
            
            // Corrected SQL Query with proper JOIN syntax
            String sql = "SELECT O.order_id AS orderid, S.item_name AS itemname, O.quantity AS qty, O.orderDate AS odate, C.business_name AS bname, C.city AS city "
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
                String bname = rs.getString("bname");
                String city = rs.getString("city");

                OrderModel order = new OrderModel(orderid, itemname, qty, odate, bname, city);
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		return orders;
	}

}
