<%--
  Created by IntelliJ IDEA.
  User: 99365
  Date: 2021/7/3
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加员工</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body>
<div>
    <form class="layui-form layui-form-pane" action="" style="padding-top: 20px;padding-left:16px;margin-right: 20px">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label "><li class="layui-icon layui-icon-group ">&nbsp;部门id:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="deptId" name="deptId" lay-verify="required"   placeholder="请输入部门id" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label  "><li class="layui-icon layui-icon-edit">&nbsp;职位id:</li></label>
                <div class="layui-input-inline">
                    <input id="jobId" type="text" name="jobId" lay-verify="required" placeholder="请输入职位id" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label "><li class="layui-icon layui-icon-username">&nbsp;姓名:</li></label>
                <div class="layui-input-inline">
                    <input type="name" id="name" name="name" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-rate">&nbsp;身份证:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="cardId" name="cardId" lay-verify="required"  placeholder="请输入身份证" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-location">&nbsp;地址:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="address" name="address" lay-verify="required"  placeholder="请输入地址 " autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-cols">&nbsp;邮政编码:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="postCode" name="postCode" lay-verify="required"  placeholder="请输入邮政编码" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-service">固定电话:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="tel" name="tel"  placeholder="请输入固定电话号码" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-cellphone">&nbsp;手机号码:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" lay-verify="required"  placeholder="请输入手机号码" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-login-qq">&nbsp;QQ:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="qqNum" name="qqNum" lay-verify="required"  placeholder="请输入qq" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-email">&nbsp;邮箱:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="email" name="email" lay-verify="required"  placeholder="请输入身份证" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-male">&nbsp;性别:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="sex" name="sex"  lay-verify="required" placeholder="请输入性别" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-user">&nbsp;群众面貌:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="party" name="party" lay-verify="required"  placeholder="请输入群众面貌" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-face-smile">&nbsp;生日:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="birthday" name="birthday" lay-verify="required"  placeholder="请输入生日" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-tree">&nbsp;民族:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="race" name="race" lay-verify="required" placeholder="请输入民族" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-template-1">&nbsp;学历:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="education" name="education" lay-verify="required" placeholder="请输入学历" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-note">&nbsp;专业:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="speciality" name="speciality" lay-verify="required" placeholder="请输入专业" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-heart">&nbsp;爱好:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="hobby" name="hobby"  placeholder="请输入爱好" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label "><li class="layui-icon layui-icon-align-left">&nbsp;备注:</li></label>
            <div class="layui-input-block">
                <textarea id="remark"  class="layui-textarea" name="remark"></textarea>
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
        // form.verify({
        //     pass:[/^[0-9a-zA-Z_]{6,12}$/,'密码必须要是6-12位'],
        //     usernames:[/^[\u4e00-\u9fa5]{2,6}$/,'用户名必须是中文，且2-6位 ']
        // });

        //监听提交
        form.on('submit(formDemo)', function(data){
            var deptId=$("#deptId").val();
            var jobId=$("#jobId").val();
            var name=$("#name").val();
            var cardId=$("#cardId").val();
            var address=$("#address").val();
            var postCode=$("#postCode").val();
            var tel=$("#tel").val();
            var phone=$("#phone").val();
            var qqNum=$("#qqNum").val();
            var email=$("#email").val();
            var sex=$("#sex").val();
            var party=$("#party").val();
            var birthday1=$("#birthday").val();
            //生日变为时间戳
            var birthdayStr=new Date(birthday1).getTime();
            var race=$("#race").val();
            var education=$("#education").val();
            var speciality=$("#speciality").val();
            var hobby=$("#hobby").val();
            var remark=$("#remark").val();
            var json={'id':data.id,'deptId':deptId,'jobId':jobId,'name':name,'cardId':cardId,'address':address,'postCode':postCode,'tel':tel,'phone':phone,'qqNum':qqNum,'email':email,'sex':sex,'party':party,'birthdayStr':birthdayStr,'race':race,'education':education,'speciality':speciality,'hobby':hobby,'remark':remark};
            $.post("AddEmployee.do",json,function (data,textStatus) {
                console.log(data);
                if(data=="true"){
                    layer.msg('添加员工成功!',{icon:1,offset:["200px","300px"]})
                }
                else{
                    layer.msg('添加员工失败！',{icon:2,offset:["200px","300px"]})
                }
            })

            return false;
        });
    });
</script>
</html>
