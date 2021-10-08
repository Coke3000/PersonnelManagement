package com.wyu.service;

import com.wyu.domain.Counts;
import com.wyu.domain.User;
import com.wyu.domain.UserExample;
import com.wyu.mapper.CountsMapper;
import com.wyu.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CountsMapper countsMapper;
    @Override
    public User loginByUsername(String username, String password) {
        //调用逆向工程完成查询操作
        UserExample example = new UserExample();
        //username是String类型要转换
        int id = 0;
        try {
            id = Integer.parseInt(username);
        } catch (NumberFormatException e) {

        }
        example.or().andIdEqualTo(id);
        example.or().andPhoneEqualTo(username);
        List<User> list = userMapper.selectByExample(example);
        //判断结果
        if (list != null && list.size() > 0) {
            //说明查询到数据了
            String sqlpasswordString = list.get(0).getPassword();
            if (password.equals(sqlpasswordString)) {
                //登录成功
                return list.get(0);
            }
        }
        return null;
    }

    //查询数量
    @Override
    public Counts selectCounts() {

        return countsMapper.selectCounts();
    }
}
