package com.wyu.util;

import java.util.Random;

/**
 * 产生手机验证码随机数
 */

public class StringCodeUtil {
    public static String getCodeNumber(int number){
        //产生指定个数的随机数0-9
        Random dom=new Random();
        String code="";
        for(int i=0;i<number;i++){
            code+=dom.nextInt(10);
        }
        System.out.println("手机产生的随机验证码是："+code);
        return code;
    }
}
