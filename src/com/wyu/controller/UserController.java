package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.wyu.domain.User;
import com.wyu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@RestController
public class UserController {
    @Autowired
    private UserService us;
    //显示用户查询列表
    @RequestMapping("/FindUser.do")
    public void finduser(int  page, int  limit, HttpServletResponse response) throws IOException {
        //处理将数据返回前端页面出现中文乱码问题
        response.setContentType("text/html;charset=utf-8");
            System.out.println("当前页："+page);
            System.out.println("条数："+limit);
            PageHelper.startPage(page,limit);
            List<User> list=us.findUser();
            list.forEach(li-> System.out.println(li));
            //得到总记录数
            int total=us.getTotal();
            System.out.println("总记录："+total);
            //用fastjson工具将list集合构建json数据
            String json = JSON.toJSONString(list);
            response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":"+total+",\"data\":"+json+"}");



    }

    //用户查询编辑功能
    @RequestMapping("/UpdateUser.do")
    public String updateuser(User user, HttpSession session){
        String msg="false";
        //System.out.println("要修改的信息:"+user);
        //获得session域中的user
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3){
            int i=us.updateUserById(user);
            if(i>0){
                msg="true";
            }else{
                msg="false";
            }
        }
        return msg;
    }

    //用户查询删除功能
    @RequestMapping("/DeleteUser.do")
    public String deleteuser(String id, HttpSession session){
        String msg="false";
        //获得session域中的user
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3){
            int i=us.deleteUserById(id);
            if(i>0){
                msg="true";
            }else{
                msg="false";
            }
        }

        return msg;
    }

    //用户查询头部搜索功能
    @RequestMapping("/SearchUser.do")
    private void searchuser(int page,int limit, User user,HttpServletResponse response) throws IOException {
        //处理将数据返回前端页面出现中文乱码问题
        response.setContentType("text/html;charset=utf-8");
       // System.out.println("要查询的数据："+user);
        PageHelper.startPage(page,limit);
        List<User> list=us.searchUser(user);
        //得到总记录数
        int total=us.getTotal();
        System.out.println("总记录："+total);
        //用fastjson工具将list集合构建json数据
        String json = JSON.toJSONString(list);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":"+total+",\"data\":"+json+"}");

    }

    //添加用户
    @RequestMapping("/AddUser.do")
    public String  addUser(User user, HttpServletResponse response,HttpSession session) throws IOException {
        System.out.println("添加用户信息："+user);
        //将注册信息传到serviceceng
        String msg="false";
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3||user2.getRoleId()==2){
            user.setCreatedate(new Date());
            int i=us.insertUser(user);
            if(i>0){
                msg="true";
            }else{
                msg="false";
            }
        }

        return msg;
    }

}
