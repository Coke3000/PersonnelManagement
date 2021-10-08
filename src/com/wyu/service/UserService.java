package com.wyu.service;

import com.wyu.domain.User;

import java.util.List;

public interface UserService {
    List<User> findUser();

    int getTotal();

    int updateUserById(User user);

    int deleteUserById(String id);

    List<User> searchUser(User user);

    int insertUser(User user);
}
