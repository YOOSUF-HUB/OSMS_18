package orderPackage;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public interface IOrderController {
	
	//ADD ORDER
	boolean addOrder (int item_id, int quantity, Date orderDate, int cusId, float total_price);
	
	//GET ORDER BY ID
	List<OrderModel> getOrderById(int orderId);
	
	//GET ALL ORDERS DETAILS
	List<OrderModel> getAllOrders();
	
	//UPDATE ORDER DEATILS
	boolean updateOrder(int orderId, int qty, float totalPrice);
	
	//DELETE ORDER
	boolean deleteOrder(int id);
	
	//UPDATE ORDER STATUS
	boolean updateOrderStatus(int orderid, String ostatus, int qty) throws SQLException;

	
}
