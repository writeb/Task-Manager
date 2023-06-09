<%@ page import="sprint1.db.Author" %>
<form action="/add-author" method="post">
    <div class="row mt-3">
        <div class="col-12">
            <label>FIRST NAME : </label>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <input type="text" placeholder="Insert First Name" class="form-control" name="author_fname">
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-12">
            <label>LAST NAME : </label>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <input type="text" placeholder="Insert Last Name" class="form-control" name="author_lname">
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <button class="btn btn-success">ADD TASK</button>
        </div>
    </div>
</form>