package by.bsuir.menkovskaya.service;

import by.bsuir.menkovskaya.dto.CurrencyDto;
import by.bsuir.menkovskaya.entity.Subscription;
import by.bsuir.menkovskaya.repository.SubscriptionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

import static java.util.Arrays.asList;

@Service
public class SubscriptionServiceImpl implements SubscriptionService {
    @Resource
    private SubscriptionRepository subscriptionRepository;
    @Autowired
    private RestTemplate restTemplate;

    @Override
    public Subscription create(Subscription subscription) {
        return subscriptionRepository.save(subscription);
    }

    @Override
    public void deleteSubscriptionById(int id) {
        subscriptionRepository.delete(id);
    }

    @Override
    public Subscription delete(int idSubscription) throws Exception {
        if (subscriptionRepository.exists(idSubscription)) {
            Subscription deleted = subscriptionRepository.findOne(idSubscription);
            subscriptionRepository.delete(idSubscription);
            return deleted;
        } else {
            throw new Exception("Not found");
        }
    }

    @Override
    public List<Subscription> findAll() {
        return subscriptionRepository.findAll();
    }

    @Override
    public List<Subscription> findAll(CurrencyType currencyType) {
        if (currencyType.equals(CurrencyType.BYN)) {
            return findAll();
        }
        CurrencyDto currency = getCurrency(currencyType);
        double rate = currency.getRate() / currency.getScale();

        return findAll().stream()
                .peek(subscription -> subscription.setValue(subscription.getValue() / rate))
                .collect(Collectors.toList());
    }

    @Override
    public Subscription update(Subscription subscription) {
        if (subscriptionRepository.exists(subscription.getidSubscription())) {
            Subscription updated = subscriptionRepository.findOne(subscription.getidSubscription());
            updated.setDescription(subscription.getDescription());
            updated.setValue(subscription.getValue());
            updated.setIdGym(subscription.getIdGym());
            updated.setDay1(subscription.getDay1());
            updated.setDay2(subscription.getDay2());
            updated.setMonth(subscription.getMonth());
            subscriptionRepository.save(updated);
            return updated;
        }
        return null;
    }

    @Override
    public Subscription findById(int idSubscription) {
        return subscriptionRepository.findOne(idSubscription);
    }

    @Override
    public List<Subscription> findSubscriptionByIdClient(int id) {
        return subscriptionRepository.findSubscriptionByIdClient(id);
    }

    @Override
    public Subscription findSubscriptionByIdClient1(int id) {
        return subscriptionRepository.findSubscriptionByIdClient1(id);
    }

    private CurrencyDto getCurrency(CurrencyType currencyType) {
        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl("http://www.nbrb.by/api/exrates/rates")
                .queryParam("periodicity", 0);
        ResponseEntity<CurrencyDto[]> response = restTemplate.getForEntity(builder.build().toUri(), CurrencyDto[].class);
        return asList(response.getBody()).stream()
                .filter(o -> o.getAbbreviation().equals(currencyType.toString()))
                .findFirst().get();
    }
}
