<%@include file="/common/taglib.jsp" %>
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
    <script>
        $(document).ready(function () {
            $("#btnc").click(function () {
                $.ajax({
                    url: "demo_test.html", success: function (result) {
                        document.getElementById("content").innerHTML = 'nam';
                    }
                });
            });
        });
    </script>


</head>
<body>
<!-- header -->
<div class="fixed-top">
    <section>
        <div>
            <%@include file="user/menu.jsp"%>
        </div>
    </section>
</div>
<div class="text-center border-dark" style="margin-top: 67px;background: rgb(232, 232, 232)">
    <h4>
        <label><b>Facebook: </b>&nbsp;</label><a href="${contact.facebook}">${contact.facebook}</a><br>
        <label><b>Email: </b>&nbsp;</label>${contact.email}<br>
        <label><b>Phone: </b>&nbsp;</label>${contact.phone}
    </h4>

</div>
<%@include file="user/footer.jsp"%>

</body>
</html>
