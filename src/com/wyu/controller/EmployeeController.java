package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.wyu.domain.Dept;
import com.wyu.domain.Employee;
import com.wyu.domain.User;
import com.wyu.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@RestController
public class EmployeeController {
    @Autowired
    private EmployeeService es;
    @RequestMapping("/FindEmployee.do")
    public void findemployee(int  page, int  limit, HttpServletResponse response) throws IOException {
        //处理将数据返回前端页面出现中文乱码问题
        response.setContentType("text/html;charset=utf-8");
        System.out.println("当前页："+page);
        System.out.println("条数："+limit);
        PageHelper.startPage(page,limit);
        List<Employee> list=es.findEmployee();
        //list.forEach(li-> System.out.println("日期---------："+li.getCreateDate()));
        int total=es.getTotal();
        System.out.println("总记录："+total);
        //用fastjson工具将list集合构建json数据
        String json = JSON.toJSONString(list);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":"+total+",\"data\":"+json+"}");

    }

    //员工查询编辑功能
    @RequestMapping("/UpdateEmployee.do")
    public String updateempoyee(Employee employee, HttpSession session){
        String msg="false";
        //System.out.println("要修改的生日信息:"+birthday);
        //将生日日期时间戳转为date类型
        Date birthday=new Date(Long.parseLong(employee.getBirthdayStr()));
        employee.setBirthday(birthday);
        //获得session域中的user
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3){
            int i=es.updateEmployeeById(employee);
            if(i>0){
                msg="true";
            }else{
                msg="false";
            }
        }
        return msg;
    }

    //员工查询删除功能
    @RequestMapping("/DeleteEmployee.do")
    public String deleteemployee(String id,HttpSession session){
        String msg="false";
        //获得session域中的user
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3){
            int i=es.deleteEmployeeById(id);
            if(i>0){
                msg="true";
            }else{
                msg="false";
            }
        }
        return msg;
    }

    //员工查询头部搜索功能
    @RequestMapping("/SearchEmployee.do")
    private void searchemployee(int page,int limit, Employee employee,HttpServletResponse response) throws IOException {
        //处理将数据返回前端页面出现中文乱码问题
        response.setContentType("text/html;charset=utf-8");
        PageHelper.startPage(page,limit);
        // System.out.println("要查询的数据："+user);
        List<Employee> list=es.searchEmployee(employee);
        //得到总记录数
        int total=es.getTotal();
        System.out.println("总记录："+total);
        //用fastjson工具将list集合构建json数据
        String json = JSON.toJSONString(list);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":"+total+",\"data\":"+json+"}");

    }

    //添加员工
    @RequestMapping("/AddEmployee.do")
    public String addemployee(Employee employee,HttpSession session){
        String msg="false";
        //将生日日期时间戳转为date类型
        Date birthday=new Date(Long.parseLong(employee.getBirthdayStr()));
        employee.setBirthday(birthday);
        employee.setCreateDate(new Date());
        //判断性别，如果是男则改为1.如果是女则改为2
        if(employee.getSex().equals("男"))
        {
            employee.setSex("1");
        }else if(employee.getSex().equals("女")) {
            employee.setSex("2");
        }

        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3||user2.getRoleId()==2){
            int i=es.addEmployee(employee);
            if(i>0){
                msg="true";
            }else {
                msg="false";
            }
        }
        return msg;
    }


}
