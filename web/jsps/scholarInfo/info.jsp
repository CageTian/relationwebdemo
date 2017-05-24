<%--
  Created by IntelliJ IDEA.
  User: T.Cage
  Date: 2016/12/19
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>scholar information</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/guide_serch.css">
    <script src="https://a.alipayobjects.com/jquery/jquery/1.11.1/jquery.js"></script>
    <script src="https://a.alipayobjects.com/g/datavis/g2/2.3.0/g2.js"></script>
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
<style>
/*web*/
    .links line {
        stroke: #999;
        stroke-opacity: 0.6;
    }

    .nodes circle {
        stroke: #fff;
        stroke-width: 1.5px;
    }
body{
    background-image: url(${pageContext.request.contextPath}/resource/starsky.jpg);
    background-attachment: fixed;
}
h4,h3{
    color: #cecece;
}
.ac-tooltip{
    position:absolute;
    visibility:hidden;
    border : 0px solid #999;
    border-radius: 5px;
    background-color: #cecece;
    opacity: .8;
    padding: 7px;
    transition: top 200ms,left 200ms;
    -moz-transition:  top 200ms,left 200ms;  /* Firefox 4 */
    -webkit-transition:  top 200ms,left 200ms; /* Safari 和 Chrome */
    -o-transition:  top 200ms,left 200ms;
    font-size: small;
}
.ac-tooltip .ac-title{
    margin: 0;
    padding: 2px 0;
}
.ac-tooltip .ac-list{
    margin: 0;
    padding: 0;
    list-style: none;
}
.ac-tooltip li{
    line-height:  12px;
}

.lanren {
    width: 300px;
    height:100px;
    overflow: hidden;
    margin: 0 auto;
}
.flip-3d {
    border-radius:50%;
    perspective: 1200px;
    width: 33%;
    float: left;
}
.flip-3d figure {
    border-radius:50%;
    position: relative;
    transform-style: preserve-3d;
    transition: 1s transform;
    font-size: 1.6rem;
    margin: 7px;
}
.flip-3d figure img {border-radius:50%; width: 100%; height: auto; }
.flip-3d figure figcaption {border-radius:50%; position: absolute; width: 100%; height: 86px; top: 0;  transform: rotateY(.5turn) translateZ(1px);
    background: rgba(255,255,255,0.9); text-align: center; padding-top: 45%; opacity: 0.6; transition: 1s .5s opacity; }
.flip-3d:hover figure { transform: rotateY(.5turn);
}
.flip-3d:hover figure figcaption { opacity: 1; }
.flip-3d figure:after { content: " "; display: block; height: 8vw; width: 100%; transform: rotateX(90deg); background-image: radial-gradient(ellipse closest-side, rgba(0, 0, 0, 0.2) 0%, rgba(0, 0, 0, 0) 100%); }
@media screen and (max-width: 800px) {
    #flip-3d {
        perspective-origin: center top;
    }

    div#flip-3d figure {
        float: none;
        width: 50%;
        margin: 0 auto;
        margin-bottom: 12vw;
    }

    .flip-3d figure figcaption {
        font-size: 0.8rem;
    }

    div#flip-3d figure:last-child {
        display: none;
    }
}
</style>
<body >

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
                <a class="navbar-brand" href="${pageContext.request.contextPath}/jsps/welcome.jsp">SHIFU</a>
            </div>
            <div id="searchlocation">
                <form class="navbar-form navbar-left" role="form" action="<c:url value='/ScholarServlet?'/>" method="get" id="searchForm">
                    <input  type="hidden" name="method" value="findByAdvisee" />
                    <div class="form-group">
                        <input type="text" class="form-control" name="advisee" placeholder="Search">
                    </div>
                    <button type="submit" value="search" class="btn btn-default">search</button>
                </form>
            </div>
            <div class="collapse navbar-collapse">

                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#" id="Button1" value="signup" onclick="window.open('../user/regist.jsp')"><span class="glyphicon glyphicon-user" ></span> Sign up</a>
                    </li>
                    <li >
                        <a href="#" data-toggle="modal" data-target="#mymodal-data" id="Button2" value="login" onclick="ShowDiv('MyDivLogin','fade')"><span class="glyphicon glyphicon-log-in" ></span> Log in</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/jsps/welcome.jsp"><span class="glyphicon glyphicon-home" ></span>Home</a>
                    </li>
                    <li>
                        <a href=<c:url value='/ScholarServlet?method=ScholarFeedback&bid=${scholar.bid}'/>><span class="glyphicon glyphicon-pencil" ></span>Modify</a>
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

