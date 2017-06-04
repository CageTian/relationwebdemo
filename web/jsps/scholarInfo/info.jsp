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
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
.m_title{
    background-image: url(${pageContext.request.contextPath}/resource/background.jpg);
    opacity: 0.7;
    padding-top: 7px;
    padding-bottom: 7px;
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
.flip-3d figure figcaption {
    border-radius:50%; position: absolute; width: 100%; height: 86px; top: 0;  transform: rotateY(.5turn) translateZ(1px);
    background: rgba(255,255,255,0.9); text-align: center; padding-top: 45%;font-size: 20px; opacity: 0.6; transition: 1s .5s opacity; }
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

ul.nav-tabs{
    width: 140px;
    margin-top: 20px;
    border-radius: 4px;
    border: 1px solid #ddd;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
}
ul.nav-tabs li{
    margin: 0;
    border-top: 1px solid #ddd;
}
ul.nav-tabs li:first-child{
    border-top: none;
}
ul.nav-tabs li a{
    margin: 0;
    padding: 8px 16px;
    border-radius: 0;
}
ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
    color: #fff;
    background: #0088cc;
    border: 1px solid #0088cc;
}
ul.nav-tabs li:first-child a{
    border-radius: 4px 4px 0 0;
}
ul.nav-tabs li:last-child a{
    border-radius: 0 0 4px 4px;
}
ul.nav-tabs.affix{
    top: 30px; /* Set the top position of pinned element */
}
    .zhibiao{
        display: table;
    }
    .zhibiao_cotent{
        display: table-cell;
        vertical-align:middle;
    }
</style>
<body>

<%@include file="/jsps/pager/header.jsp" %>

<div class="container" style="margin-top:50px;">
    <div class="row">
        <div class="col-sm-5 col-sm-offset-1">
            <div class="row">
                <div class="col-sm-4" style="margin-top: 7%">
                    <img src="${pageContext.request.contextPath}<c:if test="${empty scholar.avantar}">/resource/profile1.jpg</c:if><c:if test="${!empty scholar.avantar}">${scholar.avantar}</c:if>" class="img-responsive">
                </div>
                <div class="col-sm-8">
                    <div class="row">
                        <h3 class="glyphicon glyphicon-user">Name:<h id="advisee1">${requestScope.get("scholar").advisee}</h>
                            <a href=<c:url value='/ScholarServlet?method=ScholarFeedback&advisee_id=${scholar.advisee_id}'/>><span class="glyphicon glyphicon-pencil" ></span></a>
                        </h3>
                        <a style="display: none;" type="hidden" id="my_advisee_id">${requestScope.get("scholar").advisee_id}</a>
                    </div>
                    <div class="row"><h3 class="glyphicon glyphicon-book">Advisor:<h id="advisor">${requestScope.get("scholar").advisor}</h></h3></div>
                    <div class="row">
                        <div class="lanren">
                        <div class="flip-3d">
                            <figure > <img src="${pageContext.request.contextPath}/resource/startyear.jpg">
                                <figcaption id="test">${requestScope.get("scholar").paper_start_year}</figcaption>
                            </figure>
                        </div>

                        <div class="flip-3d">
                            <figure> <img src="${pageContext.request.contextPath}/resource/paper.jpg">
                                <figcaption>${requestScope.get("scholar").paper_num}</figcaption>
                            </figure>
                        </div>
                        <div class="flip-3d">
                            <figure> <img src="${pageContext.request.contextPath}/resource/collaborator.jpg">
                                <figcaption>${requestScope.get("scholar").col_cop_times}</figcaption>
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

    <div class="row">

        <div class="col-xs-10 col-sm-10 col-sm-offset-1">
                <div class="m_title"><h4>Academic Family Tree</h4></div>
                <div id="tree">
                </div>
        </div>

    <div class="row" >

        <div class="col-sm-10 col-sm-offset-1" >
            <div class="m_title"><h4>Collaboration Times with Advisor</h4></div>
            <div class="col-sm-4 zhibiao">
                <div class="zhibiao_cotent">
                <h4 class=" 	glyphicon glyphicon-tag">Accuracy</h4><br/>
                <h4 class=" 	glyphicon glyphicon-tag">Year</h4><br/>
                <h4 class=" 	glyphicon glyphicon-tag">Times</h4>
                </div>
            </div>
            <div class="col-sm-8" id="teac_time">


            </div>
        </div>

    </div>
    <div class="row" >
        <div class="col-sm-5 col-sm-offset-1" id="coworker">
            <div class="m_title"><h4>Ego Network</h4></div>
        </div>
        <div class="col-sm-5 web" >
            <div class="m_title"><h4>Collaboration Network</h4></div>
        </div>
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




<!--script src="yukuai.json"></script>
<script src="jizuobiao.json"></script>
<script src="paper.json"></script>
<script src="tree.json"></script-->

<script src=" ${pageContext.request.contextPath}/js/diagram.js" type="text/javascript"></script>
<script src=" ${pageContext.request.contextPath}/js/login.js" type="text/javascript"></script>

</body>
</html>
