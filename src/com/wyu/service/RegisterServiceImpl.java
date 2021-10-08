package com.wyu.service;

import com.wyu.domain.User;
import com.wyu.domain.UserExample;
import com.wyu.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegisterServiceImpl implements RegisterService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public int insertUser(User user) {
        int i=userMapper.insertSelective(user);
        return i;
    }

    @Override
    public User checkByphone(String phone) {
        UserExample example=new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andPhoneEqualTo(phone);
        List<User> list=userMapper.selectByExample(example);
        if(list != null && list.size() > 0){
            return list.get(0);
        }
        return null;
    }
}
