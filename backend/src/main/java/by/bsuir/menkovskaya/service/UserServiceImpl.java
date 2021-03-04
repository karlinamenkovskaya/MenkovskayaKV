package by.bsuir.menkovskaya.service;

import java.util.List;

import javax.annotation.Resource;

import by.bsuir.menkovskaya.entity.Gym;
import by.bsuir.menkovskaya.repository.UserRepository;
import by.bsuir.menkovskaya.repository.User_RoleRepository;
import by.bsuir.menkovskaya.entity.User_role;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.bsuir.menkovskaya.entity.User;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserRepository userRepository;

    @Resource
    private User_RoleRepository userRolesRepository;


    @Override
    @Transactional
    public User_role create(User user, User_role userRoles) {

        userRepository.save(user);
        return userRolesRepository.save(userRoles);
    }

    @Override
    @Transactional
    public User_role addRole(User_role userRoles) {
        return userRolesRepository.save(userRoles);
    }

    @Override
    public void  deleteUserById(int id){

        userRolesRepository.delete(id);
    }

    @Override
    @Transactional
    public User delete(long id) throws Exception {
        User deletedUser = userRepository.findOne((int) id);

        if (deletedUser == null)
            throw new Exception("Not found");

        userRepository.delete(deletedUser);
        return deletedUser;
    }

    @Override
    @Transactional
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    @Transactional
    public List<User_role> findAllRoles() {
        return userRolesRepository.findAll();
    }

    @Override
    @Transactional
    public User update(User user) throws Exception {
        return null;
    }

    @Override
    @Transactional
    public User_role update_role(User_role user_role)  {
        if (userRolesRepository.exists(user_role.getUser_role_id())) {
            User_role updated = userRolesRepository.findOne(user_role.getUser_role_id());
            updated.setUsername(user_role.getUsername());
            updated.setRole(user_role.getRole());
            userRolesRepository.save(updated);
            return updated;
        }
        return null;
    }

    @Override
    @Transactional
    public User findById(long id) {
        return userRepository.findOne((int) id);
    }

    @Override
    @Transactional
    public User_role findUserById(long id) {
        return userRolesRepository.findOne((int) id);
    }
    @Override
    public int getIdByName(String name) {
        return userRolesRepository.findByUsername(name).getUser_role_id();
    }
    @Override
    public void deleteUserByUsernam(String username){
        userRepository.deleteUserByUsername(username);
    }

    @Override
    public User_role deleteRole(int user_role_id) throws Exception {
        if (userRolesRepository.exists(user_role_id)) {
            User_role deleted = userRolesRepository.findOne(user_role_id);
            userRolesRepository.delete(user_role_id);
            return deleted;
        } else {
            throw new Exception("Not found");
        }
    }
}