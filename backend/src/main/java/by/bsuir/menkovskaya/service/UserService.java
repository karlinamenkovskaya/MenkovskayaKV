package by.bsuir.menkovskaya.service;
import by.bsuir.menkovskaya.entity.User;
import by.bsuir.menkovskaya.entity.User_role;
import java.util.List;


public interface UserService {
    User_role create(User user, User_role userRoles);

    User_role addRole(User_role userRoles);

    public User_role deleteRole(int user_role_id) throws Exception;

    public void  deleteUserById(int id);

    public User delete(long id) throws Exception;

    public List<User> findAll();

    public List<User_role> findAllRoles();

    public User update(User user) throws Exception;
    public User_role update_role(User_role user_user);

    public User findById(long id);

    public int getIdByName(String name);

    public User_role findUserById(long id);

    void deleteUserByUsernam(String username);
}