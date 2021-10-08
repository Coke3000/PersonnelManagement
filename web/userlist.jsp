<%--
  Created by IntelliJ IDEA.
  User: 99365
  Date: 2020/10/15
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body>
<div id="div1" style="display: none">
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
                <label class="layui-form-label "><li class="layui-icon layui-icon-cellphone">&nbsp;手机号:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" required  lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-group">&nbsp;角色:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="roleId" name="roleId" required  lay-verify="required|usernames" placeholder="请输入角色id" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label "><li class="layui-icon layui-icon-align-left">&nbsp;备注:</li></label>
            <div class="layui-input-block">
                <textarea id="remark"  class="layui-textarea" name="remark"></textarea>
            </div>
        </div>
    </form>
</div>
<%--搜索--%>

<div class="demoTable">
    账号：
    <div class="layui-inline">
        <input class="layui-input" name="id" id="id2" placeholder="请输入" autocomplete="off">
    </div>
    手机：
    <div class="layui-inline">
        <input class="layui-input" name="phone" id="phone2" placeholder="请输入" autocomplete="off">
    </div>
    昵称：
    <div class="layui-inline">
        <input class="layui-input" name="username" id="username2" placeholder="请输入" autocomplete="off">
    </div>
    角色ID：
    <div class="layui-inline">
        <input class="layui-input" name="roleId" id="roleId2" placeholder="请输入" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>


<table class="layui-hide" id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.config({
        version: '1598935358933' //为了更新 js 缓存，可忽略
    });

    layui.use(['jquery','laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
        var laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element //元素操作
            ,$=layui.jquery;


        //监听Tab切换
        element.on('tab(demo)', function(data){
            layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
                tips: 1
            });
        });

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 525
            ,url: 'FindUser.do' //数据接口
            ,title: '用户表'
            ,id: 'testReload'
            ,page: true //开启分页
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'账号', width:170, fixed: 'left', unresize: true, sort: true}
                ,{field:'username', title:'呢称', width:150}
                ,{field:'password', title:'密码', width:170}
                ,{field:'phone', title:'手机号', width:170}
                ,{field:'roleId', title:'角色',width:150,templet: "#roleText"}
                ,{field:'createdate', title:'注册时间', width:170,templet:"<div>{{layui.util.toDateString(d.createdate, 'yyyy-MM-dd')}}</div>"}
                ,{field:'remark', title:'备注', width:170}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
        });

        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    layer.msg('添加');
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.msg('删除');
                    }
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'edit'){
                layer.open({
                    type: 1,
                    title: ['修改信息', 'font-size:20px;font-weight:bold'],
                    area: ['500px', '400px'],
                    shadeClose: false, //点击遮罩关闭
                    content:$("#div1"),
                    btn:['提交']
                    ,btn1:function (index,layero) {
                        //.....ajax操作
                        var username=$("#username").val();
                        var password=$("#pw1").val();
                        var phone=$("#phone").val();
                        var roleId=$("#roleId").val();
                        var remark=$("#remark").val();
                        var json={'Id':data.id,'username':username,'password':password,'phone':phone,'roleId':roleId,'remark':remark};
                        $.post('UpdateUser.do',json,function (data2,textStatus){
                            if(data2=="true"){
                                layer.msg('修改成功!',{icon:1})
                            }
                            else{
                                layer.msg('修改失败！',{icon:2})
                            }

                        })
                    },
                    cancel:function (layero,index) {
                       layer.closeAll();
                    },
                    anim:0,
                });
                $("#username").val(data.username);
                $("#pw1").val(data.password);
                $("#phone").val(data.phone);
                $("#roleId").val(data.roleId);
                $("#remark").val(data.remark);
            } else if(layEvent === 'del'){
                layer.confirm('真的删除账号是：'+data.id+"的用户吗？", function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    //ajax操作
                    var json={'id':data.id};
                    $.post('DeleteUser.do',json,function (data1,textStatus) {
                         if(data1=="true")
                         {
                             layer.msg("删除成功！",{icon:1})
                         }
                         else {
                             layer.msg("删除失败！",{icon:2})
                         }
                    })
                });
            }
        });

        //分页
        laypage.render({
            elem: 'pageDemo' //分页容器的id
            ,count: 100 //总页数
            ,skin: '#1E9FFF' //自定义选中色值
            //,skip: true //开启跳页
            ,jump: function(obj, first){
                if(!first){
                    layer.msg('第'+ obj.curr +'页', {offset: 'b'});
                }
            }
        });

    // 搜索框
        var $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                     url:"SearchUser.do"
                    ,where: {
                            id:$("#id2").val(),
                            username:$("#username2").val(),
                            phone:$("#phone2").val(),
                            roleId:$("#roleId2").val()
                    }
                });
            }
        };
        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });



    });
</script>

<%-- roleid模板--%>
<script type="text/html" id="roleText">
    {{#  if(d.roleId==1){ }}
    普通员工
    {{#  } else if(d.roleId==2){ }}
    管理员
    {{#  } else{}}
    超级管理员
    {{# } }}
</script>
</body>
</html>
