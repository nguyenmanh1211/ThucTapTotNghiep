<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    $(document).on('click','ul li a',function () {
        $('a').removeClass('active')
        $(this).addClass('active')
    })
</script>
<nav class="navbar navbar-expand-lg navbar-dark bg-success fixed-top header">
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a href="/home"><img class="logo" src="<c:url value="/template/img/sql.jpg"/> "></a>
    <div class="collapse navbar-collapse " id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto justify-content-center item-menu">
            <li class="nav-item">
                <a class="nav-link active" href="/home">Trang Chủ<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Database
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                    <c:forEach items="${menu}" var="item">
                        <a class="dropdown-item" href="/database?databaseName=${item.name}">${item.name}</a>
                    </c:forEach>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/contact">Liên Hệ<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/feedback">Phản Hồi<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login">Đăng Nhập<span class="sr-only">(current)</span></a>
            </li>
    </ul>
    <form:form class="form-inline my-2 my-lg-0" method="get" action="/searchLs">
        <input class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm..." aria-label="Search" name="text">
        <input type="hidden" name="page" value="0">
        <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Tìm kiếm</button>
    </form:form>
    </div>
</nav>