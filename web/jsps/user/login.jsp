<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

  <title>登录</title>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <meta http-equiv="content-type" content="text/html;charset=utf-8">
  <!--
  <link rel="stylesheet" type="text/css" href="styles.css">
  -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>">
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://www.bootcss.com/p/buttons/css/buttons.css">

  <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="<c:url value='/js/login.js'/>"></script>

  <script type="text/javascript">
      $(function() {/*Map<String(Cookie名称),Cookie(Cookie本身)>*/
          // 获取cookie中的用户名
          var username = window.decodeURI("${cookie.username.value}");
          if("${requestScope.user.username}") {
              username = "${requestScope.user.username}";
          }
          $("#username").val(username);
      });
  </script>
</head>

<body>
<div class="navbar navbar-default" role="navigation">
  <div class="container">
    <div class="navbar-header">
      　<!-- .navbar-toggle样式用于toggle收缩的内容，即nav-collapse collapse样式所在元素 -->
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-responsive-collapse">
        <span class="sr-only">Toggle Navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- 确保无论是宽屏还是窄屏，navbar-brand都显示 -->
      <a href="welcome.jsp" class="navbar-brand">SHIFU</a>
    </div>
    <!-- 屏幕宽度小于768px时，div.navbar-responsive-collapse容器里的内容都会隐藏，显示icon-bar图标，当点击icon-bar图标时，再展开。屏幕大于768px时，默认显示。 -->
    <!--<div class="collapse navbar-collapse navbar-responsive-collapse">
      <ul class="nav navbar-nav">
        <li><a href="##">网站首页</a></li>
        <li><a href="##">系列教程</a></li>
        <li><a href="##">名师介绍</a></li>
        <li><a href="##">成功案例</a></li>
        <li><a href="##">关于我们</a></li>
      </ul>
    </div>-->
  </div>
</div>

<div class="row">
  <div class="col-md-4"></div>
  <div class="col-md-4">
    <div class="panel panel-default">
      <div class="panel-heading">
        <span class="loginTop">Sign in</span>
        <div class="text-muted">Need an account? Then please <a href="regist.jsp" target="_self">sign up</a>.</div>
      </div>
      <span>
                <a href="<c:url value='/jsps/user/regist.jsp'/>" class="registBtn"></a><!--?-->
        </span>
      <div class="panel-body">
        <form class="form-horizontal" role="form" target="_top" action="<c:url value='/LoginServlet'/>" method="post" id="loginForm">
          <input type="hidden" name="method" value="login" />
          <label class="errorClass text-danger" id="msg">${msg }</label>
          <div class="form-group">
            <lable class="col-sm-2 control-lable" for="username"></lable>
            <div class="col-sm-8">
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </span>
                    <input class="form-control input" placeholder="username" type="text" name="username" id="username" value="${user.username }"/>
                </div>
                <label id="usernameError" class="errorClass text-danger"></label>
            </div>
          </div>
          <div class="form-group">
            <lable class="col-sm-2 control-lable" for="password"></lable>
            <div class="col-sm-8">
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-eye-open"></span></span>
                    <input class="form-control input" placeholder="password" type="password" name="password" id="password" value="${user.password }"/>
                </div>
              <label id="passwordError" class="errorClass text-danger"></label>
            </div>
          </div>
          <div class="form-group">
            <lable class="col-sm-2 control-lable" for="verifyCode"></lable>
            <div class="col-sm-4">
              <input class="form-control input" type="text" placeholder="captcha" name="verifyCode" id="verifyCode" value="${user.verifyCode }"/>
              <label id="verifyCodeError" class="errorClass text-danger"></label></label>
            </div>
            <div class="col-sm-4">
              <div id="divVerifyCode">
                <img id="imgVerifyCode" class="captcha" src="<c:url value='/VerifyCodeServlet'/>" onclick="changeVerify()"/>
              </div>
              <label class="changeCaptcha"><a class="changeCaptcha" href="javascript:_changeVerify()">Generate new one</a></label>
            </div>
          </div>
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <input type="submit" class="btn btn-group-justified btn-primary button button-glow button-border button-rounded button-primary" value="Sign In" id="submitBtn"/>
            </div>
        </form>
      </div>
    </div>
  </div>
</div>
</body>

</html>