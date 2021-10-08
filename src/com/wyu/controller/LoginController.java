package com.wyu.controller;

import com.wyu.domain.Counts;
import com.wyu.domain.User;
import com.wyu.service.LoginService;
import net.sf.jsqlparser.statement.create.table.Index;
import org.apache.logging.log4j.core.appender.rewrite.MapRewritePolicy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;
    @RequestMapping("/login.do")
    @ResponseBody
    public String login(String username, String password, String checkcode, HttpSession session,HttpServletRequest request){
        //接收用户提交过来的用户名和密码
        System.out.println("用户名："+username+"密码："+password+"验证码："+checkcode);
        //得到session域中的验证码
        String code=(String)session.getAttribute("code");
        //定义一个String用来标识结果：1.表示验证码不正确，2表示用户名或密码不正确，3.表示登录成功
        String msg="0";
        if(checkcode!=null&&!"".equals(checkcode)){
            if(checkcode.equalsIgnoreCase(code)) {
                System.out.println("验证成功");
                //调用service层完成查询操作
               User user= loginService.loginByUsername(username,password);
                if(user!=null){
                    //登录成功
                    //去数据库查询各个表的数据的数量
                    Counts counts=loginService.selectCounts();
                    session.setAttribute("counts",counts);
                    //将用户的信息保存到session中，到主界面要使用
                    session.setAttribute("user",user);//将对象放到session域中
                    msg="3";
                }
                else{
                    msg="2";
                    //登陆失败
                }
            }
            else
            {
                msg="1";//表示验证码错误
                System.out.println("验证失败");

            }
        }
        return msg;
    }


    //退出登录
    @RequestMapping("/logout.do")
    public String logout(HttpSession session){
        //退出登录的思路就是将session域中的对象删除
        session.removeAttribute("user");
        return "index";
    }
}
