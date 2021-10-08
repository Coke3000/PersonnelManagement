package com.wyu.service;

import com.github.pagehelper.PageHelper;
import com.wyu.domain.Employee;
import com.wyu.domain.EmployeeExample;
import com.wyu.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmployeeServiceImpl implements EmployeeService{
    @Autowired
    private EmployeeMapper employeeMapper;
    //员工查询
    @Override
    public List<Employee> findEmployee() {
        EmployeeExample example=new EmployeeExample();
        List<Employee> list=employeeMapper.selectByExample(example);
        return list;
    }

    //员工条数
    @Override
    public int getTotal() {
        EmployeeExample example=new EmployeeExample();
        int total=employeeMapper.countByExample(example);
        return total;
    }

    //员工查询编辑功能
    @Override
    public int updateEmployeeById(Employee employee) {
        int i=employeeMapper.updateByPrimaryKeySelective(employee);
        return i;
    }

    //员工查询删除功能
    @Override
    public int deleteEmployeeById(String id) {
        int id1=Integer.parseInt(id);
        int i=employeeMapper.deleteByPrimaryKey(id1);
        return i;
    }

    //头部搜索功能
    @Override
    public List<Employee> searchEmployee(Employee employee) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        if(employee.getId()!=null){
            criteria.andIdEqualTo(employee.getId());
        }
        if(employee.getDeptId()!=null){
            criteria.andDeptIdEqualTo(employee.getDeptId());
        }
        if(employee.getJobId()!=null){
            criteria.andJobIdEqualTo(employee.getJobId());
        }
        if(employee.getName()!=null){
            criteria.andNameLike("%"+employee.getName()+"%");
        }
        List<Employee> list=employeeMapper.selectByExample(example);
        return list;
    }

    //添加员工
    @Override
    public int addEmployee(Employee employee) {
        int i=employeeMapper.insertSelective(employee);
        return i;
    }
}
