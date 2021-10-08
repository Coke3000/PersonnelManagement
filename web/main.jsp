<%--
  Created by IntelliJ IDEA.
  User: 99365
  Date: 2020/10/14
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页面</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
    <style>
        iframe{
            width: 100%;
            height: 585px;
            border: medium none;
        }
        .welcomeImg
        {
          /* background-image: url("./login_style/img/8.jpg");*/
            width: 100%;
            height: 585px;
          /*  background-size: 100% 585px;*/
        }
        .box1
        {
            width: 100%;
            height: 40px;
            background-color:white;
            opacity: 0.7;
            font:bold 25px '宋体';
            color:rgb(0,150,136);
            line-height: 40px;
            box-shadow: 3px 3px 8px #8D8D8D;
        }
        .box2
        {
            width:100%;
            height: 140px;
            margin-top: 10px;
            background-color:white;
            box-shadow: 3px 3px 8px #8D8D8D;
            text-align: center;
        }
        .box2 ul li{
            width: 165px;
            height: 100px;
            float: left;
            margin: 10px;
            text-align: center;
            background-color: white;
            color: black;
            box-shadow: 3px 3px 8px #8D8D8D;
            transition: all 0.5s ease;
        }
        .box2 ul li:hover{
            transform: translateY(-3px);
        }
        .box2 ul li h3{
            margin-top: 5px;
            font:bold 18px '宋体';
        }
        .box2 ul li p{
            margin-top: 20px;
            font:bold 35px '黑体';
            /*color: rgb(0,150,136);*/
            color: orangered;
        }
        .box3{
            float: left;
            width:60%;
            height: 350px;
            margin-top: 20px;
            background-color:white;
            box-shadow: 3px 3px 8px #8D8D8D;
        }
        .box4{
            float: right;
            width:39%;
            height: 350px;
            margin-top: 20px;
            background-color:white;
            box-shadow: 3px 3px 8px #8D8D8D;
            text-align: center;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font:bold 25px '楷体';padding-top:18px">五邑大学人事</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right" >
            <li class="layui-nav-item"><i class="layui-icon layui-icon-time"></i> <span id="ptime" ></span></li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="./login_style/img/7.jpg" class="layui-nav-img">
                    ${user.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="#" id="material">基本资料</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="logout.do" id="back">退出</a></li>
        <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
            <a href="javascript:;">
                <i class="layui-icon layui-icon-more-vertical"></i>
            </a>
        </li>
        </ul>

    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <div style="width: 100%">
                <div style="width:91%;text-align: center;color: white;background-color:rgb(0,150,136);font:18px bold">学校人事信息管理</div>
            </div>
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item ">
                    <a class="layui-icon" href="javascript:;">&#xe66f;&nbsp;&nbsp;用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" id="userQuery"><i class="layui-icon layui-icon-search"></i>&nbsp;用户查询</a></dd>
                        <dd><a href="javascript:;"id="addUser"><i class="layui-icon layui-icon-add-1"></i>&nbsp;添加用户</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="layui-icon" href="javascript:;">&#xe613;&nbsp;&nbsp;部门管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" id="deparmentQuery"><i class="layui-icon layui-icon-search"></i>&nbsp;部门查询</a></dd>
                        <dd><a href="javascript:;" id="addDeparment"><i class="layui-icon layui-icon-add-1"></i>&nbsp;添加部门</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="layui-icon" href="javascript:;">&#xe642;&nbsp;&nbsp;职位管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"id="postQuery"><i class="layui-icon layui-icon-search"></i>&nbsp;职位查询</a></dd>
                        <dd><a href="javascript:;"id="addPost"><i class="layui-icon layui-icon-add-1"></i>&nbsp;添加职位</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="layui-icon" href="javascript:;">&#xe63c;&nbsp;&nbsp;员工管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"id="staffQuery"><i class="layui-icon layui-icon-search"></i>&nbsp;员工查询</a></dd>
                        <dd><a href="javascript:;"id="addStaff"><i class="layui-icon layui-icon-add-1"></i>&nbsp;添加员工</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="layui-icon" href="javascript:;">&#xe630;&nbsp;&nbsp;角色管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"id="roleQuery"><i class="layui-icon layui-icon-search"></i>&nbsp;角色查询</a></dd>
                        <dd><a href="javascript:;"id="addRole"><i class="layui-icon layui-icon-add-1"></i>&nbsp;添加角色</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="layui-icon" href="javascript:;">&#xe667;&nbsp;&nbsp;公告管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"id="noticeQuery"><i class="layui-icon layui-icon-search"></i>&nbsp;公告查询</a></dd>
                        <dd><a href="javascript:;"id="addNotice"><i class="layui-icon layui-icon-add-1"></i>&nbsp;添加公告</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a class="layui-icon" href="javascript:;">&#xe66d;&nbsp;&nbsp;下载中心</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"id="fileUpload"><i class="layui-icon layui-icon-upload-drag"></i>&nbsp;文件上传</a></dd>
                        <dd><a href="javascript:;"id="fileDownload"><i class="layui-icon layui-icon-download-circle"></i>&nbsp;文件下载</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="margin-top: -5px" class="layui-tab layui-tab-card layui-tab-brief" lay-allowClose="true" lay-filter="demo">
            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="0">首页</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show welcomeImg" >
                <div class="box1">欢迎${user.username}登录五邑大学人事管理系统！</div>
                    <div class="box2">
                        <span style=" color:rgb(0,150,136);font:bold 20px '宋体';">-----------------------------------------------------综合统计---------------------------------------------------------------</span>
                        <ul>
                            <li>
                                <h3>用户数量:</h3>
                                <p>${counts.userCount}</p>
                            </li>
                            <li>
                                <h3>部门数量:</h3>
                                <p>${counts.deptCount}</p>
                            </li>
                            <li >
                                <h3>职位数量：</h3>
                                <p>${counts.jobCount}</p>
                            </li>
                            <li>
                                <h3>员工数量：</h3>
                                <p>${counts.employeeCount}</p>
                            </li>
                            <li >
                                <h3>角色数量：</h3>
                                <p>${counts.roleCount}</p>
                            </li>
                            <li >
                                <h3>公告数量:</h3>
                                <p>${counts.noticeCount}</p>
                            </li>
                            <li >
                                <h3>文件数量：</h3>
                                <p>${counts.uploadfileCount}</p>
                            </li>
                        </ul>
                    </div>
                    <div class="box4">
                        <span style=" color:rgb(0,150,136);font:bold 20px '宋体';">--------------------最新公告-------------------</span>
                        <table class="layui-hide" id="demo" lay-filter="test"></table>
                        <script type="text/html" id="barDemo">
                            <a class="layui-btn layui-btn-xs" lay-event="look">查看</a>
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


                                //执行一个 table 实例
                                table.render({
                                    elem: '#demo'
                                    ,width:500
                                    ,height:300
                                    ,url: 'selectByTop5Notice.do' //数据接口
                                    ,title: '最新公告'
                                    ,cols: [[
                                        {field:'id', title: 'ID', sort: true}
                                        ,{field:'name', title:'标题', width:"20%"}
                                        ,{field:'content', title:'内容',width:"55%"}
                                        ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"13%"}
                                    ]]
                                });

                                //监听行工具事件
                                table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                                    var data = obj.data //获得当前行数据
                                        ,layEvent = obj.event; //获得 lay-event 对应的值
                                    if(layEvent === 'look'){
                                        layer.alert("ID:&nbsp;&nbsp;"+data.id+"<br>名称:&nbsp;&nbsp"+data.name+"<br>标题:&nbsp;&nbsp"+data.title+"<br>内容:&nbsp;&nbsp"+data.content+"<br>发布者:&nbsp;&nbsp"+data.userid,{
                                            title:"内容："
                                        });
                                    }
                                });

                            });
                        </script>
                    </div>
