<%--
  Created by IntelliJ IDEA.
  User: xinna
  Date: 2017/4/10
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>coworker circle</title>
</head>
<style>


    .links line {
        stroke: #999;
        stroke-opacity: 0.6;
    }

    .nodes circle {
        stroke: #fff;
        stroke-width: 1.5px;
    }

</style>
<body>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/coworker_circle.js" type="text/javascript"></script>

</body>
</html>
