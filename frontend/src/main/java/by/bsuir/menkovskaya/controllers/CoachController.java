package by.bsuir.menkovskaya.controllers;


import by.bsuir.menkovskaya.entity.Coach;
import by.bsuir.menkovskaya.service.CoachService;
import by.bsuir.menkovskaya.service.GymService;
import by.bsuir.menkovskaya.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@Controller
@RequestMapping(value = "/coachs")
public class CoachController {
    @Autowired
    CoachService coachService;
    @Autowired
    UserService userService;
    @Autowired
    GymService gymService;

    @RequestMapping(value = "/edit/{idCoach}", method = RequestMethod.POST)
    @ResponseBody
    public Coach editCoach(@PathVariable String idCoach,
                           @RequestParam(value = "first_name", required = false) String first_name,
                           @RequestParam(value = "last_name", required = false) String last_name

    ) {
        String msg = "";
        Coach coach = coachService.findById(Integer.parseInt(idCoach));
        try {
            if (!Objects.equals(first_name, "") && first_name != null) coach.setFirst_name(first_name);
            if (!Objects.equals(last_name, "") && last_name != null) coach.setLast_name(last_name);
            coachService.update(coach);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return coach;
    }

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Coach getClient(@PathVariable int id) {
        return coachService.findById(id);
    }



}
