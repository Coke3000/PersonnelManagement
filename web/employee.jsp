<%--
  Created by IntelliJ IDEA.
  User: 99365
  Date: 2020/10/21
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工管理</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body>
<div id="div1" style="display: none">
    <form class="layui-form layui-form-pane" action="" style="padding-top: 20px;padding-left:16px;margin-right: 20px">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label "><li class="layui-icon layui-icon-group ">&nbsp;部门id:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="deptId" name="deptId" required   placeholder="请输入部门id" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label  "><li class="layui-icon layui-icon-edit">&nbsp;职位id</li></label>
                <div class="layui-input-inline">
                    <input id="jobId" type="text" name="jobId"  placeholder="请输入职位id" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label "><li class="layui-icon layui-icon-username">&nbsp;姓名:</li></label>
                <div class="layui-input-inline">
                    <input type="name" id="name" name="name"  placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-rate">&nbsp;身份证:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="cardId" name="cardId"  placeholder="请输入身份证" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-location">&nbsp;地址:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="address" name="address"  placeholder="请输入地址 " autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-cols">&nbsp;邮政编码:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="postCode" name="postCode"  placeholder="请输入邮政编码" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-service">&nbsp;固定电话号码</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="tel" name="tel"  placeholder="请输入固定电话号码" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-cellphone">&nbsp;手机号码:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone"  placeholder="请输入手机号码" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-login-qq">&nbsp;QQ:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="qqNum" name="qqNum"  placeholder="请输入qq" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-email">&nbsp;邮箱:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="email" name="email"  placeholder="请输入身份证" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-male">&nbsp;性别:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="sex" name="sex"  placeholder="请输入性别" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-user">&nbsp;群众面貌:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="party" name="party"  placeholder="请输入群众面貌" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-face-smile">&nbsp;生日:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="birthday" name="birthday"  placeholder="请输入生日" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-tree">&nbsp;民族:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="race" name="race"  placeholder="请输入民族" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-template-1">&nbsp;学历:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="education" name="education"  placeholder="请输入学历" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><li class="layui-icon layui-icon-note">&nbsp;专业:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="speciality" name="speciality"  placeholder="请输入专业" autocomplete="off" class="layui-input">
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
    </form>
</div>

<%--搜索--%>
<div class="demoTable">
    员工ID：
    <div class="layui-inline">
        <input class="layui-input" name="id2" id="id2" placeholder="请输入" autocomplete="off">
    </div>
    部门ID：
    <div class="layui-inline">
        <input class="layui-input" name="deptId2" id="deptId2" placeholder="请输入" autocomplete="off">
    </div>
    职位ID：
    <div class="layui-inline">
        <input class="layui-input" name="jobId2" id="jobId2" placeholder="请输入" autocomplete="off">
    </div>
    姓名：
    <div class="layui-inline">
        <input class="layui-input" name="name2" id="name2" placeholder="请输入" autocomplete="off">
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
            ,url: 'FindEmployee.do' //数据接口
            ,title: '用户表'
            ,id:"testReload"
            ,page: true //开启分页
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'员工id', width:"10%", fixed: 'left', unresize: true, sort: true}
                ,{field:'deptId', title:'部门id', width:"10%"}
                ,{field:'jobId', title:'职位id', width:"10%"}
                ,{field:'name', title:'姓名', width:"15%"}
                ,{field:'cardId', title:'身份证',width:"15%"}
                ,{field:'address', title:'地址', width:"20%"}
                ,{field:'postCode', title:'邮政编码', width:"10%"}
                ,{field:'tel', title:'固定电话号码', width:"15%"}
                ,{field:'phone', title:'手机号码', width:"15%"}
                ,{field:'qqNum', title:'QQ', width:"15%"}
                ,{field:'email', title:'邮箱', width:"15%"}
                ,{field:'sex', title:'性别', width:"10%",templet: "#sexText"}
                ,{field:'party', title:'群众面貌', width:"15%"}
                ,{field:'birthday', title:'生日', width:"15%",templet:"<div>{{layui.util.toDateString(d.birthday, 'yyyy-MM-dd')}}</div>"}
                ,{field:'race', title:'民族', width:"10%"}
                ,{field:'education', title:'学历', width:"15%"}
                ,{field:'speciality', title:'专业', width:"15%"}
                ,{field:'hobby', title:'爱好', width:"15%"}
                ,{field:'remark', title:'备注', width:"15%"}
                ,{field:'createDate', title:'创建日期', width:"15%",templet:"<div>{{layui.util.toDateString(d.createDate, 'yyyy-MM-dd')}}</div>"}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"10%"}
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
                        //如果生日没有改变
                        if(birthday1==data.birthday)
                        {
                            var birthdayStr=birthday1;
                        }else {
                            //如果生日发生改变则变为时间戳
                            var birthdayStr=new Date(birthday1).getTime();
                        }
                        var race=$("#race").val();
                        var education=$("#education").val();
                        var speciality=$("#speciality").val();
                        var hobby=$("#hobby").val();
                        var remark=$("#remark").val();
                        var json={'id':data.id,'deptId':deptId,'jobId':jobId,'name':name,'cardId':cardId,'address':address,'postCode':postCode,'tel':tel,'phone':phone,'qqNum':qqNum,'email':email,'sex':sex,'party':party,'birthdayStr':birthdayStr,'race':race,'education':education,'speciality':speciality,'hobby':hobby,'remark':remark};
                        $.post('UpdateEmployee.do',json,function (data2,textStatus){
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

                $("#deptId").val(data.deptId);
                $("#jobId").val(data.jobId);
                $("#name").val(data.name);
                $("#cardId").val(data.cardId);
                $("#address").val(data.address);
                $("#postCode").val(data.postCode);
                $("#tel").val(data.tel);
                $("#phone").val(data.phone);
                $("#qqNum").val(data.qqNum);
                $("#email").val(data.email);
                $("#sex").val(data.sex);
                $("#party").val(data.party);
                $("#birthday").val(data.birthday);
                $("#race").val(data.race);
                $("#education").val(data.education);
                $("#speciality").val(data.speciality);
                $("#hobby").val(data.hobby);
                $("#remark").val(data.remark);




            } else if(layEvent === 'del'){
                layer.confirm('真的删除ID为：'+data.id+'的员工吗？', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    //ajax操作
                    var json={'id':data.id};
                    $.post('DeleteEmployee.do',json,function (data1,textStatus) {
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
                    url:"SearchEmployee.do"
                    ,where: {
                        id:$("#id2").val(),
                        deptId:$("#deptId2").val(),
                        jobId:$("#jobId2").val(),
                        name:$("#name2").val()
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
<script type="text/html" id="sexText">
    {{#  if(d.sex==1){ }}
    男
    {{#  } else{}}
    女
    {{# } }}
</script>
</body>
</html>
