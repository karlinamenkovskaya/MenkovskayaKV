package by.bsuir.menkovskaya.repository;

import by.bsuir.menkovskaya.entity.Calculation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CalculationRepository extends JpaRepository<Calculation, Integer> {

    List<Calculation> findByidClient(int idClient);
    /*Calculation findCalculationByIdClientAndIdSubscription(int idClient, int idSubscription);*/

    @Query("select b from Calculation b where b.IdSubscription = :IdSubscription and b.idClient = :idClient")
    Calculation findCalculationByIdClientAndIdSubscription(@Param("idClient") int idClient,
                                                           @Param("IdSubscription") int IdSubscription);
    @Transactional
    @Modifying
    @Query("delete from Calculation c where c.idClient = :idClient")
    void deleteCalculationByIdClient(@Param("idClient")int idClient);

}
