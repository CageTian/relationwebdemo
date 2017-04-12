<%--
  Created by IntelliJ IDEA.
  User: T.Cage
  Date: 2017/1/23
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>regist</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/regist.css'/>">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://www.bootcss.com/p/buttons/css/buttons.css">

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<c:url value='/js/regist.js'/>"></script>
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
            <a href="welcome.jsp" class="navbar-brand">Scholar</a>
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
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span id="spanTitle">Registration</span>
                <div class="text-muted">Already have an account? Then please <a href="login.jsp" target="_self">sign in</a>.</div>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" role="form" action="<c:url value='/RegisteServlet'/>" method="post" id="registForm">
                    <input type="hidden" name="method" value="regist"/>
                    <div class="form-group">
                        <lable class="col-sm-2"></lable>
                        <div class="col-sm-7">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </span>
                                <input class="form-control inputClass"placeholder="Username" type="text" name="username" id="username" value="${form.username }"/>
                            </div>
                        </div>
                        <div class="col-sm-3 text-danger"><label class="errorClass" id="usernameError">${errors.username }</label></div>
                    </div>
                    <div class="form-group">
                        <lable class="col-sm-2"></lable>
                        <div class="col-sm-7">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-eye-open"></span></span>
                                <input class="form-control inputClass" placeholder="Password" type="password" name="password" id="password" value="${form.password }"/>
                            </div>
                        </div>
                        <div class="col-sm-3 text-danger"><label class="errorClass" id="passwordError">${errors.password }</label></div>
                    </div>
                    <div class="form-group">
                        <lable class="col-sm-2"></lable>
                        <div class="col-sm-7">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-eye-open"></span></span>
                                <input class="form-control inputClass" placeholder="Password(again)" type="password" name="repassword" id="repassword" value="${form.repassword }"/>
                            </div>
                        </div>
                        <div class="col-sm-3 text-danger"><label class="errorClass" id="repasswordError">${errors.repassword}</label></div>
                    </div>
                    <div class="form-group">
                        <lable class="col-sm-2"></lable>
                        <div class="col-sm-7">
                            <div class="input-group">
                                <span class="input-group-addon">@</span>
                                <input class="form-control inputClass" placeholder="E-mail" type="text" name="email" id="email" value="${form.email }"/>
                            </div>
                        </div>
                        <div class="col-sm-3 text-danger"><label class="errorClass" id="emailError">${errors.email}</label></div>
                    </div>
                    <div class="form-group">
                        <lable class="col-sm-2"></lable>
                        <div class="col-sm-4">
                                <input class="form-control inputClass" placeholder="captcha" type="text" name="verifyCode" id="verifyCode" value="${form.verifyCode }"/>
                        </div>
                        <div class="col-sm-3">
                            <div id="divVerifyCode">
                                <img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/>" onclick="changeVerify()"/>
                            </div>
                            <label class="changeCaptcha"><a href="javascript:changeVerify()">Generate new one</a></label>
                        </div>
                        <div class="col-sm-3">
                            <label class="errorClass  text-danger" id="verifyCodeError">${errors.verifyCode}</label>
                        </div>
                    </div>
                    <div class="col-sm-2"></div>
                    <lable class="col-sm-7 control-lable"><input type="submit" class="btn btn-group-justified button button-glow button-border button-rounded button-primary" value="Register" id="submitBtn"/></lable>
                    <label></label>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
