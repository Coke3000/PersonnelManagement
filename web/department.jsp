<%--
  Created by IntelliJ IDEA.
  User: 99365
  Date: 2020/10/20
  Time: 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>部门查询</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body>
<div id="div1" style="display: none">
    <form class="layui-form layui-form-pane" action="" style="padding-top: 20px;padding-left:16px;margin-right: 20px">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label "><li class="layui-icon layui-icon-username ">&nbsp;部门:</li></label>
                <div class="layui-input-inline">
                    <input type="text" id="dname" name="dname" required  lay-verify="required|dnames"  autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label "><li class="layui-icon layui-icon-align-left">&nbsp;备注:</li></label>
            <div class="layui-input-block">
                <textarea id="dremark"  class="layui-textarea" name="dremark"></textarea>
            </div>
        </div>
    </form>
</div>

<%--搜索--%>
<div class="demoTable">
    部门ID：
    <div class="layui-inline">
        <input class="layui-input" name="did2" id="did2" placeholder="请输入" autocomplete="off">
    </div>
    部门名字：
    <div class="layui-inline">
        <input class="layui-input" name="dname2" id="dname2" placeholder="请输入" autocomplete="off">
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
            ,height:525
            ,url: 'FindDept.do' //数据接口
            ,title: '部门表'
            ,page: true //开启分页
            ,id: 'testReload'
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'did', title:'部门ID', width:'25%', fixed: 'left', unresize: true, sort: true}
                ,{field:'dname', title:'名字', width:'25%'}
                ,{field:'dremark', title:'备注', width:'25%'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:'25%'}
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
                        var dname=$("#dname").val();
                        var dremark=$("#dremark").val();
                        var json={'did':data.did,'dname':dname,'dremark':dremark};
                        $.post('UpdateDept.do',json,function (data2,textStatus){
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
                $("#dname").val(data.dname);
                $("#dremark").val(data.dremark);
            } else if(layEvent === 'del'){
                layer.confirm('真的要删除'+data.dname+"吗？", function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    //ajax操作
                    var json={'did':data.did};
                    $.post('DeleteDept.do',json,function (data1,textStatus) {
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


// 搜说框
        var $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    url:"SearchDept.do"
                    ,where: {
                        did:$("#did2").val(),
                        dname:$("#dname2").val()
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
</body>
</html>

</body>
</html>
