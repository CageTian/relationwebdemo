<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>信息板</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	  <!-- Latest compiled and minified CSS -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css
">

	  <!-- Optional theme -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css
">

<style type="text/css">
	body {
		font-size: 10pt;
		color: #404040;
		font-family: SimSun;
	}
	
	.m_p {
		position: absolute;
		width: 50%;
		height: 70%;
		margin-left:25%;
		margin-top :10%;
	}
	
	.divTitle {
		/*position: relative;*/
		text-align:left;

		height: 20%;
		/*line-height: 25px;*/
		background-color: #bdbfc2;
		border: 5px solid #bdbfc2;
	}
	.divContent {
		/*position: relative;*/
		height:80%;
		border: 5px solid #bdbfc2;

	}
	.spanTitle {
		/*margin-top: 10px;*/
		margin-left:10px;
		/*height:25px;*/
		font-weight: 900;
	}
	img{
		float: left;
		margin-left: 10%;
		width: 20%;
	}
a {text-decoration: none;}
a:visited {color: #018BD3;}
a:hover {color:#FF6600; text-decoration: underline;}

</style>

  </head>
  
  <body>
  <%@include file="/jsps/pager/header.jsp" %>
  <c:choose>
  	<c:when test="${code eq 'success' }"><%--如果code是功能，它显示对号图片 --%>
  		<c:set var="img" value="/resource/success.png"/>
  		<c:set var="title" value="SUCCESS"/>
  	</c:when>
  	<c:when test="${code eq 'error' }"><%--如果code是功能，它显示错号图片 --%>
  		<c:set var="img" value="/resource/fail.png"/>
  		<c:set var="title" value="FAIL"/>
  	</c:when>
  	
  </c:choose>
<div class="panel panel-default m_p">
	<div class="panel-heading">
		<%--<span class="spanTitle">--%>
			<h3 class="panel-title">
				${title }</h3>
			<%--</span>--%>
	</div>
	<div class="panel-body">
	  <div style="margin: 20px;">
		<img  src="<c:url value='${img }'/>"/>
		<span style="font-size: 30px; color: #c30; font-weight: 900;">${msg }</span>
		<br/>
		<br/>
		<br/>
		<br/>
		<span style="margin-left: 50px;"><a target="_top" href="<c:url value='/jsps/user/login.jsp'/>">LOGIN</a></span>
		<span style="margin-left: 50px;"><a target="_top" href="${pageContext.request.contextPath}/jsps/welcome.jsp">HOME</a></span>
	  </div>
	</div>
</div>


  </body>
</html>
