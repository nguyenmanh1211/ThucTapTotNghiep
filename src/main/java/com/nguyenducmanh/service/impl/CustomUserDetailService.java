package com.nguyenducmanh.service.impl;

import com.nguyenducmanh.entity.Role;
import com.nguyenducmanh.entity.User;
import com.nguyenducmanh.model.request.RoleRequest;
import com.nguyenducmanh.security.CustomUserDetail;
import com.nguyenducmanh.service.IUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Service
public class CustomUserDetailService implements UserDetailsService {

    private IUserService userService;

    @Autowired
    public CustomUserDetailService(IUserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userService.findUserByUserName(s);
        if (Objects.isNull(user)){
            throw new UsernameNotFoundException("Didn't found user by username " + s);
        }
        Set<GrantedAuthority> authoritySet = new HashSet<>();

        for (Role role: user.getRoles()) {
            authoritySet.add(new SimpleGrantedAuthority(role.getName()));
        }
        UserDetails userDetails = new CustomUserDetail(s,user.getPassword(),authoritySet);
        BeanUtils.copyProperties(user,userDetails);
        return userDetails;
    }
}
