<%@ page import="sprint1.db.Task"%>
<%@ page import="sprint1.db.Author" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="navbar-sprint1.jsp"%>
<%@ include file="head-sprint1.jsp"%>

<html>
<head>
    <title>Title</title>

</head>
<body>
    <div class="container mt-5">
        <%
            Task task = (Task)request.getAttribute("task");
            if (task!=null){
        %>
            <div class="row">
                <div class="col-6 mx-auto">
                    <div class="row mt-3">
                        <div class="col-12">
                            <label>NAME : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input type="text" placeholder="Insert Name" class="form-control" name="task_name" readonly value="<%=task.getName()%>">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <label>DESCRIPTION : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input class="form-control" readonly value="<%=task.getDescription()%>" name="task_details" type="text">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <label>DATE : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input class="form-control" readonly value="<%=task.getDate()%>" name="task_date" type="text">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <label>DONE : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input class="form-control" name="task_done" type="text" readonly value="<%=task.getFlag()%>">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <label>AUTHOR : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input class="form-control" name="task_author" type="text" readonly value="<%=task.getAuthor().getFirst_name() + " "+ task.getAuthor().getLast_name()%>">
<%--                            <input class="form-control" name="task_author" type="text" readonly value="<%=task.getAuthor()%>">--%>
                        </div>
                    </div>
                    <%
                        if (currentUser!=null && currentUser.getRole()==1){
                    %>
                        <div class="row mt-3">
                            <div class="col-12">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editTask">
                                    EDIT
                                </button>
                                <button type="button" class="btn btn-danger ms-2" data-bs-toggle="modal" data-bs-target="#deleteTask">
                                    DELETE
                                </button>
                                <div class="modal fade" id="deleteTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="/delete-task" method="post">
                                                <input type="hidden" name="task_id" value="<%=task.getId()%>">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Confirm delete</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <h5 class="text-center">Are you sure?</h5>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                                                    <button class="btn btn-danger">YES</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="editTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="">Modal title</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="/edit-task" method="post">
                                                    <input type="hidden" name="task_id" value="<%=task.getId()%>">
                                                    <div class="row mt-3">
                                                        <div class="col-12">
                                                            <label>NAME : </label>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <input type="text" placeholder="Insert Name" class="form-control" name="task_name" value="<%=task.getName()%>">
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col-12">
                                                            <label>DESCRIPTION : </label>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <input placeholder="Insert Description" class="form-control" name="task_details" rows="5" value="<%=task.getDescription()%>">
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col-12">
                                                            <label>DATE : </label>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <select class="form-select" name="task_date" value="<%=task.getDate()%>">
                                                                <option>this week</option>
                                                                <option>next week</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col-12">
                                                            <label>AUTHOR : </label>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <select class="form-select" name="task_author">
                                                                <%
                                                                    ArrayList<Author> authors = (ArrayList<Author>) request.getAttribute("authors");
                                                                    if (authors!=null){
                                                                        for (Author author : authors){
                                                                %>
                                                                            <option <%=(author.getId()==task.getAuthor().getId()?"selected":"")%> value="<%=author.getId()%>">
                                                                                <%=author.getFirst_name() + " " + author.getLast_name()%>
                                                                            </option>
                                                                <%
                                                                        }
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col-12">
                                                            <label>DONE : </label>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <select class="form-select" name="task_done" value="<%=task.getFlag()%>">
                                                                <option>NO</option>
                                                                <option>YES</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <button class="btn btn-success">EDIT TASK</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%
                        }
                    %>
                </div>
            </div>

        <%
        } else {
        %>
            <h4>TASK NOT FOUND</h4>
        <%
            }
        %>
    </div>
</body>
