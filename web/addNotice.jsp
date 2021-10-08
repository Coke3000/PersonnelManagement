<%--
  Created by IntelliJ IDEA.
  User: 99365
  Date: 2021/7/3
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加公告</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
    <script src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="./ueditor/ueditor.all.min.js"></script>
</head>
<body>
<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">主题</label>
        <div class="layui-input-inline">
            <input type="text" name="title" lay-verify="required" placeholder="请输入主题" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-inline">
            <input type="text" name="remark"  autocomplete="off" class="layui-input">
        </div>
    </div>


<textarea style="height: 250px" name="content" id="container" cols="30" rows="10"></textarea>

    <div class="layui-form-item" style="margin-top: 10px">
        <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="demo1">提交</button>
    </div>
</form>
</body>
<script>
    var ue=UE.getEditor("container");

    layui.use(['form', 'jquery'], function() {
        var form=layui.form;
        var $=layui.jquery;

        //监听提交
        form.on('submit(demo1)', function (data) {
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })

            var json={"json":JSON.stringify(data.field)};
            $.post("AddNotice.do",json,function (data) {
                if(data=="true"){
                    layer.msg('添加公告成功!',{icon:1})
                }
                else{
                    layer.msg('添加公告失败！',{icon:2})
                }
            })
            return false;
        });
    })
</script>
</html>
