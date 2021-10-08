package com.wyu.service;

import com.wyu.domain.Counts;
import com.wyu.domain.User;

public interface LoginService {
    User loginByUsername(String username, String password);

    Counts selectCounts();
}
