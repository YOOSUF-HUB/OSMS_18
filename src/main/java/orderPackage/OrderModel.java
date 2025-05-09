package orderPackage;

public class OrderModel {
	
	
	private int orderId;
	private int item_id;
	private int quantity;
	private int id;
	
	
	public OrderModel(int orderId, int item_id, int quantity, int id) {
		super();
		this.orderId = orderId;
		this.item_id = item_id;
		this.quantity = quantity;
		this.id = id;
	}
	
	
	
	public int getOrderId() {
		return orderId;
	}
	public int getItem_id() {
		return item_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public int getId() {
		return id;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
	

}