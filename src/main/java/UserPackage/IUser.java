package UserPackage;

import java.util.List;



public interface IUser {
	
	public boolean registerUser(String name, String email, String password, String phone, String role);
	 public List<UserModel> getAllUsers();
	 public UserModel getReportById(int id);
	 public boolean deleteUser(int id);
	 public int getTotalUserCount();
	 public boolean updateUser(int id, String name, String email, String password, String phone, String role);
}
