<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/3/21
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网页定位导航效果</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]><![endif]-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/guide.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/guide.js"></script>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="touming">
    <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Project Logo</a>
            </div>
            <div id="searchlocation">
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">search</button>
                </form>
            </div>
            <div class="collapse navbar-collapse">

                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-user"></span> Sign up</a>
                    </li>
                    <li >
                        <a href="#"><span class="glyphicon glyphicon-log-in"></span> Log in</a>
                    </li>
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-home"></span>Home</a>
                    </li>
                </ul>
            </div>
            <!-- /.nav-collapse -->
        </div>
        <!-- /.container -->
    </div>
</nav>
<div id="menu">
    <ul>
        <li><a href="#item1" class="current">1F </a></li>
        <li><a href="#item2">2F</a></li>
        <li><a href="#item3">3F</a></li>
        <li><a href="#item4">4F</a></li>
        <li><a href="#item5">5F</a></li>
    </ul>
</div>
<div id="content">
    <h1>地</h1>
    <div id="item1" class="item">
        <h2>1F</h2>
        <ul>
            <li><a href="#"><img src="img/1F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/1F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/1F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/1F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/1F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/1F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/1F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/1F.jpg" alt=""/></a></li>
        </ul>
    </div>
    <div id="item2" class="item">
        <h2>2F </h2>
        <ul>
            <li><a href="#"><img src="img/2F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/2F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/2F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/2F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/2F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/2F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/2F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/2F.jpg" alt=""/></a></li>
        </ul>
    </div>
    <div id="item3" class="item">
        <h2>3F </h2>
        <ul>
            <li><a href="#"><img src="img/3F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/3F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/3F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/3F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/3F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/3F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/3F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/3F.jpg" alt=""/></a></li>
        </ul>
    </div>
    <div id="item4" class="item">
        <h2>4F </h2>
        <ul>
            <li><a href="#"><img src="img/4F.png" alt=""/></a></li>
            <li><a href="#"><img src="img/4F.png" alt=""/></a></li>
            <li><a href="#"><img src="img/4F.png" alt=""/></a></li>
            <li><a href="#"><img src="img/4F.png" alt=""/></a></li>
            <li><a href="#"><img src="img/4F.png" alt=""/></a></li>
            <li><a href="#"><img src="img/4F.png" alt=""/></a></li>
            <li><a href="#"><img src="img/4F.png" alt=""/></a></li>
            <li><a href="#"><img src="img/4F.png" alt=""/></a></li>
        </ul>
    </div>
    <div id="item5" class="item">
        <h2>5F</h2>
        <ul>
            <li><a href="#"><img src="img/5F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/5F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/5F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/5F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/5F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/5F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/5F.jpg" alt=""/></a></li>
            <li><a href="#"><img src="img/5F.jpg" alt=""/></a></li>
        </ul>
    </div>
</div>
<!-- jQuery (Bootstrap 插件需要引入) -->
<script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 包含了所有编译插件 -->
<script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
