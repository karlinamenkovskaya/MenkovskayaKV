package by.bsuir.menkovskaya.service;


import by.bsuir.menkovskaya.entity.Subscription;

import java.util.List;

public interface SubscriptionService {
    Subscription create(Subscription subscription);

    void deleteSubscriptionById(int id);

    Subscription delete(int idSubscription) throws Exception;

    List<Subscription> findAll();

    List<Subscription> findAll(CurrencyType currencyType);

    Subscription update(Subscription subscription);

    Subscription findById(int idSubscription);

    List<Subscription> findSubscriptionByIdClient(int id);

    Subscription findSubscriptionByIdClient1(int id);
}
