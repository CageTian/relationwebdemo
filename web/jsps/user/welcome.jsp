<%--
  Created by IntelliJ IDEA.
  User: T.Cage
  Date: 2016/12/19
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Scholar</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/photopile.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/welcome.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/regist.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>">
    <link rel="stylesheet" href="http://www.bootcss.com/p/buttons/css/buttons.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/welcome_minimun.css" media="only screen and (max-width: 40em)">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/welcome_smaller.css" media="only screen and (min-width: 40em) and (max-width:60em)">
    <script type="text/javascript">
        $(document).ready(function(){
            $('#box1').css('height',$('#box1').css('width'));
        })
    </script>
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
<header role="banner" class="navbar-fixed-top">

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
                <a class="navbar-brand" href="#">Project Logo</a>
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
                        <a href="#" id="Button1" value="signup" onclick="window.open('regist.jsp')"><span class="glyphicon glyphicon-user" ></span> Sign up</a>
                    </li>
                    <li >
                        <a href="#" data-toggle="modal" data-target="#mymodal-data" id="Button2" value="login" onclick="ShowDiv('MyDivLogin','fade')"><span class="glyphicon glyphicon-log-in" ></span> Log in</a>
                    </li>
                    <li>
                        <a href="welcome.jsp"><span class="glyphicon glyphicon-home" ></span>Home</a>
                    </li>
                </ul>
            </div>

        </div>

    </div>
</nav>
</header>


    <!--图片堆叠背景-->
    <div style="margin-top:50px;">
        <ul class="photopile">
            <li>
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/01.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/01.jpg" alt="Barton Dam, Ann Arbor, Michigan" width="133" height="80" />
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/02.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/02.jpg" alt="Building Atlanta, Georgia" width="133" height="80" />
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/03.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/03.jpg" alt="Nice day for a swim" width="133" height="100" />
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/04.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/04.jpg" alt="The plants that never die" width="100" height="133" />
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/05.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/05.jpg" alt="Downtown Atlanta, Georgia" width="100" height="134" />
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/06.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/06.jpg" alt="Atlanta traffic" width="100" height="137" />
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/07.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/07.jpg" alt="A pathetic dog" width="120" height="120" />
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/08.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/08.jpg" alt="Two happy dogs" width="140" height="100" />
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/09.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/09.jpg" alt="Antigua, Guatemala" width="100" height="133" />
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/10.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/10.jpg" alt="Iximche, Guatemala" width="135" height="128" />
                </a>
            </li>
            <li class="img_hide">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/11.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/11.jpg" alt="The bat cave" width="119" height="133" />
                </a>
            </li>
            <li class="img_hide">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/12.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/12.jpg" alt="All Saints Day Kite Festival" width="133" height="100" />
                </a>
            </li>
            <li class="img_hide">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/13.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/13.jpg" alt="Tikal, Guatemala" width="130" height="130" />
                </a>
            </li>
            <li class="img_hide">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/14.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/14.jpg" alt="Mackinac Island, Michigan" width="111" height="130" />
                </a>
            </li>
            <li class="img_hide">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/15.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/15.jpg" alt="Summer flowers" width="133" height="100" />
                </a>
            </li>
            <li class="img_hide">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/16.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/16.jpg" alt="Full of hot air" width="133" height="100" />
                </a>
            </li>
            <li class="img_hide">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/17.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/17.jpg" alt="On the rise" width="133" height="100" />
                </a>
            </li>
            <li class="img_hide">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/18.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/18.jpg" alt="Amador Causeway, Panama City" width="133" height="100" />
                </a>
            </li>
            <li class="img_hide">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/19.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/19.jpg" alt="The Panama Canal" width="140" height="79" />
                </a>
            </li>
            <li class="img_hide">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/20.png">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/20.jpg" alt="Flags over Brussels" width="133" height="99" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/21.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/21.jpg" alt="Eiffel Tower" width="100" height="134" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/22.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/22.jpg" alt="Never-ending stairs" width="99" height="133" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/23.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/23.jpg" alt="Paris, France" width="140" height="93" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/24.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/24.jpg" alt="Rainbow over Belgium" width="136" height="98" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/25.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/25.jpg" alt="Playa del Carmen" width="136" height="96" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/26.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/26.jpg" alt="Panama City, Panama" width="133" height="96" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/27.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/27.jpg" alt="Red frog" width="133" height="100" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/28.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/28.jpg" alt="Dogs on a couch" width="133" height="99" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/29.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/29.jpg" alt="Tarantula" width="133" height="97" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/30.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/30.jpg" alt="Ceviche Loco" width="140" height="93" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/31.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/31.jpg" alt="Playa Blanca, Panama" width="133" height="100" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/32.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/32.jpg" alt="Pickles" width="133" height="99" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/33.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/33.jpg" alt="Parrot" width="133" height="100" />
                </a>
            </li>
            <li class="img_hide img_conceal">
                <a href="${pageContext.request.contextPath}/resource/images/fullsize/34.jpg">
                    <img src="${pageContext.request.contextPath}/resource/images/thumbs/34.jpg" alt="Panama rains" width="133" height="100" />
                </a>
            </li>
            <!--<li>
                <a href="images/fullsize/35.jpg">
                    <img src="images/thumbs/35.jpg" alt="Cinta Costera, Panama City" width="120" height="120" />
                </a>
            </li>
            <li>
                <a href="images/fullsize/36.jpg">
                    <img src="images/thumbs/36.jpg" alt="Afternoon stroll" width="133" height="100" />
                </a>
            </li>
            <li>
                <a href="images/fullsize/37.jpg">
                    <img src="images/thumbs/37.jpg" alt="Overlooking the Panama Canal" width="138" height="94" />
                </a>
            </li>-->
        </ul>

        <div class="title">scholar</div>

        <div class="search">
            <form class="form-wrapper cf" role="form" action="<c:url value='/ScholarServlet?'/>" method="get" id="searchForm">

                    <input  type="hidden" name="method" value="findByAdvisee" />
                    <input class="st"  type="text" name="advisee" <%--value="scholar,paper,field,organization" --%>placeholder=" scholar,paper,field,organization" />
                    <%--Pages:<input type="text" name="pc" value="1" /><br>--%>
                    <button type="submit" value="search" >search</button>

            </form>
        </div>




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




    </div><!-- photopile-wrapper-->

<div class="container">
    <div class="show row">
        <div class="ranking col-sm-4"></div>
        <div class="library col-sm-4"></div>
        <div class="hotTopics col-sm-4"></div>
    </div>
</div>

<footer role="contentinfo">
    <div class="dataShow">
        <div class="schN"></div>
        <div class="paperN"></div>
        <div class="reN"></div>
        <div class="reTime"></div>
    </div>
</footer>




</div><!--rightContainer-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.21/jquery-ui.min.js"></script>
<!--script src="jquery.ui.touch-punch.min.js"></script-->
<script src=" ${pageContext.request.contextPath}/js/common/photopile.js" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/js/regist.js'/>"></script>

<script src=" ${pageContext.request.contextPath}/js/login.js" type="text/javascript"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</body>
</html>

