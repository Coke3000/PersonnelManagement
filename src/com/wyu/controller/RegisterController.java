package com.wyu.controller;

import com.wyu.domain.User;
import com.wyu.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.DataOutput;
import java.io.IOException;
import java.security.PublicKey;
import java.util.Date;
import java.util.List;

@RestController
public class RegisterController {
    @Autowired
    private RegisterService registerService;
    @RequestMapping ("/register.do")
        public String  register(String username,String password,String phone,String remark,String phoneCheckCode,HttpSession session) throws IOException {
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setPhone(phone);
        user.setRemark(remark);
        System.out.println("注册信息："+user);
        //将注册信息传到serviceceng
        String msg="0";
        //设置角色为普通用户
        user.setRoleId(1);
        user.setCreatedate(new Date());
        //取出session域中的验证码
        String phoneCodeNum=(String)session.getAttribute("phoneCodeNum");
        if(phoneCheckCode.equals(phoneCodeNum)){
            System.out.println("手机验证成功！");
            int i=registerService.insertUser(user);
            if(i>0){
                msg="1";
            }else{
                msg="2";
            }
        }else {
            msg="3";
        }
        return msg;
        }

        //去数据库查询手机是否已经注册过
    @RequestMapping("/checkPhone.do")
    public String checkPhone(String phone){
        String msg="false";
        User user=registerService.checkByphone(phone);
        if(user!=null){
            //证明存在此用户
                msg="true";
        }
        return msg;
    }
}
