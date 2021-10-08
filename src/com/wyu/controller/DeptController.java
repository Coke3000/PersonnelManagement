package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.wyu.domain.Dept;
import com.wyu.domain.User;
import com.wyu.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RestController
public class DeptController {
    @Autowired
    private DeptService ds;
    //显示部门查询列表
    @RequestMapping("/FindDept.do")
    public void finddept(int  page, int  limit, HttpServletResponse response) throws IOException {
        //处理将数据返回前端页面出现中文乱码问题
        response.setContentType("text/html;charset=utf-8");
        System.out.println("当前页："+page);
        System.out.println("条数："+limit);
        PageHelper.startPage(page,limit);
        List<Dept> list=ds.findDept();
        int total=ds.getTotal();
        System.out.println("总记录："+total);
        //用fastjson工具将list集合构建json数据
        String json = JSON.toJSONString(list);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":"+total+",\"data\":"+json+"}");

    }

    //部门查询编辑功能
    @RequestMapping("/UpdateDept.do")
    public String updatedept(Dept dept, HttpSession session){
        String msg="false";
        //System.out.println("要修改的信息:"+user);
        //获得session域中的user
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3){
            int i=ds.updateDeptByDid(dept);
            if(i>0){
                msg="true";
            }else{
                msg="false";
            }
        }

        return msg;
    }

    //部门查询删除功能
    @RequestMapping("/DeleteDept.do")
    public String deletedept(String did,HttpSession session){
        String msg="false";
        //获得session域中的user
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3){
            int i=ds.deleteDeptByDid(did);
            if(i>0){
                msg="true";
            }else{
                msg="false";
            }
        }
        return msg;
    }

    //部门查询头部搜索功能
    @RequestMapping("/SearchDept.do")
    private void searchuser(int page,int limit, Dept dept, HttpServletResponse response) throws IOException {
        //处理将数据返回前端页面出现中文乱码问题
        response.setContentType("text/html;charset=utf-8");
         //System.out.println("要查询的数据："+dept);
        PageHelper.startPage(page,limit);
        List<Dept> list=ds.searchDept(dept);
        //得到总记录数
        int total=ds.getTotal();
        System.out.println("总记录："+total);
        //用fastjson工具将list集合构建json数据
        String json = JSON.toJSONString(list);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":"+total+",\"data\":"+json+"}");
    }

    //添加部门
    @RequestMapping("AddDept.do")
    public String adddept(Dept dept,HttpSession session){
        String msg="false";
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3||user2.getRoleId()==2){
            int i=ds.addDept(dept);
            if(i>0){
                msg="true";
            }else {
                msg="false";
            }
        }
        return msg;
    }


}
