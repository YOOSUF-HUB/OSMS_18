package onlineStockManagement;

public class stockModel {

	private int item_id;
	private String item_name;
	private String item_model;
	private String item_manufacturer;
	private int quantity;
	private float unit_cost;
	private float selling_price;
	private String date_added;
	private String description;

	
	
	public stockModel(int item_id, String item_name, String item_model, String item_manufacturer,int quantity, float unit_cost,
			float selling_price, String date_added, String description) {
		super();
		this.item_id = item_id;
		this.item_name = item_name;
		this.item_model = item_model;
		this.item_manufacturer = item_manufacturer;
		this.quantity = quantity;
		this.unit_cost = unit_cost;
		this.selling_price = selling_price;
		this.date_added = date_added;
		this.description = description;
	}



	public String getItem_manufacturer() {
		return item_manufacturer;
	}



	public void setItem_manufacturer(String item_manufacturer) {
		this.item_manufacturer = item_manufacturer;
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


	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public float getUnit_cost() {
		return unit_cost;
	}



	public void setUnit_cost(float unit_cost) {
		this.unit_cost = unit_cost;
	}



	public float getSelling_price() {
		return selling_price;
	}



	public void setSelling_price(float selling_price) {
		this.selling_price = selling_price;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}




	
	
	
}
