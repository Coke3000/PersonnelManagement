package com.wyu.service;

import com.wyu.domain.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> findEmployee();

    int getTotal();

    int updateEmployeeById(Employee employee);

    int deleteEmployeeById(String id);

    List<Employee> searchEmployee(Employee employee);

    int addEmployee(Employee employee);
}
