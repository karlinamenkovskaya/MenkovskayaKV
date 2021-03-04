package by.bsuir.menkovskaya.repository;

import by.bsuir.menkovskaya.entity.Coach;
import by.bsuir.menkovskaya.entity.Subscription;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CoachRepository extends JpaRepository<Coach, Integer> {
    /*@Query("select b from Subscription b where b.idSubscription in (select c.IdSubscription from Calculation c where c.idClient in(select s from Client s where s.idCoach = :id))")
    List<Subscription> findSubscriptionByIdCoach(@Param("id") int id);*/
    @Query("select b from Subscription b where b.idSubscription in (select c.IdSubscription from Calculation c where c.idClient = :id)")
    List<Subscription> findSubscriptionByIdClient(@Param("id") int id);
}
