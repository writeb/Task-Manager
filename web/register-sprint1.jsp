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
<div class="align-items-center" style="margin-left: 550px">
  <h4>Welcome to registration page</h4>
</div>
<div class="container mt-5">
  <div class="row">
    <div class="col-6 mx-auto">
      <form action="/register" method="post">
        <div class="row mt-3">
          <div class="col-12">
            <label>USERNAME : </label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <input type="text" class="form-control" name="username" required placeholder="Insert Username">
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>PASSWORD : </label>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <input type="password" class="form-control" name="password" required placeholder="Insert Password">
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <button class="btn btn-success">SIGN UP</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
