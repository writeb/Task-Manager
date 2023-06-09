<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="navbar-sprint1.jsp"%>
<%@page import="sprint1.db.Author" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="sprint1.db.News" %>
<html>
<head>
    <title>Title</title>
    <%@include file="head-sprint1.jsp"%>
</head>
<body>
<div class="container">
    <form action="/news" method="get">
        <div class="row mt-3">
            <div class="col-5">
                <%
                    String key = request.getParameter("key");
                    if (key==null){
                        key = "";
                    }
                %>
                <input type="search" class="form-control" name="key" placeholder="Search" value="<%=key%>">
            </div>
            <div class="col-3">
                <button class="btn btn-success">Search</button>
            </div>
        </div>
    </form>
    <div class="row mt-3">
        <div class="col-12">
            <%
                if (currentUser!=null){
            %>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addNews">
                + Add News
            </button>

            <!-- Modal -->
            <div class="modal fade" id="addNews" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Add Task</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <%@include file="addnews-sprint1.jsp"%>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
    <div class="row mb-5">
        <div class="col-12">
            <%
                ArrayList<News> news = (ArrayList<News>) request.getAttribute("news");
                if (news != null) {
//                    System.out.println(news.size());
                    for (News n : news){
            %>
                    <div class="p-4 mt-3" style="background-color: #eaeeec; border-radius: 15px">
                        <a href="/news-details?id=<%=n.getId()%>">
                            <h3><%=n.getTitle()%></h3>
                        </a>
                        <p><%=n.getContent()%></p>
                        <p>
                            Posted by <strong><%=n.getUser().getUsername()%></strong> at <%=n.getPost_date()%>
                        </p>
                    </div>
                    <%
                        if (currentUser!=null){
                    %>
                        <div class="mt-1">
                            <form action="/add-comment" method="post">
                                <input type="hidden" name="news_id" value="<%=n.getId()%>">
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
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
