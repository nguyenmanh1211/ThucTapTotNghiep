<%@include file="/common/taglib.jsp" %>
<%@taglib prefix="tag" uri="/WEB-INF/user/taglib.tld" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SQL MASTER</title>
    <link rel="stylesheet" href="<c:url value="/template/css/bootstrap.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/template/css/style.css"/>"/>
    <link href="<c:url value="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap"/>" rel="stylesheet">
    <link href="<c:url value="https://fonts.googleapis.com/css?family=Noto+Serif&display=swap" />" rel="stylesheet">
    <link href="<c:url value="https://fonts.googleapis.com/css?family=Courier+Prime&display=swap"/>" rel="stylesheet">
    <link href="<c:url value="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap"/>"
          rel="stylesheet">
    <script src="<c:url value="/template/js/jquery-3.4.1.min.js"/>"></script>
    <script src="<c:url value="/template/js/popper.min.js"/>"></script>
    <script src="<c:url value="/template/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/template/js/style.js"/>"></script>
    <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"/>"></script>
    <script src="<c:url value="/template/js/jquery.twbsPagination.js"/>"></script>

</head>
<script type="text/javascript">
    var currentPage = ${page};
    var totalPages = ${limit};
    window.onload = function x() {
        if (currentPage == totalPages) {
            document.getElementById('next').hidden = true;
        }
    }
</script>
<body>
<!-- header -->
<div class="fixed-top">
    <section>
        <%@include file="user/menu.jsp" %>
    </section>
</div>
<!-- main -->

<div class="container-fluid main" id="col">
    <c:forEach items="${list}" var="item">
        <div class="div-search text-decoration-none border-bottom">
            <a href="/findLsById?id=${item.id}"><b>${item.nameLesson}</b></a><br>
            <a href="/findLsById?id=${item.id}"><textarea disabled class="textareaS"
                                                          style="background: #FFF">${item.tutorial}</textarea></a>
        </div>
    </c:forEach>
    <div id="div-page" style="margin-top: 20px">
        <ul class="pagination">
            <c:forEach items="${count}" var="item">
                <li class="page-item">
                    <a href="/searchLs?text=${offset}&page=${item}" class="page-link">
                        <td>${item+1}</td>
                    </a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="/searchLs?text=${offset}&page=${page+1}" id="next">Next</a>
            </li>
        </ul>
    </div>
</div>

</body>

</html>
