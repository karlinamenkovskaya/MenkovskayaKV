package by.bsuir.menkovskaya.utils;


import by.bsuir.menkovskaya.entity.Gym;
import by.bsuir.menkovskaya.entity.Subscription;
import by.bsuir.menkovskaya.service.GymService;


import java.util.Arrays;

public class ColculationConverter {

    public String[] calculationToArray(Subscription subscription, GymService gymService) {
        String[] result = new String[6];
        result[0] = subscription.getDescription();
        result[1] = String.valueOf(subscription.getValue());
        Gym gym = gymService.findById(subscription.getIdGym());
        if (gym != null) result[2] = gym.getGym_name();
        else result[2] = "undefined";
        result[3] = subscription.getDay1();
        result[4] = subscription.getDay2();
        result[5] = subscription.getMonth();
        return result;
    }

    public String[] culculationToStringArrayAdvanced(Subscription subscription, GymService gymService) {
        String[] result;
        result = Arrays.copyOf(calculationToArray(subscription, gymService), 7);
        result[6] = "<button type=\"button\" class=\"btn btn-default\" onclick=\"deleteCalculation(" + subscription.getidSubscription() + ")\">\n" +
                "                                                            Отписаться\n" +
                "                                                        </button>";
        return result;
    }

}
