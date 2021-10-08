<%--
  Created by IntelliJ IDEA.
  User: 99365
  Date: 2021/7/5
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>下载文件</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body>
<table class="layui-hide" id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">下载</a>
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
            ,url: 'selectDownload.do' //数据接口
            ,title: '用户表'
            ,id: 'testReload'
            ,page: true //开启分页
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'filename', title:'文件名', width:'60%'}
                ,{field:'userid', title:'上传人id', width:"10%"}
                ,{field:'uploaddate', title:'上传时间', width:'20%',templet:"<div>{{layui.util.toDateString(d.uploaddate, 'yyyy-MM-dd')}}</div>"}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:'10%'}
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
              //修改a连接的herf属性，让其可以跳转到下载控制器
                $(this).attr("href","${pageContext.request.contextPath}/download.do?filename="+data.filename);
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

</body>
</html>
