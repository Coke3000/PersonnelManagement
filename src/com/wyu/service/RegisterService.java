package com.wyu.service;

import com.wyu.domain.User;



public interface RegisterService {
    int insertUser(User user);

    User checkByphone(String phone);
}
