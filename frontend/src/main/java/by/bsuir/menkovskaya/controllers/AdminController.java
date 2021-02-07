package by.bsuir.menkovskaya.controllers;


import by.bsuir.menkovskaya.entity.*;
import by.bsuir.menkovskaya.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    GymService gymService;
    @Autowired
    SubscriptionService subscriptionService;
    @Autowired
    CoachService coachService;
    @Autowired
    UserService userService;
    @Autowired
    ClientService clientService;
    @Autowired
    CalculationService calculationService;

    @RequestMapping(value = "/addGym", method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
    private String addGym(@RequestParam(value = "gym_name") String gym_name
    ) {
        Gym gym = new Gym();
        gym.setGym_name(gym_name);
        gymService.create(gym);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/deleteGym/{id}")
    private String deleteGym(@PathVariable(value = "id") int id
    ) {
        gymService.deleteGymById(id);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/deleteCoach/{id}")
    private String deleteCoach(@PathVariable(value = "id") int id
    ) {
        coachService.deleteCoachById(id);
        String username = userService.findUserById(id).getUsername();
        userService.deleteUserById(id);
        userService.deleteUserByUsernam(username);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/deleteSubscription/{id}")
    private String deleteSubscription(@PathVariable(value = "id") int id
    ) {
        subscriptionService.deleteSubscriptionById(id);
        return "redirect:/admin";
    }


    @RequestMapping(value = "/deleteUserRole/{id}")
    private String deleteRole(@PathVariable(value = "id") int id
    ) throws Exception {
        userService.deleteRole(id);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/deleteClient/{id}")
    private String deleteClient(@PathVariable(value = "id") int id
    ) {
        calculationService.deleteCalculationByIdClient(id);
        clientService.deleteClientById(id);
        String username = userService.findUserById(id).getUsername();
        userService.deleteUserById(id);
        userService.deleteUserByUsernam(username);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/addSubscription", method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAnyAuthority( 'ROLE_ADMIN')")
    private Subscription addSubscription(@RequestParam(value = "description") String description,
                                         @RequestParam(value = "value") int value,
                                         @RequestParam(value = "idGym") int idGym,
                                         @RequestParam(value = "Day1") String Day1,
                                         @RequestParam(value = "Day2") String Day2,
                                         @RequestParam(value = "Month") String Month
    ) {
        Subscription subscription = new Subscription();
        subscription.setDescription(description);
        subscription.setValue(value);
        subscription.setIdGym(idGym);
        subscription.setDay1(Day1);
        subscription.setDay2(Day2);
        subscription.setMonth(Month);
        return subscriptionService.create(subscription);
    }

    @RequestMapping(value = "/editSubscription", method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAnyAuthority( 'ROLE_ADMIN')")
    private Subscription editSubscription(@RequestParam(value = "description") String description,
                                          @RequestParam(value = "value") int value,
                                          @RequestParam(value = "subId") int subId,
                                          @RequestParam(value = "idGym") int idGym,
                                          @RequestParam(value = "Day1") String Day1,
                                          @RequestParam(value = "Day2") String Day2,
                                          @RequestParam(value = "Month") String Month
    ) {
        Subscription subscription = new Subscription();
        subscription.setDescription(description);
        subscription.setValue(value);
        subscription.setIdGym(idGym);
        subscription.setDay1(Day1);
        subscription.setDay2(Day2);
        subscription.setMonth(Month);
        subscription.setidSubscription(subId);
        return subscriptionService.update(subscription);
    }

    @RequestMapping(value = "/editGym", method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAnyAuthority( 'ROLE_ADMIN')")
    private String editGym(@RequestParam(value = "gym_name") String gym_name,
                                          @RequestParam(value = "gymId") int gymId
    ) {
         Gym gym = new Gym();
        gym.setGym_name(gym_name);
        gym.setIdGym(gymId);
        gymService.update(gym);
        return "redirect:/admin";
    }
    @RequestMapping(value = "/editRole", method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAnyAuthority( 'ROLE_ADMIN')")
    private User_role editRole(@RequestParam(value = "username") String username,
                                    @RequestParam(value = "roleId") int roleId,
                                    @RequestParam(value = "role") String role
    ) {
        User_role user_role = new User_role();
        user_role.setUser_role_id(roleId);
        user_role.setUsername(username);
       user_role.setRole(role);
        return userService.update_role(user_role);

    }

    @RequestMapping(value = "/addRole", method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAnyAuthority( 'ROLE_ADMIN')")
    private String addRole(@RequestParam(value = "username") String username,
                           @RequestParam(value = "role") String role
    ) {
        User_role user_role = new User_role();
        user_role.setUsername(username);
        user_role.setRole(role);
        userService.addRole(user_role);
        return "redirect:/admin";
    }


    @RequestMapping(value = "/addCoach", method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
    public Coach addCoach(@RequestParam(value = "username") String username,
                          @RequestParam(value = "password") String password,
                          @RequestParam(value = "last_name") String last_name,
                          @RequestParam(value = "first_name") String first_name,
                          @RequestParam(value = "salary") int salary) {
        User user = new User();
        user.setUsername(username);
        password = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
        user.setPassword(password);
        user.setEnabled(1);
        User_role userRoles = new User_role();
        userRoles.setUsername(username);
        userRoles.setRole("ROLE_COACH");
        int id = userService.create(user, userRoles).getUser_role_id();
        Coach coach = new Coach();
        coach.setIdCoach(id);
        coach.setFirst_name(first_name);
        coach.setLast_name(last_name);
        coach.setSalary(salary);
        return coachService.create(coach);
    }

}
