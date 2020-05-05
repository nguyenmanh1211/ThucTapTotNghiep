package com.nguyenducmanh.service;

import com.nguyenducmanh.entity.User;

public interface IUserService {
    User findUserByUserName(String userName);

}
