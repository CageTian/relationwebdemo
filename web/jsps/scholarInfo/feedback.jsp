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
    <title>Title</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<c:url value='/js/regist.js'/>"></script>
</head>
<body>
<form action="<c:url value='/UserReqServlet'/>" method="post" >
    <input type="hidden" name="method" value="feedback"/>
    <input type="hidden" name="username" value=${sessionScope.get("sessionUser").username} >
    advisor:  ${requestScope.get("scholar").advisee}<br>
    advisor:  <input type="text" name="advisor" value=${requestScope.get("scholar").advisee}>;<br>
    getReply-Email:<input type="hidden" name="reply_email" value=${sessionScope.get("sessionUser").email}>;<br>
    content:<input type="text" name="content"><br>
    <img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/>" onclick="changeVerify()"/><br>
    <input type="text" name="verifyCode">
    <a href="javascript:changeVerify()">Generate new one</a><br>
    ${errors.verifyCode}
    <input type="submit" value="submit"><br>

    <a href="mailto:cagetian@126.com">contact us</a>
</form>






</body>
</html>
