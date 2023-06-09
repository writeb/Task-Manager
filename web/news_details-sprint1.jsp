<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="navbar-sprint1.jsp"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="sprint1.db.News" %>
<%@ page import="sprint1.db.Comment" %>
<html>
<head>
  <title>Title</title>
  <%@include file="head-sprint1.jsp"%>
</head>
<body>
<div class="container"> 
  <div class="row mb-5">
    <div class="col-12">
      <%
        News news = (News) request.getAttribute("news");
        if (news != null) {
      %>
      <div class="p-4 mt-3" style="background-color: #eaeeec; border-radius: 15px">
        <h3 readonly><%=news.getTitle()%></h3>
        <p readonly><%=news.getContent()%></p>
        <p readonly>
          Posted by <strong><%=news.getUser().getUsername()%></strong> at <%=news.getPost_date()%>
        </p>
        <%
          if (currentUser!=null && currentUser.getId()== news.getUser().getId()){
        %>
          <div>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary bnt-sm" data-bs-toggle="modal" data-bs-target="#editNews">
              EDIT
            </button>

            <!-- Modal -->
            <div class="modal fade" id="editNews" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <form action="/save-news" method="post">
                  <input type="hidden" name="id" value="<%=news.getId()%>">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit News</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <div class="row mt-3">
                        <div class="col-12">
                          <label>TITLE : </label>
                        </div>
                      </div>
                      <div class="row mt-2">
                        <div class="col-12">
                          <input type="text" required placeholder="Insert Title" class="form-control" name="news_title" value="<%=news.getTitle()%>">
                        </div>
                      </div>
                      <div class="row mt-3">
                        <div class="col-12">
                          <label>CONTENT : </label>
                        </div>
                      </div>
                      <div class="row mt-2">
                        <div class="col-12">
                          <textarea required placeholder="Insert Content" class="form-control" name="news_content" rows="10"><%=news.getContent()%></textarea>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                      <button class="btn btn-success">Edit</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        <%
          }
        %>
      </div>
      <%
        }
      %>
    </div>
    <%
      if (currentUser!=null){
    %>
    <div class="mt-2">
      <form action="/add-comment" method="post">
        <input type="hidden" name="news_id" value="<%=news.getId()%>">
        <div class="row">
          <div class="col-12">
            <textarea class="form-control" name="comment"></textarea>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <button class="btn btn-primary btn-sm">Add Comment</button>
          </div>
        </div>
      </form>
    </div>
    <%
      }
    %>
    <div class="row mt-1">
      <div class="col-12">
        <%
          ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comments");
          if (comments!=null){
            for (Comment comment : comments){
        %>
        <div class="list-group">
          <a href="JavaScript:void(0)" class="list-group-item list-group-item-action">
            <div class="d-flex w-100 justify-content-between">
              <h5 class="mb-1"><%=comment.getUser().getUsername()%></h5>
              <strong><small class="text-body-secondary"><%=comment.getDate()%></small></strong>
            </div>
            <p class="mb-1"><%=comment.getComment()%></p>
          </a>
        </div>
        <%
            }
          }
        %>
      </div>
    </div>
  </div>
</div>
</body>
</html>
