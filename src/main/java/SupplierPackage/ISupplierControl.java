package SupplierPackage;

import java.util.List;

public interface ISupplierControl {
	boolean insertSupplierData(int supplier_id, String supplier_name, String phone_number, String email,
            String supplier_address, String supplier_city, String supplier_country,
            String supplier_website, String s_date_added);
	
	List<SupplierModel> getById(int ID);
	List<SupplierModel> getAllSupplier();
	boolean UpdateSupplier(int supplier_id, String supplier_name, String phone_number, String email,
            String supplier_address, String supplier_city, String supplier_country,
            String supplier_website, String s_date_added);
	boolean DeleteSupplier(int supplier_id);
}
