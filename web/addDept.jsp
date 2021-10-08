<%--
  Created by IntelliJ IDEA.
  User: 99365
  Date: 2020/10/20
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加部门</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body>
<form class="layui-form layui-form-pane" action="" style="padding-top: 20px;padding-left:16px;margin-right: 20px">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label "><li class="layui-icon layui-icon-username ">&nbsp;部门:</li></label>
            <div class="layui-input-inline">
                <input type="text" id="dname" name="dname" required  lay-verify="required|dnames" placeholder="请输入部门名称" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label "><li class="layui-icon layui-icon-align-left">&nbsp;备注:</li></label>
        <div class="layui-input-block">
            <textarea id="dremark" placeholder="请输入内容" class="layui-textarea" name="dremark"></textarea>
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
            var dname=$("#dname").val();
            var dremark=$("#dremark").val();
            var json={'dname':dname,'dremark':dremark};
            $.post("AddDept.do",json,function (data,textStatus) {
                if(data=="true"){
                    layer.msg('添加部门成功!',{icon:1})
                }
                else{
                    layer.msg('添加部门失败！',{icon:2})
                }
            })

            return false;
        });
    });
</script>
</html>
