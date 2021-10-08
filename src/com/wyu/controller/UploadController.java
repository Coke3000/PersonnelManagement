package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.wyu.domain.Uploadfile;
import com.wyu.domain.User;
import com.wyu.service.UploadService;
import com.wyu.util.GetFilesUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.lang.annotation.Retention;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UploadController {
    @Autowired
    private UploadService uploadService;
    @RequestMapping("/uploadFile.do")
    @ResponseBody
    public String uploadFile(MultipartFile file, HttpSession session){
        String filename=file.getOriginalFilename();
        System.out.println("上传文件的名称："+filename);
        //将得到的文件保存到本地，可以用io流，一般会用第三方插件
        //指定文件存放的路径
        String path="D:\\upload";
        //先判断是否文件夹存在，如果不存在，要先创建一个文件夹
        File file1=new File(path);
        if(!file1.exists()){
            //创建文件夹
            file1.mkdirs();
        }

        //文件名问题，要解决文件重名问题：思路：获取当前时间的时间戳加上6位随机数
        User user=(User) session.getAttribute("user");
        String newFileName=System.currentTimeMillis()+"-"+user.getId()+"-"+filename;
        //返回数据给前端
        Map<String,Object> map=new HashMap<>();
        if(file!=null&&!file.isEmpty()){
            //说明文件不为空
            try {
                file.transferTo(new File(path+"\\"+newFileName));
                System.out.println("文件上传成功");
                if(user!=null){
                    Uploadfile uploadfile=new Uploadfile();
                    uploadfile.setFilename(newFileName);
                    uploadfile.setUserid(user.getId());
                    uploadfile.setUploaddate(new Date());
                    //将文件名保存到数据库
                    int i=uploadService.insertFile(uploadfile);
                    if(i>0){
                            map.put("code",200);
                   }else {
                           map.put("code",500);
                     }
                }
            } catch (IOException e) {
                System.out.println("文件上传失败");
                map.put("code",500);
                e.printStackTrace();
            }
        }


        map.put("msg","");
        map.put("data",newFileName);
        //构建json数据
        String json= JSON.toJSONString(map);

        return json;
    }

    //下载列表
    @RequestMapping(value = "/selectDownload.do",produces="text/application;charset=utf-8")
    @ResponseBody
    public String selectDownload(){
        Map<String,Object> map=new HashMap<String, Object>();
        List<Uploadfile> list=uploadService.selectFiles();
        //构建json数据
        map.put("code",0);
        map.put("msg","");
        map.put("data",list);
        map.put("count",list.size());
        String json= JSON.toJSONString(map);
        GetFilesUtil.uploadfiles.clear();
        return json;
    }

    //处理下载时中文乱码问题
    public String getFileName(HttpServletRequest request,String filename) throws Exception{
        System.out.println(filename);
        String[] IEBrowerKeyWord={"MSIE","Trident","Edge"};
        String userAgent=request.getHeader("User-Agent");
        for(String KeyWord :IEBrowerKeyWord){
            if(userAgent.contains(KeyWord)){
                return URLEncoder.encode(filename,"UTF-8");
            }
        }
        return new String(filename.getBytes("UTF-8"),"ISO-8859-1");
    }

    @RequestMapping("/download.do")
    @ResponseBody
    public ResponseEntity<byte[]> download(HttpServletRequest request,String filename){
        File file=new File("D:\\upload"+"\\"+filename);
        try {
            filename=this.getFileName(request,filename);
        }catch (Exception exception){
            exception.printStackTrace();
        }
        HttpHeaders headers=new HttpHeaders();
        headers.setContentDispositionFormData("attachement",filename);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        try {
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
        }catch (IOException e){
            e.printStackTrace();
        }
        return null;
    }

}
