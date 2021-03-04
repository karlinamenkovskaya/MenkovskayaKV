package by.bsuir.menkovskaya.repository;

import by.bsuir.menkovskaya.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepository extends JpaRepository<User, Integer>{
    @Transactional
    @Modifying
    @Query("delete  from User c where c.username = :username")
    void deleteUserByUsername(@Param("username")String username);

}
