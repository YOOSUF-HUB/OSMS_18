package StockOrderManagement;

import java.util.List;

public interface IStockOrderControl {
	
	boolean insertStockOrder(
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
	        int supplier_id);

	List<StockOrderModel> getOrderById(int orderId);
	List<StockOrderModel> getAllStockOrders();
	boolean UpdateStockOrder(int order_id, String order_date, int quantity_ordered, float unit_price, float total_price,
            String order_status, String expected_delivery_date, String payment_status, String notes,
            String received_date, String invoice_number, int supplier_id);
	boolean DeleteStockOrder(int order_id);
}
