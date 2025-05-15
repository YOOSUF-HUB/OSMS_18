package StockOrderManagement;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import onlineStockManagement.DBconnection;

public class StockOrderControl {

    // insertStockOrder
    public static boolean insertStockOrder(
        String order_date,
        int quantity_ordered,
        float unit_price,
        float total_price,
        String order_status,
        String expected_delivery_date,
        String payment_status,
        String notes,
        String received_date,
        String invoice_number,
        int supplier_id) {

        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBconnection.getConnection();
            String sql = "INSERT INTO stock_orders (order_date, quantity_ordered, unit_price, total_price, "
                       + "order_status, expected_delivery_date, payment_status, notes, received_date, "
                       + "invoice_number, supplier_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, order_date);
            pstmt.setInt(2, quantity_ordered);
            pstmt.setFloat(3, unit_price);
            pstmt.setFloat(4, total_price);
            pstmt.setString(5, order_status);
            pstmt.setString(6, expected_delivery_date);
            pstmt.setString(7, payment_status);
            pstmt.setString(8, notes);
            pstmt.setString(9, received_date);
            pstmt.setString(10, invoice_number);
            pstmt.setInt(11, supplier_id);

            isSuccess = pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }

    // getOrderById
    public static List<StockOrderModel> getOrderById(int orderId) {
        List<StockOrderModel> orders = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBconnection.getConnection();
            String sql = "SELECT * FROM stock_orders WHERE order_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, orderId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                StockOrderModel order = new StockOrderModel(
                    rs.getInt("order_id"),
                    rs.getString("order_date"),
                    rs.getInt("quantity_ordered"),
                    rs.getFloat("unit_price"),
                    rs.getFloat("total_price"),
                    rs.getString("order_status"),
                    rs.getString("expected_delivery_date"),
                    rs.getString("payment_status"),
                    rs.getString("notes"),
                    rs.getString("received_date"),
                    rs.getString("invoice_number"),
                    rs.getInt("supplier_id")
                );
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return orders;
    }

    // getAllOrders
    public static List<StockOrderModel> getAllStockOrders() {
        List<StockOrderModel> orders = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBconnection.getConnection();
            String sql = "SELECT * FROM stock_orders";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                StockOrderModel order = new StockOrderModel(
                    rs.getInt("order_id"),
                    rs.getString("order_date"),
                    rs.getInt("quantity_ordered"),
                    rs.getFloat("unit_price"),
                    rs.getFloat("total_price"),
                    rs.getString("order_status"),
                    rs.getString("expected_delivery_date"),
                    rs.getString("payment_status"),
                    rs.getString("notes"),
                    rs.getString("received_date"),
                    rs.getString("invoice_number"),
                    rs.getInt("supplier_id")
                );
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return orders;
    }
    
    
    
    
    
 // Update stock order
    public static boolean UpdateStockOrder(int order_id, String order_date, int quantity_ordered, float unit_price, float total_price,
                                           String order_status, String expected_delivery_date, String payment_status, String notes,
                                           String received_date, String invoice_number, int supplier_id) {
        
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBconnection.getConnection();
            String sql = "UPDATE stock_orders SET order_date=?, quantity_ordered=?, unit_price=?, total_price=?, " +
                         "order_status=?, expected_delivery_date=?, payment_status=?, notes=?, received_date=?, " +
                         "invoice_number=?, supplier_id=? WHERE order_id=?";
            
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, order_date);
            pstmt.setInt(2, quantity_ordered);
            pstmt.setFloat(3, unit_price);
            pstmt.setFloat(4, total_price);
            pstmt.setString(5, order_status);
            pstmt.setString(6, expected_delivery_date);
            pstmt.setString(7, payment_status);
            pstmt.setString(8, notes);
            pstmt.setString(9, received_date);
            pstmt.setString(10, invoice_number);
            pstmt.setInt(11, supplier_id);
            pstmt.setInt(12, order_id); // WHERE condition

            isSuccess = pstmt.executeUpdate() > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }
    
    
    //Delete Stock Order
    public static boolean DeleteStockOrder(int order_id) {
    	boolean isSuccess = false;
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	
		try {
			con = DBconnection.getConnection();
			String sql = "DELETE FROM stock_orders WHERE order_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order_id);

			isSuccess = pstmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    }

    	
    	
}

