package onlineStockManagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

// Implements stock-related DB operations
public class stockControl implements IStockControl {
	private static boolean isSuccess;

	// Insert a new stock item
	@Override
	public boolean insertData(String item_name, String item_model, String item_manufacturer, int quantity,
	                                 float unit_cost, float selling_price, String date_added, String description) {
		isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBconnection.getInstance().getConnection(); // DB connection
			String sql = "INSERT INTO Stock_Items VALUES(0,?,?,?,?,?,?,?,?)"; // SQL insert query
			pstmt = con.prepareStatement(sql);

			// Set values for placeholders
			pstmt.setString(1, item_name);
			pstmt.setString(2, item_model);
			pstmt.setString(3, item_manufacturer);
			pstmt.setInt(4, quantity);
			pstmt.setFloat(5, unit_cost);
			pstmt.setFloat(6, selling_price);
			pstmt.setString(7, date_added);
			pstmt.setString(8, description);

			isSuccess = pstmt.executeUpdate() > 0; // Check if insert is successful
		} catch (Exception e) {
			e.printStackTrace(); // Print errors if any
		} finally {
			try {
				if (pstmt != null) pstmt.close(); // Close statement
				if (con != null) con.close();     // Close connection
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}

	// Get stock item by ID
	@Override
	public List<stockModel> getById(int ID) {
		ArrayList<stockModel> stock = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBconnection.getInstance().getConnection();
			String sql = "SELECT * FROM Stock_Items WHERE item_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();

			// Loop through result and add to list
			while (rs.next()) {
				stockModel stck = new stockModel(
						rs.getInt("item_id"),
						rs.getString("item_name"),
						rs.getString("item_model"),
						rs.getString("item_manufacturer"),
						rs.getInt("quantity"),
						rs.getFloat("unit_cost"),
						rs.getFloat("selling_price"),
						rs.getString("date_added"),
						rs.getString("description")
				);
				stock.add(stck);
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
		return stock;
	}

	// Get all stock items
	@Override
	public List<stockModel> getAllStock() {
		ArrayList<stockModel> stock = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBconnection.getInstance().getConnection();
			String sql = "SELECT * FROM Stock_Items";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// Add each item to the list
			while (rs.next()) {
				stockModel stck = new stockModel(
						rs.getInt("item_id"),
						rs.getString("item_name"),
						rs.getString("item_model"),
						rs.getString("item_manufacturer"),
						rs.getInt("quantity"),
						rs.getFloat("unit_cost"),
						rs.getFloat("selling_price"),
						rs.getString("date_added"),
						rs.getString("description")
				);
				stock.add(stck);
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
		return stock;
	}

	// Update a stock item
	@Override
	public boolean UpdateStock(int item_id, String item_name, String item_model, String item_manufacturer,
	                                  int quantity, float unit_cost, float selling_price, String date_added, String description) {
		isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBconnection.getInstance().getConnection();
			String sql = "UPDATE Stock_Items SET item_name=?, item_model=?, item_manufacturer=?, quantity=?, unit_cost=?, selling_price=?, date_added=?, description=? WHERE item_id=?";
			pstmt = con.prepareStatement(sql);

			// Set updated values
			pstmt.setString(1, item_name);
			pstmt.setString(2, item_model);
			pstmt.setString(3, item_manufacturer);
			pstmt.setInt(4, quantity);
			pstmt.setFloat(5, unit_cost);
			pstmt.setFloat(6, selling_price);
			pstmt.setString(7, date_added);
			pstmt.setString(8, description);
			pstmt.setInt(9, item_id);

			isSuccess = pstmt.executeUpdate() > 0; // Check if update is successful
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

	// Delete stock item
	@Override
	public boolean DeleteStock(int item_id) {
		isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBconnection.getInstance().getConnection();
			String sql = "DELETE FROM Stock_Items WHERE item_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, item_id);

			isSuccess = pstmt.executeUpdate() > 0; // Check if delete is successful
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
