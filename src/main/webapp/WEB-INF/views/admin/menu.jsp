<%--
  Created by IntelliJ IDEA.
  User: MANH
  Date: 2/14/2020
  Time: 8:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div class="scroll">
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu"
                        aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="/home"><img src="<c:url value="/template/img/sql.jpg"/>" alt="Logo"></a>
                <a class="navbar-brand hidden" href="/home"><img src="<c:url value="/template/admin/images/logo2.png"/>"
                                                                 alt="Logo"></a>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/admin/home"> <i class="menu-icon fa fa-dashboard"></i>Trang Chủ</a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false"> <i class="menu-icon fa fa-clipboard"></i>Bài Viết</a>
                        <ul class="sub-menu children dropdown-menu">
                            <c:forEach items="${menu}" var="item">
                                <li>
                                    <i class="fa fa-database"></i>
                                    <a href="/admin/databases?databaseName=${item.name}">${item.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="/admin/database"> <i class="menu-icon fa fa-database"></i>Database</a>
                    </li>
                    <li class="active">
                        <a href="/admin/feedback"> <i class="menu-icon fa fa-user"></i>Phản Hồi</a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </nav>
</aside>
