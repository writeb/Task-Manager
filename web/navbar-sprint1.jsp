<%@ page import="sprint1.db.User" %><%
  User currentUser = (User) session.getAttribute("currentUser");
%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/home-sprint1" style="color: green">Task Manager</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/home-sprint1">ALL Tasks</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/news">ALL News</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/authors">Authors</a>
        </li>
        <%
          if (currentUser !=null){
        %>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <%=currentUser.getUsername()%>
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="/profile">Profile </a></li>
              <li><a class="dropdown-item" href="/logout">Log out</a></li>
              <li><hr class="dropdown-divider"></li>
            </ul>
          </li>

        <%
          } else {
        %>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/login">Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/register">Register</a>
          </li>
        <%
          }
        %>
      </ul>
    </div>
  </div>
</nav>

