<%--
  Created by IntelliJ IDEA.
  User: T.Cage
  Date: 2017/3/29
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Feedback</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/guide_serch.css">
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
<style type="text/css">
    body{
        background-image: url(${pageContext.request.contextPath}/resource/background.jpg);
        background-attachment: fixed;
    }
    .intro {
        padding:0px;
        border:1px solid white;
        border-radius: 5px;
        background: white;
        box-shadow:0 0 10px black;

        filter:alpha(Opacity=80);-moz-opacity:0.8;opacity: 0.8;
    }
</style>
<body>
<%@include file="/jsps/pager/header.jsp" %>

<div class="row" style="margin-top: 15%;">
<div class="col-sm-3"></div>
    <div class="col-sm-6 intro">

        <form role = "form" class="form-horizontal" action="<c:url value='/UserReqServlet'/>" method="post" >

                <input type="hidden" name="method" value="feedback"/>
                <input type="hidden" name="username" value=${sessionScope.get("sessionUser").username} >


            <div class="row">
                <label class="col-sm-3 control-label" >advisor:</label>
                <div class="col-sm-8">
                    ${requestScope.get("scholar").advisee}
                </div>
            </div>


            <!--div class="form-group">
                <label class="col-sm-2 control-label">advisor: </label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" placeholder="advisor" name="advisor" value=${requestScope.get("scholar").advisee}>
                </div>
            </div-->


            <div class="row">
                <label class="col-sm-3 control-label">getReply-Email:</label>
                <div class="col-sm-8">
                    <input type="hidden" name="reply_email" value=${sessionScope.get("sessionUser").email}>
                </div>
            </div>


            <div class="row">
                <label class="col-sm-3 control-label">content:</label>
                <div class="col-sm-8">
                    <input style="height: 100px;" type="text" class="form-control" placeholder="content" name="content">
                </div>
            </div>


            <div class="row">
                <label class="col-sm-3 control-label">verifycode:</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" placeholder="verifycode" name="verifyCode">
                </div>
                <div class="col-sm-4">
                    <img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/>" onclick="changeVerify()"/>
                    <a href="javascript:changeVerify()">Generate new one</a>
                    ${errors.verifyCode}
                </div>
            </div>



            <!--input type="text" name="verifyCode"-->
            <div class="row" align="center">

                    <button type="submit" class="btn-info btn-lg" value="submit">submint</button>

            </div>
            <!--input type="submit" value="submit"><br-->
            <div class="row" align="center">

                    Others?Just <a href="mailto:cagetian@126.com">contact us</a>!

            </div>

        </form>
    </div>
</div>
<script src=" ${pageContext.request.contextPath}/js/login.js" type="text/javascript"></script>
</body>
</html>
