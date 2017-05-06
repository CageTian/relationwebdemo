<%--
  Created by IntelliJ IDEA.
  User: xinna
  Date: 2017/3/31
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html >
<head>
    <meta charset="UTF-8">
    <title>scholar</title>
    <script>try{Typekit.load({ async: false });}catch(e){}</script>


    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>">
    <link rel="stylesheet" href="http://www.bootcss.com/p/buttons/css/buttons.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/guide_serch.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/welcome1.css">
    <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.21/jquery-ui.min.js"></script>

    <style type="text/css">
        body {
            position: relative;
            margin: 0;
            overflow: hidden;
        }

        .intro-container {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            color: white;
            text-align: center;
            margin: 0 auto;
            right: 0;
            left: 0;
        }

        h1 {
            font-family: 'brandon-grotesque', sans-serif;
            font-weight: bold;
            margin-top: 0px;
            margin-bottom: 0;
            font-size: 40px;
        }
        @media screen and (min-width: 860px) {
            h1 {
                font-size: 95px;
                line-height: 52px;
            }

        }

        .fancy-text {
            font-family: "adobe-garamond-pro",sans-serif;
            font-style: italic;
            letter-spacing: 1px;
            margin-bottom: 17px;
        }

        .m_button {
            position: relative;
            cursor: pointer;
            display: inline-block;
            font-family: 'brandon-grotesque', sans-serif;
            text-transform: uppercase;
            min-width: 100px;
            margin-top: -20%;
            margin-left: 72%;
        }
        .m_button:hover .border{
            box-shadow: 0px 0px 10px 0px white;
        }
        .m_button:hover .border .left-plane, .m_button:hover .border .right-plane {
            transform: translateX(0%);
        }
        .m_button:hover .text {
            color: #121212;
        }
        .m_button .border{
            border: 1px solid white;
            transform: skewX(-20deg);
            height: 32px;
            border-radius: 3px;
            overflow: hidden;
            position: relative;
            transition: .10s ease-out;
        }
        .m_button .border .left-plane, .m_button .border .right-plane {
            position: absolute;
            background: white;
            height: 32px;
            width: 100px;
            transition: .15s ease-out;
        }
        .m_button .border .left-plane {
            left: 0;
            transform: translateX(-100%);
        }
        .m_button .border .right-plane {
            right: 0;
            transform: translateX(100%);
        }
        .m_button .text {
            position: absolute;
            left: 0;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            transition: .15s ease-out;
        }
        @media (max-width: 767px){
            .m_button{
                position: relative;
                cursor: pointer;
                display: inline-block;
                font-family: 'brandon-grotesque', sans-serif;
                text-transform: uppercase;
                min-width: 100px;
                text-align: center;
                margin: 0 auto;
                right: 0;
                left: 0;
            }
        }

        .x-mark {
            right: 10px;
            top: 50px;
            position: absolute;
            cursor: pointer;
            opacity: 0;
        }
        .x-mark:hover .right {
            transform: rotate(-45deg) scaleY(1.2);
        }
        .x-mark:hover .left {
            transform: rotate(45deg) scaleY(1.2);
        }
        .x-mark .container {
            position: relative;
            width: 20px;
            height: 20px;
        }
        .x-mark .left, .x-mark .right {
            width: 2px;
            height: 20px;
            background: white;
            position: absolute;
            border-radius: 3px;
            transition: .15s ease-out;
            margin: 0 auto;
            left: 0;
            right: 0;
        }
        .x-mark .right {
            transform: rotate(-45deg);
        }
        .x-mark .left {
            transform: rotate(45deg);
        }

        .sky-container {
            position: absolute;
            color: white;
            text-transform: uppercase;
            margin: 0 auto;
            right: 0;
            left: 0;
            top: 2%;
            text-align: center;
            opacity: 0;
        }
        @media screen and (min-width: 860px) {
            .sky-container {
                top: 18%;
                right: 12%;
                left: auto;
            }
        }
        .sky-container__left, .sky-container__right {
            display: inline-block;
            vertical-align: top;
            font-weight: bold;
        }
        .sky-container__left h2, .sky-container__right h2 {
            font-family: 'brandon-grotesque', sans-serif;
            font-size: 26px;
            line-height: 26px;
            margin: 0;
        }
        @media screen and (min-width: 860px) {
            .sky-container__left h2, .sky-container__right h2 {
                font-size: 72px;
                line-height: 68px;
            }
        }
        .sky-container__left {
            margin-right: 5px;
        }
        .sky-container .thirty-one {
            letter-spacing: 4px;
        }

        .text-right {
            text-align: right;
        }

        .text-left {
            text-align: left;
        }




    </style>

    <script type="text/javascript">
        $(function() {/*Map<String(Cookie名称),Cookie(Cookie本身)>*/
            // 获取cookie中的用户名
            var username = window.decodeURI("${cookie.username.value}");
            if("${sessionScope.sessionUser.username}") {
                username = "${sessionScope.sessionUser.username}";
                $("#showWord").text(username);
            }
            $("#username").val(username);

        });
    </script>

