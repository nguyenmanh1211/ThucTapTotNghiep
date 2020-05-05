<%--
  Created by IntelliJ IDEA.
  User: MANH
  Date: 2/14/2020
  Time: 8:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SQL Master</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<c:url value="/template/img/sql.jpg"/>">
    <link rel="shortcut icon" href="<c:url value="/template/img/sql.jpg"/>">

    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/normalize.css"/>">
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/themify-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/flag-icon.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/cs-skin-elastic.css"/>">
    <link rel="stylesheet"
          href="<c:url value="/template/admin/assets/css/lib/datatable/dataTables.bootstrap.min.css"/>">
    <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/scss/style.css"/>">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    <script src="<c:url value="/template/ckeditor/ckeditor.js"/> "></script>
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<script type="text/javascript">
    function get(lessonId) {
        var id = lessonId;
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/api?id=" + id + " ",
            dataType: "json",
            success: function (response) {
                var id = response.id;
                var name = response.nameLesson;
                var t = response.tutorial;
                document.getElementById('ls_id_ud').value = id;
                document.getElementById('ls_name_ud').value = name;
                document.getElementById('cke_tutorial_ud').value = t;
                CKEDITOR.instances.tutorial_ud.setData( t, function()
                {
                    this.checkDirty();  // true
                });
            },
            error: function (response) {
                console.log("failed");
                console.log(response);
            }
        });
    }
</script>
<body>
<!-- Left Panel -->

<%@include file="admin/menu.jsp" %>
<!-- /#left-panel -->

<!-- Left Panel -->

<!-- Right Panel -->

<div id="right-panel" class="right-panel">

    <!-- Header-->
    <%@include file="admin/header.jsp" %>
    <!-- /header -->
    <div class="breadcrumbs">
        <div class="col-sm-4">
            <div class="page-header float-left">
                <div class="page-title">
                    <h1>Dashboard</h1>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="page-header float-right">
                <div class="page-title">
                    <ol class="breadcrumb text-right">
                        <li class="active">Dashboard</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Lesson Table</strong>
                            <button style="float: right" type="button" class="btn btn-success btn-sm"
                                    data-toggle="modal"
                                    data-target="#exampleModalScrollable"><i
                                    class="fa fa-plus"></i>&nbsp; Thêm
                            </button>
                        </div>
                        <div class="card-body">
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Lesson Name</th>
                                    <%--                                    <th>Tutorial</th>--%>
                                    <th>Database</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody class="data_table">
                                <c:forEach items="${lessons}" var="lesson">
                                    <tr>
                                        <td>${lesson.id}</td>
                                        <td>${lesson.nameLesson}</td>
                                        <td>${database.name}</td>
                                        <td>
                                            <a href="/admin/lessonProperties?id=${lesson.id}">
                                                <button type="button" class="fa fa-eye"></button>
                                            </a>
                                            <button type="button" class="fa fa-pencil" data-toggle="modal"
                                                    data-target="#myModal" onclick="get(${lesson.id})">
                                            </button>
                                            <a onclick="return confirm('Bạn có muốn xóa không?')"
                                               href="/del?id=${lesson.id}">
                                                <button class="fa fa-trash"></button>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- .content -->
</div><!-- /#right-panel -->
<!-- Right Panel -->

<!-- Modal Insert -->
<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content" style="width: 180%; left: -33%;">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalScrollableTitle">Thêm Bài Viết</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form action="/insertLesson" method="get" class="form-horizontal"
                       modelAttribute="lesson">
                <div class="modal-body">
                    <div class="row form-group">
                        <div class="col col-md-3"><label for="ls_name_ud"
                                                         class=" form-control-label">Name</label>
                        </div>
                        <div class="col-12 col-md-9"><input type="text" id="ls_name"
                                                            name="nameLesson"
                                                            placeholder="Enter lesson name..."
                                                            class="form-control"></div>
                        <div class="col-12 col-md-9">
                            <label for="tutorial_ud">Tutorial:</label>
                            <br>
                            <textarea name="tutorial" id="tutorial"
                                      rows="9"
                                      placeholder="Tutorial..."
                                      class="form-control"></textarea>
                            <br>
                        </div>
                    </div>
                    <div class="col-12 col-md-9"><input type="text" id="db_ID" name="databaseID"
                                                        placeholder="Enter database id..."
                                                        class="form-control" hidden value="${database.id}">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form:form>
        </div>
    </div>
</div>

<!-- Modal Update -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content" style="width: 180%; left: -33%;">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Update Bài Viết</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form action="/updateLesson" method="get" class="form-horizontal"
                       modelAttribute="lesson">
                <div class="modal-body">
                    <div class="row form-group">
                        <div class="col col-md-3"><label for="ls_name_ud"
                                                         class=" form-control-label">Name</label>
                        </div>
                        <div class="col-12 col-md-9"><input type="text" id="ls_name_ud"
                                                            name="nameLesson"
                                                            placeholder="Enter lesson name..."
                                                            class="form-control"></div>
                        <div class="col-12 col-md-9">
                            <label for="tutorial_ud">Tutorial:</label>
                            <br>
                            <textarea name="tutorial" id="tutorial_ud"
                                      rows="9"
                                      placeholder="Tutorial..."
                                      class="form-control"></textarea>
                            <br>
                        </div>
                    </div>
                    <input type="text" id="ls_id_ud" name="id" hidden>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
<!-- Script -->
<script src="<c:url value="/template/admin/assets/js/vendor/jquery-2.1.4.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/popper.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/plugins.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/main.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/lib/data-table/datatables.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/lib/data-table/dataTables.bootstrap.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/lib/data-table/dataTables.buttons.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/lib/data-table/buttons.bootstrap.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/lib/data-table/jszip.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/lib/data-table/pdfmake.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/lib/data-table/vfs_fonts.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/lib/data-table/buttons.html5.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/lib/data-table/buttons.print.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/lib/data-table/buttons.colVis.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/lib/data-table/datatables-init.js"/>"></script>
</body>
<script type="text/javascript">
    var editor = ""
    $(document).ready(function () {
        editor = CKEDITOR.replace('tutorial');
    });
</script>
<script type="text/javascript">
    var editor = ""
    $(document).ready(function () {
        editor = CKEDITOR.replace('tutorial_ud');

    });
</script>
</html>