<div class="container" style="margin-top:50px;">
    <div class="row">
        <div class="col-sm-5 col-sm-offset-1">
            <div class="row">
                <div class="col-sm-4" style="margin-top: 7%">
                    <img src="${pageContext.request.contextPath}/resource/profile1.jpg" class="img-responsive">
                </div>
                <div class="col-sm-8">
                    <div class="row">
                        <h3>Name:<h id="advisee1">${requestScope.get("scholar").advisee}</h>;</h3>
                    </div>
                    <div class="row"><h3>Institution:<h id="advisor">${requestScope.get("scholar").advisor}</h>;</h3></div>
                    <div class="row">
                        <div class="lanren">
                        <div class="flip-3d">
                            <figure > <img src="${pageContext.request.contextPath}/resource/startyear.jpg">
                                <figcaption id="test">year</figcaption>
                            </figure>
                        </div>

                        <div class="flip-3d">
                            <figure> <img src="${pageContext.request.contextPath}/resource/paper.jpg">
                                <figcaption>paper</figcaption>
                            </figure>
                        </div>
                        <div class="flip-3d">
                            <figure> <img src="${pageContext.request.contextPath}/resource/collaborator.jpg">
                                <figcaption>coworkes</figcaption>
                            </figure>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-5" id="paperNum">

        </div>
    </div>
    <!--<div class="row">
        <div class="col-sm-10 col-sm-offset-1">
            <ul id="myTab" class="nav nav-tabs">
                <li class="active"><a href="#Relationtree" data-toggle="tab">
                    Academic Family Tree</a>
                </li>
                <li><a href="#advisor" data-toggle="tab">Collaboration Times with Advisor</a></li>
                <li><a href="#collaborator" data-toggle="tab">Collaboration Network</a></li>

            </ul>

        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="Relationtree">
                <div class="col-sm-10" id="tree">

                </div>

            </div>
            <div class="tab-pane fade" id="advisor">
                <div class="col-sm-4">      </div>
                <div class="col-sm-8" id="teac_time">

                </div>
            </div>
            <div class="tab-pane fade" id="collaborator">
                <div class="col-sm-6 web"></div>
                <div class="col-sm-6" id="coworker"></div>
            </div>
            <!--div class="tab-pane fade" id="ejb">
                <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
                </p>
            </div>
        </div>
        </div>
        <script>
            $('#myTab a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            })

        </script>

    </div>-->

    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-5" id="student">
            <hr><h4>Collaboration Times with Descendant</h4><hr>

        </div>
        <div class="col-sm-5" id="coworker">
            <hr><h4>coworker</h4><hr>

        </div>
        <div class="col-sm-1"></div>
    </div>


    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-10" id="tree">
            <hr><h4>Academic Family Tree</h4><hr>
        </div>
        <div class="col-sm-1"></div>
    </div>
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-5 web" >
            <hr><h4>Collaboration Network</h4><hr>
        </div>
        <div class="col-sm-5" id="teac_time">
            <hr><h4>Collaboration Times with Advisor</h4><hr>
        </div>
        <div class="col-sm-1"></div>
    </div>
</div>


<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.21/jquery-ui.min.js"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>

<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/web.js" type="text/javascript"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>



<!--script src="yukuai.json"></script>
<script src="jizuobiao.json"></script>
<script src="paper.json"></script>
<script src="tree.json"></script-->

<script src=" ${pageContext.request.contextPath}/js/diagram.js" type="text/javascript"></script>
<script src=" ${pageContext.request.contextPath}/js/login.js" type="text/javascript"></script>

</body>
</html>