</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="touming">
    <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">SCHOLAR</a>
            </div>
            <div id="searchlocation">
                <form class="navbar-form navbar-left" role="form" action="<c:url value='/ScholarServlet?'/>" method="get" id="searchForm">
                    <input  type="hidden" name="method" value="findByAdvisee" />
                    <div class="form-group">
                        <input type="text" class="form-control" name="advisee" placeholder=" scholar,paper,field,organization">
                    </div>
                    <button type="submit" value="search" class="btn btn-default">search</button>
                </form>
            </div>
            <div class="collapse navbar-collapse">

                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#" id="Button1" value="signup" onclick="window.open('${pageContext.request.contextPath}/jsps/user/regist.jsp')"><span class="glyphicon glyphicon-user" ></span> <t id="showWord">Sign up</t></a>
                    </li>
                    <li >
                        <a href="#" data-toggle="modal" data-target="#mymodal-data" id="Button2" value="login" onclick="ShowDiv('MyDivLogin','fade')"><span class="glyphicon glyphicon-log-in" ></span> Log in</a>
                    </li>
                    <li>
                        <a href="../user/welcome.jsp"><span class="glyphicon glyphicon-home" ></span>Home</a>
                    </li>
                </ul>
            </div>
            <!-- /.nav-collapse -->
        </div>
        <!-- /.container -->
    </div>
</nav>
<!-- 模态弹出窗内容 -->
<div class="modal fade" id="mymodal-data" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title"><span class="loginTop">Sign in</span></h4>
                <div class="text-muted">Need an account? Then please <a href="regist.jsp" target="_self">sign up</a>.</div>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" target="_top" action="<c:url value='/LoginServlet'/>" method="post" id="loginForm">
                    <input type="hidden" name="method" value="login" />
                    <div class="form-group">
                        <label class="error" id="msg">${msg }</label>
                    </div>
                    <div class="form-group">
                        <lable class="col-sm-2"></lable>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span> </span>
                                <input class="input form-control" placeholder="username" type="text" name="username" id="username" value="${user.username }"/>
                            </div>
                            <label id="usernameError" class="error text-danger"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <lable class="col-sm-2"></lable>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-eye-open"></span></span>
                                <input class="input form-control" placeholder="password" type="password" name="password" id="password" value="${user.password }"/>
                            </div>
                            <label id="passwordError" class="error text-danger"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <lable class="col-sm-2"></lable>
                        <div class="col-sm-5">
                            <input class="input yzm form-control" placeholder="captcha" type="text" name="verifyCode" id="verifyCode" value="${user.verifyCode }"/>
                            <label id="verifyCodeError" class="error text-danger"></label></label>
                        </div>
                        <div class="col-sm-3">
                            <div id="divVerifyCode">
                                <img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/>" onclick="changeVerify()"/>
                            </div>
                            <label class="changeCaptcha"><a href="javascript:_changeVerify()">Generate new one</a></label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8">
                            <input type="submit" class="loginBtn btn btn-group-justified button button-glow button-border button-rounded button-primary" value="Sign In" id="submit"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- This pen isn't a fan of small view heights, check it out in  fullpage view for optimal viewing	 -->
<div class="x-mark">
    <div class="container">
        <div class="left"></div>
        <div class="right"></div>
    </div>
</div>
<div class="intro-container">

    <h1>SCHOLAR</h1>

    <div class="m_button shift-camera-button">
        <div class="border">
            <div class="left-plane"></div>
            <div class="right-plane"></div>
        </div>
        <div class="text">About Us</div>
    </div>

    <div class="search">
        <form class="form-wrapper cf" role="form" action="<c:url value='/ScholarServlet?'/>" method="get" id="searchForm">

            <input  type="hidden" name="method" value="findByAdvisee" />
            <input class="st"  type="text" name="advisee" placeholder=" scholar,paper,field,organization" />
            <%--Pages:<input type="text" name="pc" value="1" /><br>--%>
            <button type="submit" value="search" >search</button>

        </form>
    </div>
</div>

<div class="sky-container">
    <div class="text-right sky-container__left">
        <h2 class="portfolio">
            ADVISOR-ADVISEE
        </h2>
        <h2 class="resurrection">
            COWORKER
        </h2>
    </div>
    <div class="text-left sky-container__right">
        <h2 class="08">
            03
        </h2>
        <h2 class="thirty-one">
            31
        </h2>
        <h2 class="2016">
            2017
        </h2>
    </div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.js"></script>

<script src=" ${pageContext.request.contextPath}/js/login.js" type="text/javascript"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script src='${pageContext.request.contextPath}/js/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/js/TweenMax.min.js'></script>
<script src='${pageContext.request.contextPath}/js/three.min.js'></script>

<script src="${pageContext.request.contextPath}/js/index.js"></script>

</body>
</html>