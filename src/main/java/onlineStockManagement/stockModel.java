package onlineStockManagement;

public class stockModel {

	private int item_id;
	private String item_name;
	private String item_model;
	private String item_manufacturer;
	private int supplier_id;
	private int quantity;
	private int unit_cost;
	private int selling_price;
	private String date_added;
	private String comments;

	
	
	public stockModel(int item_id, String item_name, String item_model, String item_manufacturer,int supplier_id, int quantity, int unit_cost,
			int selling_price, String date_added, String comments) {
		super();
		this.item_id = item_id;
		this.item_name = item_name;
		this.item_model = item_model;
		this.item_manufacturer = item_manufacturer;
		this.supplier_id = supplier_id;
		this.quantity = quantity;
		this.unit_cost = unit_cost;
		this.selling_price = selling_price;
		this.date_added = date_added;
		this.comments = comments;
	}



	public String getItem_manufacturer() {
		return item_manufacturer;
	}



	public void setItem_manufacturer(String item_manufacturer) {
		this.item_manufacturer = item_manufacturer;
	}



	public String getComments() {
		return comments;
	}



	public void setComments(String comments) {
		this.comments = comments;
	}



	public String getDate_added() {
		return date_added;
	}



	public void setDate_added(String date_added) {
		this.date_added = date_added;
	}



	public int getItem_id() {
		return item_id;
	}



	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}



	public String getItem_name() {
		return item_name;
	}



	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}



	public String getItem_model() {
		return item_model;
	}



	public void setItem_model(String item_model) {
		this.item_model = item_model;
	}



	public int getSupplier_id() {
		return supplier_id;
	}



	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public int getUnit_cost() {
		return unit_cost;
	}



	public void setUnit_cost(int unit_cost) {
		this.unit_cost = unit_cost;
	}



	public int getSelling_price() {
		return selling_price;
	}



	public void setSelling_price(int selling_price) {
		this.selling_price = selling_price;
	}
	
	
	
}
