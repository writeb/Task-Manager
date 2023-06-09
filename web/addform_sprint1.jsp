<%@ page import="sprint1.db.Author" %>
<%@ page import="sprint1.db.DBConnection" %>
<form action="/add-task" method="post">
  <div class="row mt-3">
    <div class="col-12">
      <label>NAME : </label>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <input type="text" placeholder="Insert Name" class="form-control" name="task_name">
    </div>
  </div>
  <div class="row mt-3">
    <div class="col-12">
      <label>DESCRIPTION : </label>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <textarea placeholder="Insert Description" class="form-control" name="task_details" rows="5"></textarea>
    </div>
  </div>
  <div class="row mt-3">
    <div class="col-12">
      <label>DATE : </label>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
<%--      <textarea placeholder="mm/dd/yyyy" class="form-control" name="task_date" rows="5"></textarea>--%>
      <select class="form-select" name="task_date">
        <option>this week</option>
        <option>next week</option>
      </select>
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
            <option value="<%=author.getId()%>">
              <%=author.getFirst_name() + " " + author.getLast_name()%>
            </option>
        <%
            }
          }
        %>
      </select>
<%--      <input class="form-control" name="task_author" type="text" placeholder="Insert Author">--%>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <button class="btn btn-success">ADD TASK</button>
    </div>
  </div>
</form>