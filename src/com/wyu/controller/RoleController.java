package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.wyu.domain.Dept;
import com.wyu.domain.Role;
import com.wyu.domain.User;
import com.wyu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RestController
public class RoleController {
    @Autowired
    private RoleService rs;
    //显示部门查询列表
    @RequestMapping("/FindRole.do")
    public void findrole(int  page, int limit, HttpServletResponse response) throws IOException {
        //处理将数据返回前端页面出现中文乱码问题
        response.setContentType("text/html;charset=utf-8");
        System.out.println("当前页："+page);
        System.out.println("条数："+limit);
        PageHelper.startPage(page,limit);
        List<Role> list=rs.findRole();
        int total=rs.getTotal();
        System.out.println("总记录："+total);
        //用fastjson工具将list集合构建json数据
        String json = JSON.toJSONString(list);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":"+total+",\"data\":"+json+"}");

    }

    //角色查询编辑功能
    @RequestMapping("/UpdateRole.do")
    public String updaterole(Role role, HttpSession session){
        String msg="false";
        //System.out.println("要修改的信息:"+user);
        //获得session域中的user
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3){
            int i=rs.updateRoleByRid(role);
            if(i>0){
                msg="true";
            }else{
                msg="false";
            }
        }
        return msg;
    }

    //角色查询删除功能
    @RequestMapping("/DeleteRole.do")
    public String deleterole(String rname,HttpSession session){
        String msg="false";
        //获得session域中的user
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3){
            int i=rs.deleteRoleByRname(rname);
            if(i>0){
                msg="true";
            }else{
                msg="false";
            }
        }

        return msg;
    }

    //角色查询头部搜索功能
    @RequestMapping("/SearchRole.do")
    private void searchrole(int page,int limit, Role role, HttpServletResponse response) throws IOException {
        //处理将数据返回前端页面出现中文乱码问题
        response.setContentType("text/html;charset=utf-8");
        PageHelper.startPage(page,limit);
        List<Role> list=rs.searchRole(role);
        //得到总记录数
        int total=rs.getTotal();
        System.out.println("总记录："+total);
        //用fastjson工具将list集合构建json数据
        String json = JSON.toJSONString(list);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":"+total+",\"data\":"+json+"}");
    }

    //添加部门
    @RequestMapping("AddRole.do")
    public String addrole(Role role,HttpSession session){
        String msg="false";
        //获得session域中的user
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3){
            int i=rs.addRole(role);
            if(i>0){
                msg="true";
            }else {
                msg="false";
            }
        }
        return msg;
    }

}
