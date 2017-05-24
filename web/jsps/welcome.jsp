<%--
  Created by IntelliJ IDEA.
  User: xinna
  Date: 2017/3/31
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html >
<head>
    <meta charset="UTF-8">
    <title>scholar</title>
    <script>try{Typekit.load({ async: false });}catch(e){}</script>


    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>">
    <link rel="stylesheet" href="http://www.bootcss.com/p/buttons/css/buttons.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/guide_serch.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/welcome.css">


    <style type="text/css">

        html{height:100%;}
        body {
            /*position: absolute;*/
            overflow: scroll;
            margin: 0;
            /*overflow: hidden;*/
            height:100%;
        }
        #canvas3d{
            position: absolute;
            top:0%;
            border: none;
            width:100%;
            height:100%;
        }
        .intro-container {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            color: white;
            text-align: center;
            margin: 0 auto;
            right: 0;
            left: 0;
        }

        h1 {
            font-family: 'brandon-grotesque', sans-serif;
            font-weight: bold;
            margin-top: 0px;
            margin-bottom: 0;
            font-size: 40px;
        }
        @media screen and (min-width: 860px) {
            h1 {
                font-size: 95px;
                line-height: 52px;
            }

        }

        .fancy-text {
            font-family: "adobe-garamond-pro",sans-serif;
            font-style: italic;
            letter-spacing: 1px;
            margin-bottom: 17px;
        }

        .m_button {
            position: relative;
            cursor: pointer;
            display: inline-block;
            font-family: 'brandon-grotesque', sans-serif;
            text-transform: uppercase;
            min-width: 100px;
            margin-top: -20%;
            margin-left: 72%;
        }
        .m_button:hover .border{
            box-shadow: 0px 0px 10px 0px white;
        }
        .m_button:hover .border .left-plane, .m_button:hover .border .right-plane {
            transform: translateX(0%);
        }
        .m_button:hover .text {
            color: #121212;
        }
        .m_button .border{
            border: 1px solid white;
            transform: skewX(-20deg);
            height: 32px;
            border-radius: 3px;
            overflow: hidden;
            position: relative;
            transition: .10s ease-out;
        }
        .m_button .border .left-plane, .m_button .border .right-plane {
            position: absolute;
            background: white;
            height: 32px;
            width: 100px;
            transition: .15s ease-out;
        }
        .m_button .border .left-plane {
            left: 0;
            transform: translateX(-100%);
        }
        .m_button .border .right-plane {
            right: 0;
            transform: translateX(100%);
        }
        .m_button .text {
            position: absolute;
            left: 0;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            transition: .15s ease-out;
        }
        @media (max-width: 767px){
            .m_button{
                position: relative;
                cursor: pointer;
                display: inline-block;
                font-family: 'brandon-grotesque', sans-serif;
                text-transform: uppercase;
                min-width: 100px;
                text-align: center;
                margin: 0 auto;
                right: 0;
                left: 0;
            }
        }

        .x-mark {
            right: 10px;
            top: 50px;
            position: absolute;
            cursor: pointer;
            opacity: 0;
        }
        .x-mark:hover .right {
            transform: rotate(-45deg) scaleY(1.2);
        }
        .x-mark:hover .left {
            transform: rotate(45deg) scaleY(1.2);
        }
        .x-mark .container {
            position: relative;
            width: 20px;
            height: 20px;
        }
        .x-mark .left, .x-mark .right {
            width: 2px;
            height: 20px;
            background: white;
            position: absolute;
            border-radius: 3px;
            transition: .15s ease-out;
            margin: 0 auto;
            left: 0;
            right: 0;
        }
        .x-mark .right {
            transform: rotate(-45deg);
        }
        .x-mark .left {
            transform: rotate(45deg);
        }

        .sky-container {
            position: absolute;
            z-index:10;
            color: white;
            text-transform: uppercase;
            margin: 0 auto;
            right: 0;
            left: 0;
            top: 2%;
            text-align: center;
            opacity: 0;
        }
        @media screen and (min-width: 860px) {
            .sky-container {
                top: 18%;
                right: 12%;
                left: auto;
            }
        }
        .sky-container__left, .sky-container__right {
            display: inline-block;
            vertical-align: top;
            font-weight: bold;
        }
        .sky-container__left h2, .sky-container__right h2 {
            font-family: 'brandon-grotesque', sans-serif;
            font-size: 26px;
            line-height: 26px;
            margin: 0;
        }
        @media screen and (min-width: 860px) {
            .sky-container__left h2, .sky-container__right h2 {
                font-size: 72px;
                line-height: 68px;
            }
        }
        .sky-container__left {
            margin-right: 5px;
        }
        .sky-container .thirty-one {
            letter-spacing: 4px;
        }

        .text-right {
            text-align: right;
        }

        .text-left {
            text-align: left;
        }


