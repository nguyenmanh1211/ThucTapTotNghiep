<%--
  Created by IntelliJ IDEA.
  User: MANH
  Date: 2/12/2020
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SQL Admin</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/normalize.css" />">
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/themify-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/flag-icon.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/css/cs-skin-elastic.css"/>">
    <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="<c:url value="/template/admin/assets/scss/style.css"/>">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body class="bg-dark">


<div class="sufee-login d-flex align-content-center flex-wrap">
    <div class="container">
        <div class="login-content">
            <div class="login-logo">
                <a href="index.html">
                    <img class="align-content" src="<c:url value="/template/img/sql.jpg"/>" alt="">
                </a>
            </div>
            <div class="login-form">
                <form:form action="/j_spring_security_check" method="post">
                    <div class="form-group">
                        <label>User Name</label>
                        <input type="text" class="form-control" placeholder="Email" name="userName">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" placeholder="Password" name="password">
                    </div>
<%--                    <div class="checkbox">--%>
<%--                        <label>--%>
<%--                            <input type="checkbox"> Remember Me--%>
<%--                        </label>--%>
<%--                        <label class="pull-right">--%>
<%--                            <a href="#">Forgotten Password?</a>--%>
<%--                        </label>--%>
<%--                    </div>--%>
                    <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Sign in</button>
                </form:form>
            </div>
        </div>
    </div>

</div>


<script src="<c:url value="/template/admin/assets/js/vendor/jquery-2.1.4.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/popper.min.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/plugins.js"/>"></script>
<script src="<c:url value="/template/admin/assets/js/main.js"/>"></script>


</body>
</html>
