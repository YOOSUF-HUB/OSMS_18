package customerPackage;

public class CustomerModel {
	
	private int id;
	private String cname;
	private String bname;
	private String email;
	private String number;
	private String address;
	private String city;
	private String country;
	private String zip;
	
	
	public CustomerModel(int id, String cname, String bname, String email, String number, String address, String city,
			String country, String zip) {
		super();
		this.id = id;
		this.cname = cname;
		this.bname = bname;
		this.email = email;
		this.number = number;
		this.address = address;
		this.city = city;
		this.country = country;
		this.zip = zip;
	}


	public int getId() {
		return id;
	}


	public String getCname() {
		return cname;
	}


	public String getBname() {
		return bname;
	}


	public String getEmail() {
		return email;
	}


	public String getNumber() {
		return number;
	}


	public String getAddress() {
		return address;
	}


	public String getCity() {
		return city;
	}


	public String getCountry() {
		return country;
	}


	public String getZip() {
		return zip;
	}


	public void setId(int id) {
		this.id = id;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public void setBname(String bname) {
		this.bname = bname;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setNumber(String number) {
		this.number = number;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public void setZip(String zip) {
		this.zip = zip;
	}
	
	
	
	
	
	
	
}
