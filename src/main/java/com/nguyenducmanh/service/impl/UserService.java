package com.nguyenducmanh.service.impl;

import com.nguyenducmanh.entity.User;
import com.nguyenducmanh.repository.UserRepository;
import com.nguyenducmanh.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService implements IUserService {
    @Autowired
    private UserRepository userRepository;


    @Override
    public User findUserByUserName(String userName) {
        return userRepository.findUserByUserName(userName);
    }
}
