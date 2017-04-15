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
</head>
<body>


<form role = "form" class="form-horizontal" action="<c:url value='/UserReqServlet'/>" method="post" >

        <input type="hidden" name="method" value="feedback"/>
        <input type="hidden" name="username" value=${sessionScope.get("sessionUser").username} >


    <div class="form-group">
        <label class="col-sm-2 control-label" >advisor:</label>
        <div class="col-sm-2">
            ${requestScope.get("scholar").advisee}
        </div>
    </div>


    <!--div class="form-group">
        <label class="col-sm-2 control-label">advisor: </label>
        <div class="col-sm-2">
            <input type="text" class="form-control" placeholder="advisor" name="advisor" value=${requestScope.get("scholar").advisee}>
        </div>
    </div-->


    <div class="form-group">
        <label class="col-sm-2 control-label">getReply-Email:</label>
        <div class="col-sm-2">
            <input type="hidden" name="reply_email" value=${sessionScope.get("sessionUser").email}>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">content:</label>
        <div class="col-sm-2">
            <input type="text" class="form-control" placeholder="content" name="content">
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label">verifycode:</label>
        <div class="col-sm-1">
            <input type="text" class="form-control" placeholder="verifycode" name="verifyCode">
        </div>
        <div class="col-sm-1">
            <img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/>" onclick="changeVerify()"/>
            <a href="javascript:changeVerify()">Generate new one</a>
            ${errors.verifyCode}
        </div>
    </div>



    <!--input type="text" name="verifyCode"-->
    <div class="form-group">
        <div class="col-sm-2 col-sm-offset-2">
            <button type="submit" class="btn-info btn-lg" value="submit">submint</button>
        </div>
    </div>
    <!--input type="submit" value="submit"><br-->
    <div class="form-group">
        <div class="col-sm-4" align="center">
            Others?Just <a href="mailto:cagetian@126.com">contact us</a>!
        </div>
    </div>

</form>


</body>
</html>
