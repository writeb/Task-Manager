<form action="/add-news" method="post">
  <div class="row mt-3">
    <div class="col-12">
      <label>TITLE : </label>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <input type="text" placeholder="Insert Title" class="form-control" name="news_title" required>
    </div>
  </div>
  <div class="row mt-3">
    <div class="col-12">
      <label>CONTENT : </label>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <textarea placeholder="Insert Content" class="form-control" name="news_content" rows="10" required></textarea>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <button class="btn btn-success">ADD POST </button>
    </div>
  </div>
</form>