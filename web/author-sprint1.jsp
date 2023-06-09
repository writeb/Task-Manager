<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="navbar-sprint1.jsp"%>
<%@page import="sprint1.db.Author" %>
<%@page import="java.util.ArrayList" %>
<html>
<head>
    <title>Title</title>
    <%@include file="head-sprint1.jsp"%>
</head>
<body>
    <div class="container">
        <div class="row mt-3">
            <div class="col-12">
                <%
                    if (currentUser!=null){
                %>
                    <%
                        if (currentUser.getRole() == 1){
                    %>
                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addAuthor">
                            + Add Author
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="addAuthor" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Add Task</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <%@include file="addauthor_sprint1.jsp"%>
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
                <%
                    }
                %>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-12">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Author> authors = (ArrayList<Author>) request.getAttribute("authors");
                        if (authors!=null){
                            for (Author author : authors){

                    %>
                    <tr>
                        <td><%=author.getId()%></td>
                        <td><%=author.getFirst_name()%></td>
                        <td><%=author.getLast_name()%></td>

                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
