<%--
  Created by IntelliJ IDEA.
  User: 99365
  Date: 2020/10/20
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body>
<form class="layui-form layui-form-pane" action="" style="padding-top: 20px;padding-left:16px;margin-right: 20px">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label "><li class="layui-icon layui-icon-username ">&nbsp;角色:</li></label>
            <div class="layui-input-inline">
                <input type="text" id="rname" name="rname" required  lay-verify="required|jnames" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label "><li class="layui-icon layui-icon-align-left">&nbsp;备注:</li></label>
        <div class="layui-input-block">
            <textarea id="rremark" placeholder="请输入内容" class="layui-textarea" name="rremark"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
</body>
<script>
    //Demo
    layui.use(['form','jquery','layer'], function(){
        var form = layui.form;
        var $=layui.jquery;
        var layer=layui.layer;

        //监听提交
        form.on('submit(formDemo)', function(data){
            var rname=$("#rname").val();
            var rremark=$("#rremark").val();
            var json={'rname':rname,'rremark':rremark};
            $.post("AddRole.do",json,function (data,textStatus) {
                if(data=="true"){
                    layer.msg('添加角色成功!',{icon:1})
                }
                else{
                    layer.msg('添加角色失败！',{icon:2})
                }
            })

            return false;
        });
    });
</script>
</html>
