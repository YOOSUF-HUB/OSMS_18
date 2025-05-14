package StockOrderManagement;

public class StockOrderModel {

	private int	order_id;
	private String order_date;
	private int quantity_ordered;
	private float unit_price;
	private float total_price;
	private String order_status;
	private String expected_delivery_date;
	private String payment_status;
	private String notes;
	private String received_date;
	private String invoice_number;
	private int supplier_id;

	public StockOrderModel(int order_id, String order_date, int quantity_ordered,
			float unit_price, float total_price, String order_status, String expected_delivery_date,
			String payment_status, String notes, String received_date,String invoice_number, int supplier_id) {
		this.order_id = order_id;
		this.order_date = order_date;
		this.quantity_ordered = quantity_ordered;
		this.unit_price = unit_price;
		this.total_price = total_price;
		this.order_status = order_status;
		this.expected_delivery_date = expected_delivery_date;
		this.payment_status = payment_status;
		this.notes = notes;
		this.received_date = received_date;
		this.invoice_number = invoice_number;
		this.supplier_id = supplier_id;
	}

	// Getters and setters
	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}


	public int getQuantity_ordered() {
		return quantity_ordered;
	}

	public void setQuantity_ordered(int quantity_ordered) {
		this.quantity_ordered = quantity_ordered;
	}

	public double getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(float unit_price) {
		this.unit_price = unit_price;
	}

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(float total_price) {
		this.total_price = total_price;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getExpected_delivery_date() {
		return expected_delivery_date;
	}

	public void setExpected_delivery_date(String expected_delivery_date) {
		this.expected_delivery_date = expected_delivery_date;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getReceived_date() {
		return received_date;
	}

	public void setReceived_date(String received_date) {
		this.received_date = received_date;
	}


	public String getInvoice_number() {
		return invoice_number;
	}

	public void setInvoice_number(String invoice_number) {
		this.invoice_number = invoice_number;
	}

	public int getSupplier_id() {
		return supplier_id;
	}

	public void setSupplier_id(Integer supplier_id) {
		this.supplier_id = supplier_id;
	}
}
