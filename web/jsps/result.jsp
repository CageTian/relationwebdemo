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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dianzan.css">
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
    .heart{
        background: url(${pageContext.request.contextPath}/resource/web_heart_animation.png);
        background-position: left;
        background-repeat: no-repeat;
        height: 70px;
        width: 70px;
        cursor: pointer;
        position: absolute;
        left:-14px;
        background-size:2900%;
    }
    .heart:hover, .heart:focus{
        background-position: right;
    }

    @-webkit-keyframes heartBlast {
        0% {
            background-position: left;
        }
        100% {
            background-position: right;
        }
    }

    @keyframes heartBlast {
        0% {
            background-position: left;
        }
        100% {
            background-position: right;
        }
    }

    .heartAnimation {
        display: inline-block;
        -webkit-animation-name: heartBlast;
        animation-name: heartBlast;
        -webkit-animation-duration: .8s;
        animation-duration: .8s;
        -webkit-animation-iteration-count: 1;
        animation-iteration-count: 1;
        -webkit-animation-timing-function: steps(28);
        animation-timing-function: steps(28);
        background-position: right;
    }
    .feed p{font-family: "Microsoft YaHei",'Georgia', Times, Times New Roman, serif; font-size: 25px;}
    .feed{clear: both; margin-bottom:20px; height: 80px; position: relative;}

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
                            <div class="col-sm-7">
                                <div class="r_name">
                                    <h5><a href=<c:url value='/ScholarServlet?method=ScholarInfo&bid=${scholar.bid}'/> >${scholar.advisee}</a> </h5>
                                </div>
                                <div class="r_info">
                                    <span>Paper</span>:  &nbsp;&nbsp;|&nbsp;&nbsp; <span>Citation</span>:
                                </div>
                                <div class="r_advisor">
                                    <span>advisor: <a href="#" class="btn btn-sm">${scholar.advisor}</a></span>
                                </div>
                                <div class="r_beg text-muted">
                                    <span>beginYear:${scholar.beginYear}</span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="feed" id="feed1">

                                    <div class="heart " id="like1" rel="like"></div> <!--div class="likeCount" id="likeCount1">14</div-->
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
<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
<script>
    $(document).ready(function()
    {

        $('body').on("click",'.heart',function()
        {

            var A=$(this).attr("id");
            var B=A.split("like");
            var messageID=B[1];
            var C=parseInt($("#likeCount"+messageID).html());
            $(this).css("background-position","")
            var D=$(this).attr("rel");

            if(D === 'like')
            {
                $("#likeCount"+messageID).html(C+1);
                $(this).addClass("heartAnimation").attr("rel","unlike");

            }
            else
            {
                $("#likeCount"+messageID).html(C-1);
                $(this).removeClass("heartAnimation").attr("rel","like");
                $(this).css("background-position","left");
            }


        });


    });
</script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src=" ${pageContext.request.contextPath}/js/login.js" type="text/javascript"></script>
</body>
</html>