.next{
    position: absolute;
    top:100%;
    width: 100%;
}


    </style>



</head>

<body >

<%@include file="/jsps/pager/header.jsp" %>


<!-- This pen isn't a fan of small view heights, check it out in  fullpage view for optimal viewing	 -->
<div id="canvas3d">
    <div class="x-mark">
        <div class="container">
            <div class="left"></div>
            <div class="right"></div>
        </div>
    </div>
    <div class="intro-container">

        <h1>SHIFU</h1>

        <div class="m_button shift-camera-button">
            <div class="border">
                <div class="left-plane"></div>
                <div class="right-plane"></div>
            </div>
            <div class="text">About Us</div>
        </div>

        <div class="search">
            <form class="form-wrapper cf" role="form" action="<c:url value='/ScholarServlet?'/>" method="get" id="searchForm">

                <input  type="hidden" name="method" value="findByAdvisee" />
                <input class="st"  type="text" name="advisee" placeholder=" scholar,paper,field,organization" />
                <%--Pages:<input type="text" name="pc" value="1" /><br>--%>
                <button type="submit" value="search" >search</button>

            </form>
        </div>
    </div>

    <div class="sky-container">
        <div class="text-right sky-container__left">
            <h2 class="portfolio">
                ADVISOR-ADVISEE
            </h2>
            <h2 class="resurrection">
                COWORKER
                <a href="${pageContext.request.contextPath}/resource/test.zip">Download the data!</a>

            </h2>
        </div>
        <div class="text-left sky-container__right">
            <!--h2 class="08">
                03
            </h2>
            <h2 class="thirty-one">
                31
            </h2>
            <h2 class="2016">
                2017
            </h2-->
        </div>
    </div>
</div>
<div class="container next">
    <div class="row" style="background-color: #4b586e ">
        <!-- effect-4 html -->
        <div class="col-sm-4">
            <div class="single-member effect-4">
                <div class="member-info">
                    <h3>Sophia</h3>
                    <h5>ShowGilr</h5>
                </div>
                <div class="member-image">
                    <img src="${pageContext.request.contextPath}/resource/paper.jpg" alt="Member">
                </div>
                <div class="more-info">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut . Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt.</p>
                    <div >
                        <a class="button" href="#">download</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- effect-4 html end -->
        <div class="col-sm-4">
            <div class="single-member effect-4">
                <div class="member-info">
                    <h3>Sophia</h3>
                    <h5>ShowGilr</h5>
                </div>
                <div class="member-image">
                    <img src="${pageContext.request.contextPath}/resource/paper.jpg" alt="Member">
                </div>
                <div class="more-info">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut . Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt.</p>
                    <div >
                        <a class="button" href="#">download</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="single-member effect-4">
                <div class="member-info">
                    <h3>Sophia</h3>
                    <h5>ShowGilr</h5>
                </div>
                <div class="member-image">
                    <img src="${pageContext.request.contextPath}/resource/paper.jpg" alt="Member">
                </div>
                <div class="more-info">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut . Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt.</p>
                    <div >
                        <a class="button" href="#">download</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.js"></script>

<script src=" ${pageContext.request.contextPath}/js/login.js" type="text/javascript"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script src='${pageContext.request.contextPath}/js/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/js/TweenMax.min.js'></script>
<script src='${pageContext.request.contextPath}/js/three.min.js'></script>

<script src="${pageContext.request.contextPath}/js/index.js"></script>

</body>
</html>