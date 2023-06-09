<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="navbar-sprint1.jsp"%>
<%@page import="sprint1.db.Task" %>
<%@page import="java.util.ArrayList" %>
<html>
<head>
    <title>Title</title>
    <%@include file="head-sprint1.jsp"%>
</head>
<body>
    <div class="align-items-center" style="margin-left: 550px">
        <h4>Welcome to Task Manager</h4>
    </div>
    <div class="container">
        <div class="row mt-3">
            <div class="col-12">
                <%
                    if (currentUser != null) {
                %>
                    <%
                        if (currentUser.getRole()==1){
                    %>
                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addTask">
                            + Add Task
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="addTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Add Task</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <%@include file="addform_sprint1.jsp"%>
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
                        <th>TASK</th>
                        <th>DATE</th>
                        <th>DONE</th>
                        <th>AUTHOR</th>
                        <th width="10%">DESCRIPTION</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("tasks");
                        if (tasks!=null){
                            for (Task task : tasks){

                    %>
                    <tr>
                        <td><%=task.getId()%></td>
                        <td><%=task.getName()%></td>
                        <td><%=task.getDate()%></td>
                        <td><%=task.getFlag()%></td>
                        <td><%=task.getAuthor().getFirst_name() + " " +  task.getAuthor().getLast_name()%></td>
                        <td><a class="btn btn-success btn-sm" href="/details-sprint1?task_id=<%=task.getId()%>">DETAILS</a></td>
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
