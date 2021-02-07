package by.bsuir.menkovskaya.controllers;

import by.bsuir.menkovskaya.entity.Client;

import by.bsuir.menkovskaya.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@Controller
@RequestMapping(value = "/clients")
public class ClientController {
    @Autowired
    private ClientService clientService;
    @RequestMapping(value = "/edit/{idClient}", method = RequestMethod.POST)
    @ResponseBody
    public Client editClient(@PathVariable String idClient,
                               @RequestParam(value = "first_name", required = false) String first_name,
                               @RequestParam(value = "last_name", required = false) String last_name,
                               @RequestParam(value = "phone_number", required = false) String phone_number,
                               @RequestParam(value = "email", required = false) String email

    ) {
        String msg = "";
        Client client = clientService.findById(Integer.parseInt(idClient));
        try {
            if (!Objects.equals(first_name, "") && first_name != null) client.setFirst_name(first_name);
            if (!Objects.equals(last_name, "") && last_name != null) client.setLast_name(last_name);
            if (!Objects.equals(phone_number, "") && phone_number != null) client.setPhone_number(Integer.parseInt(phone_number));
            if (!Objects.equals(email, "") && email != null) client.setEmail(email);
            clientService.update(client);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return client;
    }
    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Client getClient(@PathVariable int id) {
        return clientService.findById(id);
    }
}
