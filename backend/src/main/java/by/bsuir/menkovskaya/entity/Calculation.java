package by.bsuir.menkovskaya.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "calculation")
public class Calculation {
    @Id
    @GeneratedValue
    private int idCalculation;
    private int idClient;
    private int IdSubscription;

    public int getIdCalculation() {
        return idCalculation;
    }

    public void setIdCalculation(int idCalculation) {
        this.idCalculation = idCalculation;
    }

    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    public int getIdSubscription() {
        return IdSubscription;
    }

    public void setIdSubscription(int idSubscription) {
        IdSubscription = idSubscription;
    }


}
