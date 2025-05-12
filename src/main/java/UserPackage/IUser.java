package UserPackage;

import java.util.List;

public interface IUser {

    boolean registerUser(String name, String email, String password, String phone, String role);
    List<UserModel> getAllUsers();
    UserModel getUserById(int id); 
    boolean deleteUser(int id);
    int getTotalUserCount();
    boolean updateUser(int id, String name, String email, String password, String phone, String role);
    UserModel authenticateUser(String email, String password);
}