<%@ page contentType="text/html; charset=utf-8"%>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>账户设置</title>
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="http://cdn.bootcss.com/echarts/3.3.2/echarts.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>

</head>

<body data-type="widgets">
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
       <!-- 头部 -->
		<header>
				<!-- logo -->
				<div class="am-fl tpl-header-logo">
					<img src="${pageContext.request.contextPath }/assets/img/shentie.png" alt="" style="height:55px ;width: 55px;margin-left:-10px ;">
					<h3 style="display: inline;font: '楷体';">什贴中学教学评价系统</h3>
				</div>
			<!-- 右侧内容 -->
			<div class="tpl-header-fluid">
				<!-- 侧边切换 -->
				<div class="am-fl tpl-header-switch-button am-icon-list"
					style="padding-top: 20px; padding-bottom: 10px">
					<span> </span>
				</div>

				<!-- 其它功能-->
				<div class="am-fr tpl-header-navbar">
					<ul>
						<!-- 欢迎语 -->
						<li class="am-text-sm tpl-header-navbar-welcome"><a
							href="javascript:;">欢迎您, <span>${session._user_name }</span>
						</a></li>



						<!-- 退出 -->
						<li class="am-text-sm"><a href="${pageContext.request.contextPath}/loginAction_logout"> <span
								class="am-icon-sign-out"></span> 退出
						</a></li>
					</ul>
				</div>
			</div>

        </header>
        <!-- 侧边导航栏 -->
        <div class="left-sidebar">
            <!-- 用户信息 -->
            <div class="tpl-sidebar-user-panel">
                <div class="tpl-user-panel-slide-toggleable">
                    <!-- <div class="tpl-user-panel-profile-picture">
                        <img src="assets/img/user04.png" alt="">
                    </div> -->
                    <span class="user-panel-logged-in-text">
              <i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i>
             	${session._user_name }
          </span>
          <div id="nowClock"></div>
          
          <script type="text/javascript">
          	document.getElementById("nowClock").onload = function(){disptime()};
          	function disptime(){
          		//获取当前时间
          		var today = new Date();
          		//获取时分秒
          		var hh = today.getHours();
          		if(hh >=0 && hh < 10){
          			hh = "0" + hh;
          		}
          		var mm = today.getMinutes();
          		if(mm >=0 && mm < 10){
          			mm = "0" + mm;
          		}
          		var ss = today.getSeconds();
          		if(ss >=0 && ss < 10){
          			ss = "0" + ss;
          		}
          		//设置div的内容为当前时间
          		document.getElementById("nowClock").innerHTML = 
          			"<h2>"+hh+":"+mm+":"+ss+"</h2>";
          	}
          	setInterval("disptime()",1000);
          </script>
                    <a href="${pageContext.request.contextPath }/manage/userAction_toUserSetting" class="tpl-user-panel-action-link"> <span class="am-icon-pencil"></span> 账号设置</a>
                </div>
            </div>

            <!-- 菜单 -->
            <ul class="sidebar-nav">
            
	
				<li class="sidebar-nav-link">
                    <a href="${pageContext.request.contextPath }/pageAction_toIndex" >
                        <i class="am-icon-home sidebar-nav-link-logo"></i> 首页
                    </a>
                </li>
            </ul>
        </div>

        <!-- 内容区域 -->
		<div class="tpl-content-wrapper">
			<div class="row-content am-cf">
				<div class="row">
					<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
						<div class="widget am-cf">
								
								
								<form class="am-form" data-am-validator action="userAction_saveUser"  method="post">
								  <fieldset>
									  <legend>密码修改</legend>
									  <div class="am-form-group">
									    <label for="password">密码：</label>
									    <input type="password" id="password" name="password" placeholder="请输入6位以上的密码" pattern="^\d{6}$" required/>
									  </div>
									
									  <div class="am-form-group">
									    <label for="repsword">确认密码：</label>
									    <input type="password" id="repsword" name="repsword" placeholder="请与上面输入的值一致" data-equal-to="#password" required/>
									  </div>
									
									  <input id="sub" type="button" name="Submit" value="提交" class="am-btn am-btn-secondary" >
									</fieldset>
								</form>
								<script>
								(function(){
								    var sub = document.getElementById("sub");
								    //初始化移入移出事件
								    if(sub.addEventListener){
								        sub.addEventListener("click", test);  
								    }else if(sub.attachEvent){
								        sub.attachEvent("onClick", test);
								    }
								})();
								 
								function test(){
								    var password = document.getElementById("password");
								    var passwordConfirm = document.getElementById("repsword");
								    if(password.value.length < 6)
								    	alert("请输入六位以上的密码")
								    else if(password.value != passwordConfirm.value)
								        alert("对不起，您2次输入的密码不一致");
								    else
								    document.forms[0].submit();
								     
								}
								</script>
								</div>
				</div>
			</div>
		</div>
	</div>
	</div>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/amazeui.datatables.min.js"></script>
    <script src="assets/js/dataTables.responsive.min.js"></script>
    <script src="assets/js/app.js"></script>

</body>

</html>