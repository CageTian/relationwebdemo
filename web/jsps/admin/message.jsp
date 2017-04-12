<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: T.Cage
  Date: 2017/3/29
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<ul>
    <c:forEach items="${pb.beanList}" var="userReq">
        <li>
            <p>username:${userReq.username}</p><br>
            <p>reply_email:${userReq.reply_email}</p><br>
            <p>content:${userReq.content}</p><br>
            <p>advisor:${userReq.advisor}</p><br>

        </li>
    </c:forEach>
</ul>
<div style="float:left; width: 100%; text-align: center;">
    <hr/>
    <br/>
    <%@include file="/jsps/pager/pager.jsp" %>
</div>
</body>
</html>
