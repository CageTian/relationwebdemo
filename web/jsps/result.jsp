<%--
  Created by IntelliJ IDEA.
  User: T.Cage
  Date: 2016/12/19
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>result</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://www.bootcss.com/p/buttons/css/buttons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/result.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/result_smaller.css" media="only screen and (max-width: 40em)">
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
</style>
<body>

<%@include file="/jsps/pager/header.jsp" %>

<div class="container" style="margin-top:50px;">
    <!--header role="banner">
        <div class="r_nav">
            <div class="r_box"><em>h-index:</em></div>
            <div class="r_nbox"><a><span>19</span></a></div>
            <div class="r_nbox"></div>
        </div>
        <div class="r_nav">
            <div class="r_box"><em>h-index:</em></div>
            <div class="r_nbox"></div>
            <div class="r_nbox"></div>
            <div class="r_nbox"></div>
        </div>
        <div class="r_nav">
            <div class="r_box"><em>h-index:</em></div>
            <div class="r_nbox"></div>
            <div class="r_nbox"></div>
        </div>
    </header-->
    <ul class="list-unstyled">
        <c:forEach items="${pb.beanList}" var="scholar">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="m_content col-sm-8">
                    <div class="intro">
                        <li class="row">
                            <div class="photo">
                                <img class="scholer_photo" src="${pageContext.request.contextPath}/resource/profile1.jpg">
                            </div>
                            <div class="col-sm-9">
                                <div class="r_name">
                                    <h5><a href=<c:url value='/ScholarServlet?method=ScholarInfo&advisee_id=${scholar.advisee_id}'/> >${scholar.advisee}</a> </h5>
                                </div>
                                <div class="r_info">
                                    <span>Paper</span>:  &nbsp;&nbsp;|&nbsp;&nbsp; <span>Citation</span>:
                                </div>
                                <div class="r_advisor">
                                    <span>advisor: <a href="#" class="btn btn-sm">${scholar.advisor}</a></span>
                                </div>
                                <div class="r_beg text-muted">
                                    <span>beginYear:${scholar.start_year}</span>
                                </div>
                            </div>

                        </li>
                    </div>
                </div>
            </div>
        </c:forEach>
    </ul>
    <div style="float:left; width: 100%;">
        <hr />
        <br/>
        <%@include file="/jsps/pager/pager.jsp" %>
</div>
</div>
<footer role="contentinfo" style="height: 300px"></footer>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src=" ${pageContext.request.contextPath}/js/login.js" type="text/javascript"></script>
</body>
</html>
