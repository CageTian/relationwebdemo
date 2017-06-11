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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/guide_serch.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/welcome.css">

    <script>
        document.documentElement.className = 'js';
    </script>

    <style type="text/css">

        html{height:100%;}
        body {
            position: absolute;
            overflow: scroll;
            text-align:center;
            /*overflow: hidden;*/
            /*height:100%;*/
            background-color: #8888;
        }
        .m_ct{
            position: absolute;
            border: none;
            width:100%;
        }
        #canvas3d{
            position: absolute;
            top:0%;
            border: none;
            width:100%;
            /*height:100%;*/
        }
        @media (min-width: 992px) {
            #canvas3d {
                height:725px;
            }}
        @media (min-width: 1200px) {
            #canvas3d {
                height:900px;
            }}
        .intro-container {
            position: absolute;
            top: 35%;
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
        .sky-container .m_image{
            position:relative;
            right:0%;
            top:-25%;
            display: none;
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
    top:108%;
    border:0px;
    text-align:center;
    margin:0 auto;
    /*width: 100%;*/
    /*background: -moz-linear-gradient(top, #eaeaea 0%, #7f7f7f 100%);*/
    /*background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #eaeaea), color-stop(100%, #7f7f7f));*/
    /*background: -webkit-linear-gradient(top, #eaeaea 0%, #7f7f7f 100%);*/
    /*background: -o-linear-gradient(top, #eaeaea 0%, #7f7f7f 100%);*/
    /*background: -ms-linear-gradient(top, #eaeaea 0%, #7f7f7f 100%);*/
    /*background: linear-gradient(to bottom, #eaeaea 0%, #7f7f7f 100%);*/
}
.pingtai{
    position: relative;
    margin:0 auto;
    /*width: 100%;*/
    border:0px;
    background-image: url(${pageContext.request.contextPath}/resource/kongzi.jpg);
    background-repeat:no-repeat;
    background-size: 100% auto;
    border-radius: 7px;
    box-shadow: 0px 0px 10px #000;
    color:black;
    text-shadow: 0px 0px 3px #535c5e;
}
.fangfa{
    border:0px;
    background-image: url(${pageContext.request.contextPath}/resource/fangfabackground.jpg);
    background-repeat:no-repeat;
    background-size: 100% auto;
    border-radius: 7px;
    box-shadow: 0px 0px 10px #000;
    color: #e4e4e4;
}
@media (min-width: 768px){
    .pingtai {
        height:230px;
    }
    .fangfa{
        height:226px;
    }
}
@media (min-width: 992px) {
    .pingtai {
        height:295px;
    }
    .fangfa{
        height:292px;
    }
}
@media (min-width: 1200px) {
    .pingtai {
        height:360px;
    }
    .fangfa{
        height:354px;
    }
}

        .pingtai p,.fangfa p{

            font-size: large;
        }
/*.m_data{*/

    /*!*position: absolute;*/
    /*border: none;*/
    /*width: 100%;*!*/
    /*background-color: #535c5e;*/
/*}*/
        .m_ft{
font-size: 12px;
            background-color: #373f48;
margin-top: 20px;
            padding-left: 100px;
            color: #e0e0e0;
        position:absolute;
            width: 100%;

        }
    </style>



</head>

<body >

<%@include file="/jsps/pager/header.jsp" %>


<!-- This pen isn't a fan of small view heights, check it out in  fullpage view for optimal viewing	 -->
<script>
    function showsky()
    {
        var skyimage =document.getElementById("skyimage");
        skyimage.style.display="block";
    }
    function fadesky()
    {
        var skyimage=document.getElementById("skyimage");
        skyimage.style.display="none";
    }
</script>
<div id="canvas3d" >
    <div class="x-mark" onclick="fadesky()">
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
            <div class="text" onclick="showsky()">About Us</div>
        </div>

        <div class="search">
            <form class="form-wrapper cf" role="form" action="<c:url value='/ScholarServlet?'/>" method="get" id="searchForm">

                <input  type="hidden" name="method" value="findByAdvisee" />
                <input class="st"  type="text" name="advisee" placeholder=" scholar" />
                <%--Pages:<input type="text" name="pc" value="1" /><br>--%>
                <button type="submit" value="search" >search</button>

            </form>
        </div>
    </div>

    <div class="sky-container">
        <%--<div class="row m_image" id="skyimage">--%>
            <%--<section class="content content--c1">--%>
                <%--<div class="col-sm-3">--%>
                <%--<a href="#" class="tilter tilter--1">--%>
                    <%--<figure class="tilter__figure">--%>
                        <%--<img class="tilter__image" src="${pageContext.request.contextPath}/resource/JiayingLiu.jpg" alt="img01" />--%>
                        <%--<div class="tilter__deco tilter__deco--shine"><div></div></div>--%>
                        <%--<figcaption class="tilter__caption">--%>
                            <%--<h3 class="tilter__title">Jiaying Liu</h3>--%>
                            <%--<p class="tilter__description">Toronto</p>--%>
                        <%--</figcaption>--%>
                        <%--<svg class="tilter__deco tilter__deco--lines" viewBox="0 0 300 415">--%>
                            <%--<path d="M20.5,20.5h260v375h-260V20.5z" />--%>
                        <%--</svg>--%>
                    <%--</figure>--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--<div class="col-sm-3">--%>
                <%--<a href="#" class="tilter tilter--1">--%>
                    <%--<figure class="tilter__figure">--%>
                        <%--<img class="tilter__image" src="${pageContext.request.contextPath}/resource/KeHou.jpg" alt="img02" />--%>
                        <%--<div class="tilter__deco tilter__deco--shine"><div></div></div>--%>
                        <%--<figcaption class="tilter__caption">--%>
                            <%--<h3 class="tilter__title">Ke Hou</h3>--%>
                            <%--<p class="tilter__description">Stockholm</p>--%>
                        <%--</figcaption>--%>
                        <%--<svg class="tilter__deco tilter__deco--lines" viewBox="0 0 300 415">--%>
                            <%--<path d="M20.5,20.5h260v375h-260V20.5z" />--%>
                        <%--</svg>--%>
                    <%--</figure>--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--<div class="col-sm-3">--%>
                <%--<a href="#" class="tilter tilter--1">--%>
                    <%--<figure class="tilter__figure">--%>
                        <%--<img class="tilter__image" src="${pageContext.request.contextPath}/resource/15.jpg" alt="img02" />--%>
                        <%--<div class="tilter__deco tilter__deco--shine"><div></div></div>--%>
                        <%--<figcaption class="tilter__caption">--%>
                            <%--<h3 class="tilter__title">Kaiqi Tian</h3>--%>
                            <%--<p class="tilter__description">Stockholm</p>--%>
                        <%--</figcaption>--%>
                        <%--<svg class="tilter__deco tilter__deco--lines" viewBox="0 0 300 415">--%>
                            <%--<path d="M20.5,20.5h260v375h-260V20.5z" />--%>
                        <%--</svg>--%>
                    <%--</figure>--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--<div class="col-sm-3">--%>
                    <%--<a href="#" class="tilter tilter--1">--%>
                        <%--<figure class="tilter__figure">--%>
                            <%--<img class="tilter__image" src="${pageContext.request.contextPath}/resource/15.jpg" alt="img02" />--%>
                            <%--<div class="tilter__deco tilter__deco--shine"><div></div></div>--%>
                            <%--<figcaption class="tilter__caption">--%>
                                <%--<h3 class="tilter__title">Xinyu zhou</h3>--%>
                                <%--<p class="tilter__description">Stockholm</p>--%>
                            <%--</figcaption>--%>
                            <%--<svg class="tilter__deco tilter__deco--lines" viewBox="0 0 300 415">--%>
                                <%--<path d="M20.5,20.5h260v375h-260V20.5z" />--%>
                            <%--</svg>--%>
                        <%--</figure>--%>
                    <%--</a>--%>
                <%--</div>--%>
            <%--</section>--%>
        <%--</div>--%>
        <div class="text-right sky-container__left">
            <h2 class="portfolio">
                The Alpha Lab
            </h2>
            </div>
        <div class="text-left sky-container__right">
            <p style="padding-left: 100px"><br/>We are from The Alpha Lab. Our goal is to create innovation through conducting interdisciplinary, application-driven academic research. We are interested in a broad spectrum of cutting-edge research topics including social computing, computational social science, big data, and mobile social networks.</p>

        </div>
    </div>
</div>
<div class="container-fluid next">

    <!--平台介绍-->
    <div class="pingtai row">
        <div class="col-sm-8 col-sm-offset-4 col-md-8 col-md-offset-4 text-left">
            <br/>
            <h2 class="text-center">SHIFU</h2>
            <p>Advisor-advisee Relationships Visualization System Based on Scholarly Big Data</p>
            <p>Shifu is an online platform developed for the purpose of facilitating research for those who are interested in the areas regarding social and academic networks. Its main function is to find the scholar's advisor.Particularly, it includes:
            <p>-The scholar's details; the identification of the advisor;the visualization of some relevant data.</p>
            <p>-Introduction to xgboost classification algorithm. This algorithm is used to determine the probability that two scholars are advisor-advisee relationship.</p>
            <p>-A collection of datasets from DBLP dataset. We use this data set to extract features and to identify advisor-advisee relationships.</p>
        </div>
    </div>
    <br/>
    <!--数据集下载-->
    <div class="row" >
        <!-- effect-4 html -->
        <div class="col-sm-4 col-md-4">
            <div class="single-member effect-4">
                <div class="member-info">
                    <h3>Advisee-advisor</h3>
                    <h5>Relationship</h5>
                </div>
                <div class="member-image">
                    <img src="${pageContext.request.contextPath}/resource/data1.jpg" alt="Member">
                </div>
                <div class="more-info">
                    <p>This dataset is collected from DBLP dataset. From this dataset, We can find out that the two scholars are the possibility of the relationship between advisors and advisees, the year when they start cooperation, the year of cooperation and the corresponding number of cooperation. </p>
                    <div >
                        <a class="button" href="#">download</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- effect-4 html end -->
        <div class="col-sm-4 col-md-4">
            <div class="single-member effect-4">
                <div class="member-info">
                    <h3>Co-authorship</h3>
                    <h5>Networks</h5>
                </div>
                <div class="member-image">
                    <img src="${pageContext.request.contextPath}/resource/data2.jpg" alt="Member">
                </div>
                <div class="more-info">
                    <p>There is co-authorship network from DataBase systems and Logic Programming(DBLP).From this, we can construct a group of networks with equivalent sets of nodes, and we also find the number of advisee co-operatives, collaborators and the corresponding number of collaborations.</p>
                    <div >
                        <a class="button" href="#">download</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            <div class="single-member effect-4">
                <div class="member-info">
                    <h3>Publication</h3>
                    <h5>Record</h5>
                </div>
                <div class="member-image">
                    <img src="${pageContext.request.contextPath}/resource/data3.jpg" alt="Member">
                </div>
                <div class="more-info">
                    <p>This dataset is collected from DBLP dataset.From this dataset, we learn scholars' publication record.We can find the year when scholars begin to publish papers, the year they publish their papers and the corresponding number of papers.</p>
                    <div >
                        <a class="button" href="#">download</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--方法介绍-->
    <div class="row fangfa" style="padding-left: 100px;padding-right: 100px">
        <br />

        <h2>XGBOOST</h2>
        <br />

        <p class="text-left">XGBoost is short for "Extreme Gradient Boosting", where the term "Gradient Boosting" is proposed in the paper Greedy Function Approximation: A Gradient Boosting Machine, by Friedman.</p>
        <p class="text-left">XGBoost is based on this original model. More importantly, it is developed with both deep consideration in terms of systems optimization and principles in machine learning. The goal of this library is to push the extreme of the computation limits of machines to provide a scalable, portable and accurate library.</p>
        <p class="text-left">If you want to learn more about XGBoost， you can click this link:<a href="https://github.com/dmlc/xgboost/blob/master/doc/model.md" >https://github.com/dmlc/xgboost/blob/master/doc/model.md</a>
        </p>

    </div>

    <%--<footer class="container-fluid foot-wrap">--%>
        <%--<!--采用container，使得页尾内容居中 -->--%>
        <%--<div class="container">--%>
            <div class="row m_ft text-left">
                <h3>School of Software, Dalian University of Technology, Dalian 116620, China</h3>
                <h3>©The Alpha Lab; TheAlphaLab.org</h3>
                <h3>Contact: TheAlphaLab@outlook.com</h3>
                <br/><br/>
                <h3><em>Designed by Ke Hou</em></h3>
            </div>

            <%--</div><!--/.row -->--%>
        <%--</div><!--/.container-->--%>


    <%--</footer>--%>
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


    <%--鼠标悬停--%>
    <script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/anime.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>