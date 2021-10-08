package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.wyu.util.HttpUtils;
import com.wyu.util.StringCodeUtil;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
public class MessageController {
    //验证码
    @RequestMapping("/getCode.do")
    public String getcode(String phoneNumber, HttpSession session){
        String msg="false";
        System.out.println("收到的手机号是："+phoneNumber);
        String host = "https://gyytz.market.alicloudapi.com";
        String path = "/sms/smsSend";
        String method = "POST";
        String appcode = "4fbf1bd726c74e8786ffb7c05f086a6b";
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("mobile",phoneNumber);
        //产生随机数
        String code1= StringCodeUtil.getCodeNumber(6);
        System.out.println("产生的随机数："+code1);
        //将随机数放到session域中
        session.setAttribute("phoneCodeNum",code1);
       // querys.put("param", "**code**:12345,**minute**:5");
        querys.put("param", "**code**:"+code1+",**minute**:5");
        querys.put("smsSignId", "2e65b1bb3d054466b82f0c9d125465e2");
        querys.put("templateId", "908e94ccf08b4476ba6c876d13f084ad");
        Map<String, String> bodys = new HashMap<String, String>();

        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             */
            HttpResponse response = HttpUtils.doPost(host, path, method, headers, querys, bodys);
            System.out.println(response.toString());
            //获取response的body
            //System.out.println("!!!!!!!!!!!!!!!responseBody中的内容："+EntityUtils.toString(response.getEntity()));
            //如果请求响应成功就返回true;
            if(response.getStatusLine().getStatusCode()==200){
                msg="true";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return msg;
    }
}
