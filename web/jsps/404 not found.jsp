<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/404.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/guide.css">

</head>
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
                        <a href="#" id="Button1" value="signup" onclick="window.open('regist.jsp')"><span class="glyphicon glyphicon-user" ></span> Sign up</a>
                    </li>
                    <li >
                        <a href="#" data-toggle="modal" data-target="#mymodal-data" id="Button2" value="login" onclick="ShowDiv('MyDivLogin','fade')"><span class="glyphicon glyphicon-log-in" ></span> Log in</a>
                    </li>
                    <li>
                        <a href="welcome.jsp"><span class="glyphicon glyphicon-home" ></span>Home</a>
                    </li>
                </ul>
            </div>
            <!-- /.nav-collapse -->
        </div>
        <!-- /.container -->
    </div>
</nav>
<body>
<nav class="shelf">
    <a class="book home-page" href="user/welcome.jsp">HOME</a>


    <span class="book not-found"></span>

    <span class="door left"></span>
    <span class="door right"></span>
</nav>
<h1>Error 404</h1>
<p>This page can't be found</p>

</body>
</html>