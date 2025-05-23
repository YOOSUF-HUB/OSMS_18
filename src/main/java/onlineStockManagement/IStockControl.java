package onlineStockManagement;

import java.util.List;

public interface IStockControl {
	//interface class
	
	//insert
	boolean insertData(String item_name, String item_model, String item_manufacturer, int quantity, float unit_cost, float selling_price, String date_added, String description);
	//getById
	List<stockModel> getById(int ID);
	//getAllStock
	List<stockModel> getAllStock();
	//Update
	boolean UpdateStock(int item_id, String item_name, String item_model, String item_manufacturer, int quantity, float unit_cost, float selling_price, String date_added, String description);
	//Delete
	boolean DeleteStock(int item_id);
}
