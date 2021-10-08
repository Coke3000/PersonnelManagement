package com.wyu.service;

import com.github.pagehelper.PageHelper;
import com.wyu.domain.Role;
import com.wyu.domain.RoleExample;
import com.wyu.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    //角色查询
    @Override
    public List<Role> findRole() {
        RoleExample example=new RoleExample();

        List<Role> list=roleMapper.selectByExample(example);
        return list;
    }

    //角色总条数
    @Override
    public int getTotal() {
        RoleExample example=new RoleExample();
        int total=roleMapper.countByExample(example);
        return total;
    }

    //角色修改
    @Override
    public int updateRoleByRid(Role role) {
        int i=roleMapper.updateByPrimaryKeySelective(role);
        return i;
    }

    //角色删除
    @Override
    public int deleteRoleByRname(String rname) {
        RoleExample example=new RoleExample();
        RoleExample.Criteria criteria = example.createCriteria();
        criteria.andRnameEqualTo(rname);
        int i=roleMapper.deleteByExample(example);
        return i;
    }

    //角色查询
    @Override
    public List<Role> searchRole(Role role) {
        RoleExample example=new RoleExample();
        RoleExample.Criteria criteria = example.createCriteria();
        if(role.getRid()!=null){
            criteria.andRidEqualTo(role.getRid());
        }
        if(role.getRname()!=null){
            criteria.andRnameLike("%"+role.getRname()+"%");
        }
        List<Role> list=roleMapper.selectByExample(example);
        return list;
    }

    //添加角色
    @Override
    public int addRole(Role role) {
        int i=roleMapper.insertSelective(role);
        return i;
    }
}
