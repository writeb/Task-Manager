<%--
  Created by IntelliJ IDEA.
  User: rauanamantaiuly
  Date: 21.05.2023
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="navbar-sprint1.jsp"%>
<html>
<head>
    <title>Title</title>
    <%@include file="head-sprint1.jsp"%>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-12 mx-auto">
            <h1>Hello <%=currentUser!=null?currentUser.getUsername():""%></h1>
        </div>
    </div>
</div>
</body>
</html>