<%--                    轮播图--%>
                    <div class="box3">
                    <div class="layui-carousel" id="test1">
                        <div carousel-item>
                            <div><img style="width: 100%;height:350px" src="./login_style/img/lunbo1.jpg" alt="图片不见了"></div>
                            <div><img style="width: 100%;height:350px" src="./login_style/img/lunbo2.jpg" alt="图片不见了"></div>
                            <div><img style="width: 100%;height:350px" src="./login_style/img/lunbo3.jpg" alt="图片不见了"></div>
                            <div><img style="width: 100%;height:350px" src="./login_style/img/lunbo4.jpg" alt="图片不见了"></div>
                        </div>
                    </div>
                    </div>
                    <script>
                        layui.use('carousel', function(){
                            var carousel = layui.carousel;
                            //建造实例
                            carousel.render({
                                elem: '#test1'
                                ,width: "100%" //设置容器宽度
                                ,height:"100%"
                                ,arrow: 'always' //始终显示箭头
                                //,anim: 'updown' //切换动画方式
                            });
                        });
                    </script>

                </div>
            </div>
        </div>
    </div>
<!--页脚-->
    <div class="layui-footer" style="text-align: center">
        <!-- 底部固定区域 -->
        @五邑大学网络工程180803班
    </div>
</div>
<script>
    mytime=setInterval(function () {//定义一个定时器
        getTime();
    },1000)
    function getTime(){
        //得到当前时间；
        var d=new Date();
        var M=(d.getMonth()+1)<10?('0'+(d.getMonth()+1)):(d.getMonth()+1);
        var D=d.getDate()<10?('0'+d.getDate()):(d.getDate());
        var H=d.getHours()<10?('0'+d.getHours()):(d.getHours());
        var m=d.getMinutes()<10?('0'+d.getMinutes()):(d.getMinutes());
        var s=d.getSeconds()<10?('0'+d.getSeconds()):(d.getSeconds());
        //将得到的值拼装起来
        var t=d.getFullYear()+"年"+M+"月"+D+"日&nbsp;&nbsp;&nbsp;&nbsp;"+H+"时"+m+"分"+s+"秒"+"&nbsp;&nbsp;星期"+"日一二三四五六".charAt(d.getDay());
        //得到控件
        var ptime=document.getElementById("ptime");
        ptime.innerHTML=t;
    }


    //JavaScript代码区域
    layui.use(['element', 'layer','jquery','util'],function(){
        var element = layui.element;
        var layer=layui.layer;
        var $=layui.jquery;
        var util=layui.util;

        util.event('lay-header-event', {
            //左侧菜单事件
            menuRight: function(){
                layer.open({
                    type: 1
                    ,title:"五邑大学简介"
                    ,content: '<div style="padding: 15px;text-align: center;line-height: 30px"><img src="./login_style/img/logo.png" alt="图片不见了" width="200px"></br>' +
                        '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;五邑大学是由广东省人民政府于1985年设立的以工科为主的多科性大学，是广东省较早获得硕士、学士学位授予权的地方高校，具有接收港澳台侨学生、国际学生资格和推荐优秀应届本科毕业生免试攻读研究生资格，现为广东省高水平理工科大学建设高校、博士学位授予立项建设单位。\n' +
                        '\n' +
                        '学校坚持践行“好学、多思、求实、创新”的校训，秉承“根植侨乡，服务社会，内外合力，特色发展”的办学理念，积极培养思想品德高尚、基础知识扎实，具有国际化视野、较强实践能力和创新创业能力，适应地方经济社会发展需求的高素质应用型人才。\n' +
                        '\n' +
                        '学校位于粤港澳大湾区重要节点城市、“中国第一侨乡”——广东省江门市，校园占地面积1000余亩，总建筑面积近70万平方米。环境优美，基础设施齐全，办学条件良好。学校面向全国24个省区市及港澳台地区招收本科学生，面向国内外招收研究生。现有各类在籍学生近2.4万人，其中全日制本科生近2万人，研究生800余人。\n' +
                        '\n' +
                        '学校设有19个教学机构，87个本科专业（方向），涉及工、理、经、管、文、法、艺术等7个学科门类，理工类专业（方向）占比67%。现有国家级一流本科专业建设点6个，国家级特色专业、国家级专业综合改革试点共5个；省级一流本科专业建设点9个，省级重点（名牌）专业、省级应用型人才培养示范专业等共39个。国家级大学生校外实践教育基地1个，省级大学生实践教学基地24个，省级示范性教师教育实践基地5个，省级实验教学示范中心14个。建有现代工业生产技术综合训练中心、生物科技与大健康学院实验中心、人工智能学习馆等一批实验实训基地。其中，“现代工业生产技术综合训练中心”是学校培养适应产业需求的现代技术创新型人才的重要基地，是融人才培养、科学研究、技术创新、企业服务、学生创新创业等功能于一体的示范性实训中心。学校人才培养质量得到社会广泛认可，本科生初次就业率多年位居全省公办本科高校前列。\n' +
                        '\n' +
                        '学校现有10个省级重点学科，7个一级学科硕士学位授权点、3个二级学科硕士学位授权点以及5个专业硕士授权类别，硕士授权覆盖学校所有理工科专业。\n' +
                        '\n' +
                        '学校现有专任教师1100余人。专任教师高级职称占比达40%，博士学位占比达51%；拥有国家级高层次人才31人（其中包括院士5人、长江学者5人、国家“杰青”4人、海外“杰青”1人、国家“优青”1人、国家“万人计划”入选者1人等），省级高层次人才22人，海外各类优秀人才67人。\n' +
                        '\n' +
                        '学校拥有省重点实验室1个，省级新型研发机构1个、省级工程技术研究中心7个、省级人文社科研究基地2个、省级非物质文化遗产研究基地1个、省级文艺评论基地1个、省级区域产业知识产权分析评议中心1个、市厅级科研平台58个。学校着力在生物医药、新材料、智能制造等领域构建了“粤港澳大湾区人类重大疾病大动物模型联合创新基地”“数字光芯片联合实验室”“江门市大健康国际创新研究院”“纺织新材料粤港联合实验室”“江门市海洋创新发展研究中心”等高水平创新平台，服务地方经济社会高质量发展。\n' +
                        '\n' +
                        '学校大力开展对外交流合作，先后与美国、英国、德国、澳大利亚、日本、葡萄牙、香港、澳门等18个国家及地区共60多所高校及科研机构建立了合作关系，在学科建设、人才培养、学术研究、师资培训等方面开展了实质性合作。其中，与美国罗格斯大学、美国罗德岛大学、澳大利亚伍伦贡大学、加拿大英属哥伦比亚大学、英国利物浦大学、英国利物浦热带医学院、香港理工大学、澳门大学等13所高水平大学或科研机构共建国（境）外研究生联合培养基地，与“一带一路”沿线国家和地区开展短期研修项目。\n' +
                        '\n' +
                        '新时代、新使命、新征程、新作为。五邑大学坚持以习近平新时代中国特色社会主义思想为指导，深入贯彻习近平总书记对广东重要讲话和重要指示批示精神，抢抓“双区”建设重大历史机遇，大力加强内涵建设，深入推动改革创新，不断促进高质量发展，为建设“应用型人才培养特色鲜明，服务地方产业发展能力突出”的高水平理工科大学而努力奋斗！\n' +
                        '\n' +
                        '发布部门：党政办公室\n' +
                        '更新时间：2021年5月\n</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });


        //点击基本资料展开页面
        $('#material').on('click', function() {
            layer.open({
                type:1,
                title: ['基本资料', 'font-size:20px;font-weight:bold'],
                area: ['400px', '320px'],
                shadeClose: false, //点击遮罩关闭
                content:'<div>\n' +
                    '    <table class="layui-table" lay-even="" lay-skin="row">\n' +
                    '        <colgroup>\n' +
                    '            <col width="150">\n' +
                    '            <col width="150">\n' +
                    '            <col width="200">\n' +
                    '            <col>\n' +
                    '        </colgroup>\n' +
                    '        <thead>\n' +
                    '        <tr>\n' +
                    '            <td>账号：</td>\n' +
                    '            <td>${user.id}</td>\n' +
                    '        </tr>\n' +
                    '        </thead>\n' +
                    '        <tbody>\n' +
                    '        <tr>\n' +
                    '            <td>密码：</td>\n' +
                    '            <td>${user.password}</td>\n' +
                    '        </tr>\n' +
                    '        <tr>\n' +
                    '            <td>角色ID：</td>\n' +
                    '            <td>${user.roleId}</td>\n' +
                    '        </tr>\n' +
                    '        <tr>\n' +
                    '            <td>手机号：</td>\n' +
                    '            <td>${user.phone}</td>\n' +
                    '        </tr>\n' +
                    '        <tr>\n' +
                    '            <td>注册时间：</td>\n' +
                    '            <td>${user.createdate}</td>\n' +
                    '        </tr>\n' +
                    '        <tr>\n' +
                    '            <td>用户名：</td>\n' +
                    '            <td>${user.username}</td>\n' +
                    '        </tr>\n' +
                    '        </tbody>\n' +
                    '    </table>\n' +
                    '</div>',
            });
        })
        //添加按钮的点击事件
        $("#userQuery").click(function () {
          //调用addTabs函数
            addTabs('1','demo','<i class="layui-icon layui-icon-search"></i>&nbsp;用户查询','<iframe src="userlist.jsp"></iframe>')
        });
        $("#addUser").click(function () {
            //调用addTabs函数
            addTabs('2','demo','<i class="layui-icon layui-icon-add-1"></i>&nbsp;添加用户','<iframe src="adduser.jsp"></iframe>')
        });
        $("#deparmentQuery").click(function () {
            //调用addTabs函数
            addTabs('3','demo','<i class="layui-icon layui-icon-search"></i>&nbsp;部门查询','<iframe src="department.jsp"></iframe>')
        });
        $("#addDeparment").click(function () {
            //调用addTabs函数
            addTabs('4','demo','<i class="layui-icon layui-icon-add-1"></i>&nbsp;添加部门','<iframe src="addDept.jsp"></iframe>')
        });
        $("#postQuery").click(function () {
            //调用addTabs函数
            addTabs('5','demo','<i class="layui-icon layui-icon-search"></i>&nbsp;职位查询','<iframe src="job.jsp"></iframe>')
        });
        $("#addPost").click(function () {
            //调用addTabs函数
            addTabs('6','demo','<i class="layui-icon layui-icon-add-1"></i>&nbsp;添加职位','<iframe src="addJob.jsp"></iframe>')
        });
        $("#staffQuery").click(function () {
            //调用addTabs函数
            addTabs('7','demo','<i class="layui-icon layui-icon-search"></i>&nbsp;员工查询','<iframe src="employee.jsp"></iframe>')
        });
        $("#addStaff").click(function () {
            //调用addTabs函数
            addTabs('8','demo','<i class="layui-icon layui-icon-add-1"></i>&nbsp;添加员工','<iframe src="addEmployee.jsp"></iframe>')
        });
        $("#roleQuery").click(function () {
            //调用addTabs函数
            addTabs('9','demo','<i class="layui-icon layui-icon-search"></i>&nbsp;角色查询','<iframe src="role.jsp"></iframe>')
        });
        $("#addRole").click(function () {
            //调用addTabs函数
            addTabs('10','demo','<i class="layui-icon layui-icon-add-1"></i>&nbsp;添加角色','<iframe src="addRole.jsp"></iframe>')
        });
        $("#noticeQuery").click(function () {
            //调用addTabs函数
            addTabs('11','demo','<i class="layui-icon layui-icon-search"></i>&nbsp;公告查询','<iframe src="notice.jsp"></iframe>')
        });
        $("#addNotice").click(function () {
            //调用addTabs函数
            addTabs('12','demo','<i class="layui-icon layui-icon-add-1"></i>&nbsp;添加公告','<iframe src="addNotice.jsp"></iframe>')
        });
        $("#fileUpload").click(function () {
            //调用addTabs函数
            addTabs('13','demo','<i class="layui-icon layui-icon-upload-drag"></i>&nbsp;文件上传','<iframe src="uploadFile.jsp"></iframe>')
        });
        $("#fileDownload").click(function () {
            //调用addTabs函数
            addTabs('14','demo','<i class="layui-icon layui-icon-download-circle"></i>&nbsp;文件下载','<iframe src="download.jsp"></iframe>')
        });


        //封装一个函数，用来添加tab
        function addTabs(layId,tabName,title,content) {
            var isData=false;//定义一个标志位，用来记录tab是否存在
            //循环输出tab的id
            $.each($(".layui-tab-title li[lay-id]"),function () {
                 var id=$(this).attr("lay-id");
                 //判断要添加的id是否存在
                if(id==layId){
                    isData=true;//修改标志位
                }
            })
            //判断标志位的值
            if(isData==false)
            {
                element.tabAdd(tabName,{
                    title:title,
                    content:content,//支持传入html
                    id:layId
                });
            }
            //添加完成后同时要选中
            element.tabChange(tabName,layId);
        }
    });
</script>
</body>
</html>
