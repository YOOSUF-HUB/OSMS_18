package customerPackage;

import java.util.List;

public interface ICustomerController {
	
	//add customer
	boolean addCustomer(String cname, String bname, String email, String number, String address, String city,
	        String country, String zip);
	
	//get customer by id
	List<CustomerModel> getCustomerById(int customerId);
	
	//get all customer
	List<CustomerModel> getAllCustomers();
	
	//update customer
	boolean updateCustomer(int id, String cname, String bname, String email, String number, String address, String city,
	        String country, String zip);
	
	//delete customer
	boolean deleteCustomer(int id);
	
}
