<%--
  Created by IntelliJ IDEA.
  User: 99365
  Date: 2021/7/5
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传文件</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>你可以尝试将要上传的文件拖拽进来</legend>
</fieldset>

<div class="layui-upload-drag" id="test10">
    <i class="layui-icon"></i>
    <p>点击上传，或将文件拖拽到此处</p>
    <div class="layui-hide" id="uploadDemoView">
        <hr>
        <img src="" alt="上传成功后渲染" style="max-width: 196px">
    </div>
</div>
</body>

<script>
    layui.use(['upload', 'element', 'layer'], function(){
        var $ = layui.jquery
            ,upload = layui.upload
            ,element = layui.element
            ,layer = layui.layer;

        //拖拽上传
        upload.render({
            elem: '#test10'
            ,multiple: true//支持多文件上传
            ,size:2097152//不能超过2GB
            ,accept:'file'//可以上传所有文件类型
            ,url: 'uploadFile.do' //改成您自己的上传接口
            ,done: function(res){
                if(res.code=="200"){
                    layer.msg('上传成功',{icon:1});
                }else {
                    layer.msg('上传失败',{icon:5});
                }

                console.log(res)
            }
        });

    });
</script>
</html>
