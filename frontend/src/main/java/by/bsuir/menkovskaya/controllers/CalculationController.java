package by.bsuir.menkovskaya.controllers;


import by.bsuir.menkovskaya.entity.Calculation;
import by.bsuir.menkovskaya.entity.Subscription;
import by.bsuir.menkovskaya.service.CalculationService;
import by.bsuir.menkovskaya.service.GymService;
import by.bsuir.menkovskaya.service.SubscriptionService;
import by.bsuir.menkovskaya.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/calculation")
public class CalculationController {
    @Autowired
    UserService userService;
    @Autowired
    CalculationService calculationService;
    @Autowired
    SubscriptionService subscriptionService;
    @Autowired
    GymService gymService;

    @RequestMapping(value = "/addCalculation/{idSubscription}", method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAnyAuthority( 'ROLE_CLIENT')")
    private Calculation addCalculation(@PathVariable(value = "idSubscription") int idSubscription
    ) {
        //todo validation
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String uname = auth.getName();
        int id = userService.getIdByName(uname);
        List<Calculation> list = calculationService.findByIdClient(id);
        Calculation calculation = new Calculation();
        for (Calculation item : list) {
            if (item.getIdSubscription() == idSubscription) return null;
        }
        calculation.setIdClient(id);
        calculation.setIdSubscription(idSubscription);
        return calculationService.create(calculation);
    }

    @RequestMapping(value = "/deleteCalculation1/{idClient}/{idSubscription}")
    private String deleteCalculation1(@PathVariable(value = "idClient") int idClient,
                                      @PathVariable(value = "idSubscription") int idSubscription
    ) {
        calculationService.findCalculationByIdClientAndIdSubscription(idClient,idSubscription);


        return "redirect:/client";
    }


}
