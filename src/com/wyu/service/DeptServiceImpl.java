package com.wyu.service;

import com.github.pagehelper.PageHelper;
import com.wyu.domain.Dept;
import com.wyu.domain.DeptExample;
import com.wyu.mapper.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptMapper deptMapper;
    //部门查询
    @Override
    public List<Dept> findDept() {
        DeptExample example=new DeptExample();
        List<Dept> list=deptMapper.selectByExample(example);
        return list;
    }

    //修改部门
    @Override
    public int updateDeptByDid(Dept dept) {
        int i=deptMapper.updateByPrimaryKeySelective(dept);
        return i;
    }

    //删除部门
    @Override
    public int deleteDeptByDid(String did) {
        int did1=Integer.parseInt(did);
        int i=deptMapper.deleteByPrimaryKey(did1);
        return i;
    }

    //搜索框
    @Override
    public List<Dept> searchDept(Dept dept) {
        DeptExample example=new DeptExample();
        DeptExample.Criteria criteria = example.createCriteria();
        if(dept.getDid()!=null){
            criteria.andDidEqualTo(dept.getDid());
        }
        if(dept.getDname()!=null){
            criteria.andDnameLike("%"+dept.getDname()+"%");
        }
        List<Dept> list=deptMapper.selectByExample(example);
        return list;
    }

    //添加部门
    @Override
    public int addDept(Dept dept) {
        int i=deptMapper.insertSelective(dept);
        return i;
    }

    //查询条数
    @Override
    public int getTotal() {
        DeptExample example=new DeptExample();
        int total=deptMapper.countByExample(example);
        return total;
    }


}
