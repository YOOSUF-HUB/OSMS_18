package SupplierPackage;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import onlineStockManagement.DBconnection;

public class SupplierControl implements ISupplierControl {

    // Insert Data function
    public boolean insertSupplierData(int supplier_id, String supplier_name, String phone_number, String email,
                                             String supplier_address, String supplier_city, String supplier_country,
                                             String supplier_website, String s_date_added) {

        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
        	con = DBconnection.getInstance().getConnection();
            String sql = "INSERT INTO supplier VALUES (0, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, supplier_name);
            pstmt.setString(2, phone_number);
            pstmt.setString(3, email);
            pstmt.setString(4, supplier_address);
            pstmt.setString(5, supplier_city);
            pstmt.setString(6, supplier_country);
            pstmt.setString(7, supplier_website);
            pstmt.setString(8, s_date_added);

            int result = pstmt.executeUpdate();
            isSuccess = result > 0;
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

    // Get by ID
    public List<SupplierModel> getById(int ID) {
        List<SupplierModel> supplierList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
        	con = DBconnection.getInstance().getConnection();
            String sql = "SELECT * FROM supplier WHERE supplier_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, ID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                SupplierModel supplier = new SupplierModel(
                        rs.getInt("supplier_id"),
                        rs.getString("supplier_name"),
                        rs.getString("phone_number"),
                        rs.getString("email"),
                        rs.getString("supplier_address"),
                        rs.getString("supplier_city"),
                        rs.getString("supplier_country"),
                        rs.getString("supplier_website"),
                        rs.getString("s_date_added")
                );
                supplierList.add(supplier);
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
        return supplierList;
    }

    // Get All Suppliers
    public List<SupplierModel> getAllSupplier() {
        List<SupplierModel> supplierList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
        	con = DBconnection.getInstance().getConnection();
            String sql = "SELECT * FROM supplier";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                SupplierModel supplier = new SupplierModel(
                        rs.getInt("supplier_id"),
                        rs.getString("supplier_name"),
                        rs.getString("phone_number"),
                        rs.getString("email"),
                        rs.getString("supplier_address"),
                        rs.getString("supplier_city"),
                        rs.getString("supplier_country"),
                        rs.getString("supplier_website"),
                        rs.getString("s_date_added")
                );
                supplierList.add(supplier);
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
        return supplierList;
    }
    
    


    // Update Supplier
    public boolean UpdateSupplier(int supplier_id, String supplier_name, String phone_number, String email,
                                         String supplier_address, String supplier_city, String supplier_country,
                                         String supplier_website, String s_date_added) {

        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
        	con = DBconnection.getInstance().getConnection();
            String sql = "UPDATE supplier SET supplier_name = ?, phone_number = ?, email = ?, supplier_address = ?, supplier_city = ?, supplier_country = ?, supplier_website = ?, s_date_added = ? WHERE supplier_id = ?";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, supplier_name);
            pstmt.setString(2, phone_number);
            pstmt.setString(3, email);
            pstmt.setString(4, supplier_address);
            pstmt.setString(5, supplier_city);
            pstmt.setString(6, supplier_country);
            pstmt.setString(7, supplier_website);
            pstmt.setString(8, s_date_added);
            pstmt.setInt(9, supplier_id);

            int result = pstmt.executeUpdate();
            isSuccess = result > 0;

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
    
    
    
	// DeleteStock
	public boolean DeleteSupplier(int supplier_id) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBconnection.getInstance().getConnection();
			String sql = "DELETE FROM supplier WHERE supplier_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, supplier_id);

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
