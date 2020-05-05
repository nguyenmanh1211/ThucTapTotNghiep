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

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
<script type="text/javascript">
    function get(ID) {
        var id = ID;
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/dataJs?id=" + id + " ",
            dataType: "json",
            success: function (response) {
                var id = response.id;
                var name = response.name;
                document.getElementById('db_ID_ud').value = id;
                document.getElementById('db_name_ud').value = name;
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
    <%@include file="admin/header.jsp"%>
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
                            <strong class="card-title">Database Table</strong>
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
                                    <th>Database Name</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody class="data_table">
                                <c:forEach items="${list}" var="item">
                                    <tr>
                                        <td>${item.id}</td>
                                        <td>${item.name}</td>
                                        <td>
                                            <button type="button" class="fa fa-pencil" data-toggle="modal"
                                                    data-target="#myModal" onclick="get(${item.id})">
                                            </button>
                                            <a href="/api/delete/${item.id}"
                                               onclick="return confirm('Bạn có muốn xóa không?')">
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
<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalScrollableTitle">Thêm Database</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form action="/api/insert" method="get" class="form-horizontal"
                       modelAttribute="database">
                <div class="row form-group">
                    <div class="col col-md-3"><label for="db_name"
                                                     class=" form-control-label">Name</label></div>
                    <div class="col-12 col-md-9"><input type="text" id="db_name" name="name"
                                                        placeholder="Enter database name..."
                                                        class="form-control"></div>
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
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Update database</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form action="/api/update" method="get" class="form-horizontal"
                       modelAttribute="database">
            <div class="row form-group">
                <div class="col col-md-3"><label for="db_name_ud"
                                                 class=" form-control-label">Name</label></div>
                <div class="col-12 col-md-9"><input type="text" id="db_name_ud" name="name"
                                                    placeholder="Enter database name..."
                                                    class="form-control"></div>
            </div>
            <div class="col-12 col-md-9"><input type="text" id="db_ID_ud" name="id"
                                                placeholder="Enter database id..."
                                                class="form-control" hidden value="${id}"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
        </div>
        </form:form>
    </div>
</div>

</div>


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


<script type="text/javascript">
    $(document).ready(function () {
        $('#bootstrap-data-table-export').DataTable();
    });

</script>


</body>
</html>

