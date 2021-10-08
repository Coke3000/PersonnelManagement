package com.wyu.service;

import com.github.pagehelper.PageHelper;
import com.wyu.domain.User;
import com.wyu.domain.UserExample;
import com.wyu.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    //查询用户
    @Override
    public List<User> findUser() {
        UserExample example=new UserExample();
        List<User> list=userMapper.selectByExample(example);
        return list;
    }
    //查询条数
    @Override
    public int getTotal() {
        UserExample example=new UserExample();
        int total=userMapper.countByExample(example);
        return total;
    }

    @Override
    public int updateUserById(User user) {
        int i=userMapper.updateByPrimaryKeySelective(user);
        return i;
    }

    @Override
    public int deleteUserById(String id) {
        int id1=Integer.parseInt(id);
        int i=userMapper.deleteByPrimaryKey(id1);
        return i;
    }

    @Override
    public List<User> searchUser(User user) {
        UserExample example=new UserExample();
		UserExample.Criteria criteria=example.createCriteria();
		if(user.getId()!=null) {
			criteria.andIdEqualTo(user.getId());
		}
		if(user.getPhone()!=null) {
			criteria.andPhoneLike("%"+user.getPhone()+"%");
		}
		if(user.getUsername()!=null) {
			criteria.andUsernameLike("%"+user.getUsername()+"%");
		}
		if(user.getRoleId()!=null) {
			criteria.andRoleIdEqualTo(user.getRoleId());
		}
		List<User> list=userMapper.selectByExample(example);
        return list;
    }

    //添加用户
    @Override
    public int insertUser(User user) {
        int i=userMapper.insertSelective(user);
        return i;
    }
}
