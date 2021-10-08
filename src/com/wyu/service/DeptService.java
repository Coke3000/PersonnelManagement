package com.wyu.service;

import com.wyu.domain.Dept;

import java.util.List;

public interface DeptService {
    List<Dept> findDept();

    int updateDeptByDid(Dept dept);

    int deleteDeptByDid(String did);

    List<Dept> searchDept(Dept dept);

    int addDept(Dept dept);

    int getTotal();
}
