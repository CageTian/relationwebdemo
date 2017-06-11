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
    <title>Administrator message</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://www.bootcss.com/p/buttons/css/buttons.css">
    <link rel="stylesheet" href="<c:url value='/css/message.css'/>" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/guide_serch.css">
</head>
<style type="text/css">
    body{
        background-image: url(${pageContext.request.contextPath}/resource/background.jpg);
        background-attachment: fixed;
    }
</style>
<body>
<%@include file="/jsps/pager/header.jsp" %>
<div class="container">
    <div style="margin: 80px 0 0 0">
        <c:forEach items="${pb.beanList}" var="userReq">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div style="text-align: center">
                                <span1>${userReq.username}</span1><br>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-4">
                                    <span>advisor:</span>${userReq.advisor}
                                </div>
                                <div class="col-sm-4">
                                    <span>email:</span>:${userReq.reply_email}
                                </div>
                                <div class="col-sm-4">
                                    <span> modification time:</span>
                                </div>
                            </div>
                            <div class="list-group">
                                <div class="list-group-item list-group-item-info">
                                    <div class="con">Content</div>
                                    <div class="content">
                                        <span> ${userReq.content}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div style="float:left; width: 100%;">
            <hr/>
            <br/>
            <%@include file="/jsps/pager/pager.jsp" %>
        </div>
    </div>
</div>
<footer role="contentinfo" style="height: 300px"></footer>
</body>
</html>
