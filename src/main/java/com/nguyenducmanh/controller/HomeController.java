package com.nguyenducmanh.controller;

import com.nguyenducmanh.entity.Contact;
import com.nguyenducmanh.service.IContactService;
import com.nguyenducmanh.service.IDatabaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
public class HomeController {

    @Autowired
    private IDatabaseService databaseService;
    @Autowired
    private IContactService contactService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView home() {
        return new ModelAndView("home");
    }
    

    @GetMapping("/login")
    public ModelAndView login(){
        return new ModelAndView("login");
    }


    @GetMapping("/contact")
    public ModelAndView contact(){
        ModelAndView mav=new ModelAndView("contact");
        Contact contact = contactService.findOne();
        mav.addObject("contact",contact);
        return mav;
    }

    @GetMapping("/feedback")
    public ModelAndView feedback(){
        return new ModelAndView("feedback");
    }

}
