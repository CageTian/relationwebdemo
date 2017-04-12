<%--
  Created by IntelliJ IDEA.
  User: xinna
  Date: 2017/3/23
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>relationshipTree</title>
</head>
<style>

    .node circle {
        /*stroke: steelblue;*/
        stroke-width: 1px;
        cursor:pointer;
    }

    .node {
        font: 12px sans-serif;
        display:block;
    }

    .hidenode {
        font: 12px sans-serif;
        display:none;
    }

    .link {
        fill: none;
        stroke: #ccc;
        stroke-width: 1px;
    }

</style>
<body>
<div class="tree" ></div>
<svg width="960" height="600"></svg>
<script src="http://d3js.org/d3.v3.min.js"></script>

<script src="${pageContext.request.contextPath}/js/common/relationshipTree.js" type="text/javascript"></script>
</body>
</html>
