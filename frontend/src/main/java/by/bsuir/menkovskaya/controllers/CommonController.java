/*
 This software is the confidential information and copyrighted work of
 NetCracker Technology Corp. ("NetCracker") and/or its suppliers and
 is only distributed under the terms of a separate license agreement
 with NetCracker.
 Use of the software is governed by the terms of the license agreement.
 Any use of this software not in accordance with the license agreement
 is expressly prohibited by law, and may result in severe civil
 and criminal penalties. 
 
 Copyright (c) 1995-2017 NetCracker Technology Corp.
 
 All Rights Reserved.
 
*/
/*
 * Copyright 1995-2017 by NetCracker Technology Corp.,
 * University Office Park III
 * 95 Sawyer Road
 * Waltham, MA 02453
 * United States of America
 * All rights reserved.
 */
package by.bsuir.menkovskaya.controllers;

import by.bsuir.menkovskaya.entity.Client;
import by.bsuir.menkovskaya.entity.Coach;
import by.bsuir.menkovskaya.entity.User;
import by.bsuir.menkovskaya.entity.User_role;
import by.bsuir.menkovskaya.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static by.bsuir.menkovskaya.service.CurrencyType.BYN;



@Controller
public class CommonController {

    @Autowired
    private UserService userService;
    @Autowired
    private ClientService clientService;
    @Autowired
    private CoachService coachService;
    @Autowired
    private SubscriptionService subscriptionService;
    @Autowired
    private GymService gymService;
    @Autowired
    CalculationService calculationService;


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            String role = auth.getAuthorities().toString();
            String targetUrl = "";
            if (role.contains("CLIENT")) {
                targetUrl = "/client";
            } else if (role.contains("ADMIN")) {
                targetUrl = "/admin";
            } else if (role.contains("COACH")) {
                targetUrl = "/coach";
            }
            return new ModelAndView("redirect:" + targetUrl);
        }

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Неверные логин и пароль. Проверьте введенные данные.");
        }
        if (logout != null) {
            model.addObject("msg", "Вы успешно вышли из своего аккаунта");
        }
        model.setViewName("loginnew");
        return model;
    }

    @RequestMapping(value = "/client", method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_CLIENT')")
    public ModelAndView pageClient(@RequestParam(value = "Currency", required = false) String curr) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        ModelAndView model = new ModelAndView();
        String name = auth.getName();
        int id = userService.getIdByName(name);
        Client client = clientService.findById(id);
        if (client != null) {
            model.addObject("name", client.getFirst_name() + " " + client.getLast_name());
            model.addObject("id", client.getIdClient());
            model.addObject("email", client.getEmail());
            if (curr == null) {
                model.addObject("subscription", subscriptionService.findAll());
                model.addObject("Currency", BYN);
            } else {
                model.addObject("subscription", subscriptionService.findAll(CurrencyType.valueOf(curr)));
                model.addObject("Currency", CurrencyType.valueOf(curr));
            }
            model.addObject("gyms", gymService.findAll());
            model.addObject("calculations", subscriptionService.findSubscriptionByIdClient(id));
        }
        model.setViewName("client");
            return model;
    }


    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView pageAdmin() {
        ModelAndView model = new ModelAndView();
        model.addObject("coach", coachService.findAll());
        model.addObject("clients", clientService.findAll());
        model.addObject("gyms", gymService.findAll());
        model.addObject("subscription", subscriptionService.findAll());
        model.addObject("users", userService.findAll());
        model.addObject("user_roles", userService.findAllRoles());
        model.setViewName("admin");
        return model;
    }

    @RequestMapping(value = "/coach", method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_COACH')")
    public ModelAndView pageHop() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        ModelAndView model = new ModelAndView();
        String name = auth.getName();
        int id = userService.getIdByName(name);
        Coach coach = coachService.findById(id);
        if (coach != null) {
            model.addObject("name", coach.getFirst_name() + " " + coach.getLast_name());
            model.addObject("id", coach.getIdCoach());
            model.addObject("clients", clientService.findAll());
            /*model.addObject("timetable", coachService.findSubscriptionByIdCoach(id));*/
            model.addObject("email", userService.findUserById(id).getUsername());
            model.addObject("gyms", gymService.findAll());
        }
        model.setViewName("coach");
        return model;
    }

    //for 403 access denied page
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {
        ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            model.addObject("username", userDetail.getUsername());
        }
        model.setViewName("403");
        return model;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String goTologinnewPage() {
        return "register";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView registerStudent(@RequestParam(value = "username") String username,
                                        @RequestParam(value = "password") String password) {
        User user = new User();
        user.setUsername(username);
        password = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
        user.setPassword(password);
        user.setEnabled(1);
        User_role userRoles = new User_role();
        userRoles.setUsername(username);
        userRoles.setRole("ROLE_CLIENT");
        int id = userService.create(user, userRoles).getUser_role_id();
        Client client = new Client();
        client.setIdClient(id);
        client.setFirst_name("");
        client.setLast_name("");
        client.setPhone_number(0);
        client.setEmail("");
        clientService.create(client);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("msg", "Вы были успешно зарегистрированы. Теперь вы можете войти с ипользованием указанного логина и пароля");
        modelAndView.setViewName("loginnew");
        return modelAndView;
    }


}
