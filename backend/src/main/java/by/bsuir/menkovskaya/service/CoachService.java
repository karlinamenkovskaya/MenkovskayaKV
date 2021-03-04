package by.bsuir.menkovskaya.service;


import by.bsuir.menkovskaya.entity.Coach;
import by.bsuir.menkovskaya.entity.Subscription;

import java.util.List;

public interface CoachService {
    public Coach create(Coach coach);

    public void  deleteCoachById(int id);

    public Coach delete(int idCoach) throws Exception;

    public List<Coach> findAll();

    public Coach update(Coach coach) throws Exception;

    public Coach findById(int idCoach);

    /*List<Subscription> findSubscriptionByIdCoach( int id);*/
}
