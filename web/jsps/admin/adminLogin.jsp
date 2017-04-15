<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: T.Cage
  Date: 2017/3/29
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminLogin</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://www.bootcss.com/p/buttons/css/buttons.css">
</head>

<body>
<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span class="loginTop">Administrator Log in</span>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" role="form" target="_top"  method="post" >
                    <input type="hidden" name="method" value="login" />
                    <label class="error text-danger" id="msg">${msg }</label>
                    <div class="form-group">
                        <lable class="col-sm-2 control-lable" for="username"></lable>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </span>
                                <input class="form-control input" placeholder="username" type="text" name="username" id="username" value="${user.username }"/>
                            </div>
                            <label id="usernameError" class="error text-danger"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <lable class="col-sm-2 control-lable" for="password"></lable>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-eye-open"></span></span>
                                <input class="form-control input" placeholder="password" type="password" name="password" id="password" value="${user.password }"/>
                            </div>
                            <label id="passwordError" class="error text-danger"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <lable class="col-sm-2 control-lable" for="verifyCode"></lable>
                        <div class="col-sm-4">
                            <input class="form-control input" type="text" placeholder="captcha" name="verifyCode" id="verifyCode" value="${user.verifyCode }"/>
                            <label id="verifyCodeError" class="error text-danger"></label></label>
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
                        <a href=<c:url value='/UserReqServlet?method=showAllMes'/> ><input class="btn btn-group-justified btn-primary button button-glow button-border button-rounded button-primary"  value="Sign In"/>  </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<a href=<c:url value='/UserReqServlet?method=showAllMes'/> >登陆</a>
</body>
</html>
