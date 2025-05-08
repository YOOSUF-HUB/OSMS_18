package SupplierPackage;

public class SupplierModel {
	

	private int supplier_id;
	private String supplier_name;
	private String phone_number;
	private String email;
	private String supplier_address;
	private String supplier_city;
	private String supplier_country;
	private String supplier_website;
	private String s_date_added;
	
	
	
	
	
	public SupplierModel(int supplier_id, String supplier_name, String phone_number, String email,
			String supplier_address, String supplier_city, String supplier_country, String supplier_website,
			String s_date_added) {
		super();
		this.supplier_id = supplier_id;
		this.supplier_name = supplier_name;
		this.phone_number = phone_number;
		this.email = email;
		this.supplier_address = supplier_address;
		this.supplier_city = supplier_city;
		this.supplier_country = supplier_country;
		this.supplier_website = supplier_website;
		this.s_date_added = s_date_added;
	}





	public int getSupplier_id() {
		return supplier_id;
	}





	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}





	public String getSupplier_name() {
		return supplier_name;
	}





	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}





	public String getPhone_number() {
		return phone_number;
	}





	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}





	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}





	public String getSupplier_address() {
		return supplier_address;
	}





	public void setSupplier_address(String supplier_address) {
		this.supplier_address = supplier_address;
	}





	public String getSupplier_city() {
		return supplier_city;
	}





	public void setSupplier_city(String supplier_city) {
		this.supplier_city = supplier_city;
	}





	public String getSupplier_country() {
		return supplier_country;
	}





	public void setSupplier_country(String supplier_country) {
		this.supplier_country = supplier_country;
	}





	public String getSupplier_website() {
		return supplier_website;
	}





	public void setSupplier_website(String supplier_website) {
		this.supplier_website = supplier_website;
	}





	public String getS_date_added() {
		return s_date_added;
	}





	public void setS_date_added(String s_date_added) {
		this.s_date_added = s_date_added;
	}
	
	
	
	
	
}


