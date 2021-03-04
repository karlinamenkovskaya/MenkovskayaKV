package by.bsuir.menkovskaya.repository;

import by.bsuir.menkovskaya.entity.User_role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface User_RoleRepository extends JpaRepository<User_role, Integer>{
    @Query("select b from User_role b where b.username = :username")
    User_role findByUsername(@Param("username") String name);
   /* @Query("select b from User_role b where b.user_role_id = :id")
    User_role findUsernameById(@Param("id") int id);*/
}
