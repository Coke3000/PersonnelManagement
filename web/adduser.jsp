<%--
  Created by IntelliJ IDEA.
  User: 99365
  Date: 2020/10/17
  Time: 11:19
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
<div>
    <form class="layui-form layui-form-pane" action="" style="padding-top: 20px;padding-left:16px;margin-right: 20px">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label "><li class="layui-icon layui-icon-username ">&nbsp;姓名:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="username" name="username" required  lay-verify="required|usernames" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label  "><li class="layui-icon layui-icon-key">&nbsp;设置密码:</li></label>
                <div class="layui-input-inline">
                    <input id="pw1" type="password" name="password" required lay-verify="required|pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label "><li class="layui-icon layui-icon-password">&nbsp;确认密码:</li></label>
                <div class="layui-input-inline">
                    <input id="pw2" type="password" name="password2" required lay-verify="required|pass" placeholder="请再次输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label "><li class="layui-icon layui-icon-cellphone">&nbsp;手机号:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" required  lay-verify="required|phone1" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-group">&nbsp;角色:</li></label>
                <div class="layui-input-inline">
                    <select id="roleId" name="roleId" lay-filter="aihao">
                        <option value="1">普通用户</option>
                        <option value="2">管理员</option>
                        <option value="3">超级管理员</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label "><li class="layui-icon layui-icon-align-left">&nbsp;备注:</li></label>
            <div class="layui-input-block">
                <textarea id="remark" placeholder="请输入内容" class="layui-textarea" name="remark"></textarea>
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
</div>
</body>
<script>
    //Demo
    layui.use(['form','jquery','layer'], function(){
        var form = layui.form;
        var $=layui.jquery;
        var layer=layui.layer;
        form.verify({
            pass:[/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$/,'密码必须要是6-12位且字母加数字'],
            usernames:[/^[\u4e00-\u9fa5]{2,6}$/,'用户名必须是中文，且2-6位 '],
            phone1:[/^1[3-9][0-9]{9}$/,"请输入正确的手机号"]
        });

        //监听提交
        form.on('submit(formDemo)', function(data){
            var username=$("#username").val();
            var pw1=$("#pw1").val();
            var phone=$("#phone").val();
            var roleId=$("#roleId").val();
            var remark=$("#remark").val();
            var json={'username':username,'password':pw1,'phone':phone,'roleId':roleId,'remark':remark};
            $.post("AddUser.do",json,function (data,textStatus) {
                if(data=="true"){
                    layer.msg('添加用户成功!',{icon:1})
                }
                else{
                    layer.msg('添加用户失败！',{icon:2})
                }
            })

            return false;
        });
        //确认密码失去焦点事件
        $("#pw2").blur(function () {
            //得到两个控件内容
            var pw1=$("#pw1").val();
            var pw2=$("#pw2").val();
            while(pw1!=pw2){
                layer.msg("两次密码不一样",{"icon":2,"time":2000});
                //将确认密码的输入框置空
                $("#pw2").val("");
                pw2 = $("#pw2").val();
                return false;
            }
            return true;
        })

        //当手机号失去焦点以后拿手机号去数据库查询看是否注册过
        $("#phone").blur(function () {
            //得到两个控件内容
            var phone=$("#phone").val();
            var json={'phone':phone};
            $.post("checkPhone.do",json,function (data,textStatus) {
                if(data=="true"){
                    layer.msg('对不起该手机号的用户已存在！',{icon:5});
                    $("#phone").val("");
                    return;
                }else {
                    return;
                }
            })
            return true;
        })

    });
</script>
</html>
