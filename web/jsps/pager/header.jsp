<%--
  Created by IntelliJ IDEA.
  User: caget
  Date: 2017/5/16
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.21/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/guide_serch.css">
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
                        <input type="text" class="form-control" name="advisee" placeholder=" scholar,paper,field,organization">
                    </div>
                    <button type="submit" value="search" class="btn btn-default">search</button>
                </form>
            </div>
            <div class="collapse navbar-collapse">

                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#" id="Button1" value="signup" onclick="window.open('${pageContext.request.contextPath}/jsps/user/regist.jsp')"><span class="glyphicon glyphicon-user" ></span>
                            <c:if test="${empty sessionScope.sessionUser.username}">Sign Up</c:if><c:if test="${!empty sessionScope.sessionUser.username}">${sessionScope.sessionUser.username}</c:if></a>
                    </li>
                    <li >
                        <c:if test="${empty sessionScope.sessionUser.username}">
                        <a href="#" data-toggle="modal" data-target="#mymodal-data" id="Button2" value="login" onclick="ShowDiv('MyDivLogin','fade')"><span class="glyphicon glyphicon-log-in" id="loginspan" >
                        </span>Log in</a>
                        </c:if>
                        <c:if test="${!empty sessionScope.sessionUser.username}">
                            <a href="<c:url value='/LoginServlet?method=logout'/>"><span class="glyphicon glyphicon-log-in" id="loginspan" >
                            </span> Log Out</a>
                        </c:if>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/jsps/welcome.jsp"><span class="glyphicon glyphicon-home" ></span>Home</a>
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
