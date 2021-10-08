package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.domain.Notice;
import com.wyu.domain.User;
import com.wyu.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RestController
public class NoticeController {
    @Autowired
    private NoticeService ns;
    //显示公告查询列表
    @RequestMapping("/FindNotice.do")
    public void findnotice(int page, int limit, HttpServletResponse response) throws IOException {
        //处理将数据返回前端页面出现中文乱码问题
        response.setContentType("text/html;charset=utf-8");
        System.out.println("当前页："+page);
        System.out.println("条数："+limit);
        //计算出从哪里开始查询
        //查询 多少条
        PageHelper.startPage(page,limit);
        List<Notice> list=ns.findNotice();
        //list.forEach(li-> System.out.println(li));
        //得到总记录数
        int total=ns.getTotal();
        System.out.println("总记录："+total);
        //用fastjson工具将list集合构建json数据
        String json = JSON.toJSONString(list);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":"+total+",\"data\":"+json+"}");

    }

    //添加公告
    @RequestMapping("/AddNotice.do")
    public String addnotice(String json, HttpSession session){
        String msg="false";
        //将得到的json数据封装到对象中
        Notice notice = JSON.parseObject(json, Notice.class);
        User user = (User) session.getAttribute("user");
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3||user2.getRoleId()==2){
            if(user!=null){
                notice.setUserid(user.getId());
                //调用service层完成添加
                int i=ns.insertNotice(notice);
                if(i>0){
                    msg="true";
                }else {
                    msg="false";
                }
            }
        }

        return msg;
    }

    //公告查询编辑功能
    @RequestMapping("UpdateNotice.do")
    public String updatenotice(Notice notice,HttpSession session){
        String msg="false";
        //System.out.println("要修改的信息:"+notice);
        //获得session域中的user
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3){
            int i=ns.updateNoticeById(notice);
            if(i>0){
                msg="true";
            }else{
                msg="false";
            }
        }
        return msg;
    }


    //公告查询删除功能
    @RequestMapping("/DeleteNotice.do")
    public String deletenotice(String id,HttpSession session){
        String msg="false";
        //获得session域中的user
        User user2 = (User) session.getAttribute("user");
        if(user2.getRoleId()==3){
            int i=ns.deleteNoticeById(id);
            if(i>0){
                msg="true";
            }else{
                msg="false";
            }
        }
        return msg;
    }

    //公告查询头部搜索功能
    @RequestMapping("/SearchNotice.do")
    private void searchnotice(int page,int limit,Notice notice,HttpServletResponse response) throws IOException {
        //处理将数据返回前端页面出现中文乱码问题
        response.setContentType("text/html;charset=utf-8");
        // System.out.println("要查询的数据："+user);
        PageHelper.startPage(page,limit);
        List<Notice> list=ns.searchNotice(notice);
        //得到总记录数
        int total=ns.getTotal();
        System.out.println("总记录："+total);
        //用fastjson工具将list集合构建json数据
        String json = JSON.toJSONString(list);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":"+total+",\"data\":"+json+"}");

    }

    //首页公告显示
    @RequestMapping("/selectByTop5Notice.do")
    public void selectByTop5Notice(HttpServletResponse response) throws IOException {
        //处理将数据返回前端页面出现中文乱码问题
        response.setContentType("text/html;charset=utf-8");
        List<Notice> list=ns.findTop5Notice();
        int total=list.size();
        //用fastjson工具将list集合构建json数据
        String json = JSON.toJSONString(list);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":"+total+",\"data\":"+json+"}");
    }


}
