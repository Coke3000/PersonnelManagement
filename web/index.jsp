<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  <style type="text/css"></style>
  <!-- CSS:写前端，如果不是专业的，那就用框架，我们这个项目用了：easyUI框架，其他框架还有：bootstrap -->
  <link rel="stylesheet" href="login_style/css/supersized.css">
  <link rel="stylesheet" href="./layui/css/layui.css">
  <link rel="stylesheet" href="./layui/css/mystyle.css">
  <script src="./layui/layui.js"></script>
</head>
<body>
<div class="wrapper .clearfix"style="position:relative;text-align: center">
  <img class="leftimg"src="./login_style/img/5.jpg" alt="图片没有了">
  <form class="layui-form layui-form-pane "  style="position: absolute;right:0;">
    <span class="land">欢迎登录-人事管理系统</span>
    <div class="layui-form-item ">
      <div class="layui-inline" >
        <label class="layui-form-label"><li class="layui-icon" >&#xe66f</li>账号</label>
        <div class="layui-input-inline" >
          <input id="username" name="username" class="layui-input" lay-verify="required" type="text" placeholder="请输入账号/手机号" autocomplete="off">
        </div>
      </div>
    </div>
    <div class="layui-form-item" >
      <div class="layui-inline" >
        <label class="layui-form-label"><li class="layui-icon" >&#xe683</li>密码</label>
        <div class="layui-input-inline">
          <input id="password" name="password" class="layui-input" type="password" placeholder="请输入密码"autocomplete="off" lay-verify="required">
        </div>
      </div>
    </div>
    <div class="layui-form-item"  >
      <div class="layui-inline">
        <label class="layui-form-label"><li class="layui-icon" >&#xe672</li>验证码</label>
        <div class="layui-input-inline">
          <input id="checkcode" name="checkcode" class="layui-input" type="text" placeholder="请输入验证码" autocomplete="off" lay-verify="required">
        </div>
      </div>
      <div class="layui-form-item"  >
        <img style="height: 35px;width: 100px" id="codeImage" src="CheckCodeUtil" alt="图片没有了">
      </div>
    </div>
    <div class="layui-form-item" style="position:relative;width: 100%" >
      <button  style="position:absolute;left:20px;bottom:-30px;width: 120px" class="layui-btn" lay-filter="formDemo" lay-submit="">登录</button>
    </div>
  </form>
  <button id="test2" style="position:absolute;right:30px;bottom:11px;width: 120px" class="layui-btn">注册</button>
</div>


<!-- Javascript -->
<script src="login_style/js/jquery-1.8.2.min.js"></script>
<script src="login_style/js/supersized.3.2.7.min.js"></script>
<script src="login_style/js/supersized-init.js"></script>

</body>
<script>
  //javascript代码区
  layui.use(['element','layer','jquery','form'],function () {
    var element=layui.element
    var $=layui.jquery;
    var layer=layui.layer;
    var form = layui.form;
    $('#test2').on('click', function(){
      layer.open({
        type: 2,
        title: ['人事注册信息表', 'font-size:20px;font-weight:bold'],
        area: ['750px', '770px'],
        shadeClose: false, //点击遮罩关闭
        content:'registry.jsp',
      });
    });
    var img=$("#codeImage");
    img.click(function () {
      var time=new Date().getTime();
      img.attr({src:"CheckCodeUtil?"+time})
    });
    //form表单的监听事件
    form.on('submit(formDemo)', function(data){
      //用ajax请求，用post方法
      //第一个参数：要提交的地址
      //第二个参数：要提交过去的数据，要是JSON格式
      //第三个参数：执行的函数，返回的data，返回的状态码

      //获得username,password,checkcode的内容
      var username=$("#username").val();
      var password=$("#password").val();
      var checkcode=$("#checkcode").val();
      var json={'username':username,'password':password,'checkcode':checkcode};
      $.post("login.do",json,function (data,textStatus) {
        if(data=="1"){
          layer.msg('对不起验证码错误',{icon:5});
          return
        }
        if(data=="2"){
          layer.msg("对不起，用户名或密码错误！",{icon:5})
          return;
        }
        if(data=="3"){
          window.location.href='http://localhost:8080/PersonnelManagement/main.jsp';
          return;
        }
      })
      //	layer.msg(JSON.stringify(data.field));
      return false;
    });
  });
</script>

</html>