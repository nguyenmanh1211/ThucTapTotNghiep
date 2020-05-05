package com.nguyenducmanh.controller;

import com.nguyenducmanh.entity.User;
import com.nguyenducmanh.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    private IUserService userService;

    @Autowired
    public UserController(IUserService userService) {
        this.userService = userService;
    }

    @GetMapping("/user")
    public ResponseEntity<User> getUserByUserName(@RequestParam String userName){
        return ResponseEntity.ok(userService.findUserByUserName(userName));
    }
}
