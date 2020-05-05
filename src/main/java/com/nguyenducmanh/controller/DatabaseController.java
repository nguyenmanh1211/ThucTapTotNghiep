package com.nguyenducmanh.controller;

import com.nguyenducmanh.model.request.DatabaseRequest;
import com.nguyenducmanh.service.IDatabaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/api",produces = "text/plain;charset=UTF-8")
public class DatabaseController {
    private IDatabaseService databaseService;

    @Autowired
    public DatabaseController(IDatabaseService databaseService) {
        this.databaseService = databaseService;
    }

    @RequestMapping(value = "/insert",method = RequestMethod.GET,produces = "text/plain;charset=UTF-8")
    public String insertDatabase(@ModelAttribute(value = "database") DatabaseRequest databaseRequest){
        databaseService.insert(databaseRequest);
        return "redirect:/admin/database";
    }
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable long id){
        databaseService.delete(id);
        return "redirect:/admin/database";
    }
    @RequestMapping(value = "/update",produces = "text/plain;charset=UTF-8")
    public String update(@ModelAttribute(value = "database") DatabaseRequest databaseRequest){
        databaseService.update(databaseRequest,databaseRequest.getId());
        return "redirect:/admin/database";
    }

}
