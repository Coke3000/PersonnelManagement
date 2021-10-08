package com.wyu.Interceptor;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//检查用户是否登录的拦截器
public class CheckUserInterceptor implements HandlerInterceptor {
    /**
     * 在执行handler之前执行
     * 返回值：true，放行，false：拦截
     * @param request
     * @param response
     * @param o
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        HttpSession session = request.getSession();
        //登录和注册不能拦截
        String path=request.getRequestURI();
        if(path.indexOf("login.do")!=-1||path.indexOf("register.do")!=-1||path.indexOf("checkPhone.do")!=-1||path.indexOf("getCode.do")!=-1){
            return true;
        }
        if(session.getAttribute("user")!=null){
            System.out.println("用户已经登录");
            return true;
        }else {
            System.out.println("用户未登录");
            //跳转到登录页面
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }

        return false;
    }

    /**
     * 在最后一行代码之后，在return之前执行
     * 应用场景：需要根据某种业务规则，重新修改ModelAndView
     * @param request
     * @param response
     * @param o
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {

    }

    /**
     * 执行hander之后执行
     * 应用场景：做日志记录
     * @param request
     * @param response
     * @param o
     * @param e
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {

    }
}
