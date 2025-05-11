package orderPackage;


public class OrderModel {
	
	int orderid;
	String itemname;
	String qty;
	String odate;
	String bname;
	String city;
	
	
	public OrderModel(int orderid, String itemname, String qty, String odate, String bname, String city) {
		
		this.orderid = orderid;
		this.itemname = itemname;
		this.qty = qty;
		this.odate = odate;
		this.bname = bname;
		this.city = city;
	}


	public int getOrderid() {
		return orderid;
	}


	public String getItemname() {
		return itemname;
	}


	public String getQty() {
		return qty;
	}


	public String getOdate() {
		return odate;
	}


	public String getBname() {
		return bname;
	}


	public String getCity() {
		return city;
	}


	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}


	public void setItemname(String itemname) {
		this.itemname = itemname;
	}


	public void setQty(String qty) {
		this.qty = qty;
	}


	public void setOdate(String odate) {
		this.odate = odate;
	}


	public void setBname(String bname) {
		this.bname = bname;
	}


	public void setCity(String city) {
		this.city = city;
	}
	
	
	
	
	
	
}