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
        function get(lessonId) {
            $('#lesson').val(lessonId);
            console.log($('#lesson').val());
            var id = lessonId;
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/api?id=" + id + " ",
                dataType: "json",
                success: function (response) {

                    // alert("ok"+response.nameLesson+" "+response.tutorial);
                    a = response.tutorial + '<div class="vj-note">\t\n' +
                        '\n' +
                        'Theo dõi chúng tôi miễn phí trên mạng xã hội facebook và youtube:\t<div class="share-vj" style="\n' +
                        '    display: flex;\n' +
                        '">\n' +
                        '\t\t<div class="fb-like fb_iframe_widget" data-href="https://www.facebook.com/hoc.cung.vietjack/" data-layout="button_count" data-action="like" data-size="small" data-show-faces="false" data-share="false" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&app_id=1642028219373274&container_width=773&href=https%3A%2F%2Fwww.facebook.com%2Fhoc.cung.vietjack%2F&layout=button_count&locale=vi_VN&sdk=joey&share=false&show_faces=false&size=small"><span style="vertical-align: bottom; width: 96px; height: 20px;"><iframe name="f2f61e73a944c28" width="1000px" height="1000px" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v2.12/plugins/like.php?action=like&app_id=1642028219373274&channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter.php%3Fversion%3D45%23cb%3Df20de1898136714%26domain%3Dvietjack.com%26origin%3Dhttps%253A%252F%252Fvietjack.com%252Ff164d4c0677409%26relation%3Dparent.parent&container_width=773&href=https%3A%2F%2Fwww.facebook.com%2Fhoc.cung.vietjack%2F&layout=button_count&locale=vi_VN&sdk=joey&share=false&show_faces=false&size=small" style="border: none; visibility: visible; width: 96px; height: 20px;" class=""></iframe></span></div>\n' +
                        '<div id="___ytsubscribe_0" style="text-indent: 0px; margin: 0px; padding: 0px; background: transparent; border-style: none; float: none; line-height: normal; font-size: 1px; vertical-align: baseline; display: inline-block; width: 117px; height: 24px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position: static; top: 0px; width: 117px; margin: 0px; border-style: none; left: 0px; visibility: visible; height: 24px;" tabindex="0" vspace="0" width="100%" id="I1_1582170073783" name="I1_1582170073783" src="https://www.youtube.com/subscribe_embed?usegapi=1&channelid=UCTmKz2bAMiz1Lb54z2gHjXg&layout=default&count=default&hl=vi&origin=https%3A%2F%2Fvietjack.com&gsrc=3p&ic=1&jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.ucQ2O9Ms-s8.O%2Fam%3DwQE%2Fd%3D1%2Fct%3Dzgms%2Frs%3DAGLTcCMNY0JNsSwg5V1ozLNl0nI1furXRA%2Fm%3D__features__#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&id=I1_1582170073783&_gfid=I1_1582170073783&parent=https%3A%2F%2Fvietjack.com&pfname=&rpctoken=25665795" data-gapiattached="true"></iframe></div>\n' +
                        '\t</div>\n' +
                        '\n' +
                        '\n' +
                        ' \n' +
                        '<p>Follow fanpage của team <a href="https://www.facebook.com/sql/">https://www.facebook.com/sql/ </a> hoặc facebook cá nhân Nguyễn Đức Mạnh <a href="https://www.facebook.com/manhhn121198">https://www.facebook.com/manh.sql </a>để tiếp tục theo dõi các loạt bài mới nhất về Database mới nhất của chúng tôi.\n' +
                        '</p>\n' +
                        '</div>'
                    $('#content').html(a);
                    // document.getElementById("content").innerHTML = a;


                },
                error: function (response) {
                    console.log("failed");
                    console.log(response);
                }
            });
        }

        $(document).on('click', 'ul li a', function () {
            $('a').removeClass('active')
            $(this).addClass('active')
        })
    </script>


</head>
<body>
<!-- header -->
<div class="fixed-top">
    <section>
        <%@include file="user/menu.jsp" %>
    </section>
</div>
<!-- main -->

<div class="container-fluid main" id="col">
    <div class="row">
        <div class="cola scroll">
            <!-- slidebar -->
            <ul class="sidebar navbar-nav">
                <li class="nav-item dropdown submenu" id="lia">
                    <c:forEach items="${lessons}" var="lesson">
                        <a class="nav-link subcontent xaxa" id="lesson" onclick="get(${lesson.id})">
                                ${lesson.nameLesson}
                        </a>
                    </c:forEach>
                </li>
            </ul>
        </div>
    </div>
    <div class="col-10 ml-auto content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12" data-spy="scroll" data-target="#list" data-offset="0" id="content">
                    ${ttra}
                    <div class="vj-note">
                        Theo dõi chúng tôi miễn phí trên mạng xã hội facebook và youtube:
                        <div class="share-vj" style="display: flex;">
                            <div class="fb-like fb_iframe_widget"
                                 data-href="https://www.facebook.com/hoc.cung.vietjack/" data-layout="button_count"
                                 data-action="like" data-size="small" data-show-faces="false" data-share="false"
                                 fb-xfbml-state="rendered"
                                 fb-iframe-plugin-query="action=like&amp;app_id=1642028219373274&amp;container_width=773&amp;href=https%3A%2F%2Fwww.facebook.com%2Fhoc.cung.vietjack%2F&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=false&amp;show_faces=false&amp;size=small">
                                <span style="vertical-align: bottom; width: 96px; height: 20px;"><iframe
                                        name="f2f61e73a944c28" width="1000px" height="1000px"
                                        title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true"
                                        allowfullscreen="true" scrolling="no" allow="encrypted-media"
                                        src="https://www.facebook.com/v2.12/plugins/like.php?action=like&amp;app_id=1642028219373274&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter.php%3Fversion%3D45%23cb%3Df20de1898136714%26domain%3Dvietjack.com%26origin%3Dhttps%253A%252F%252Fvietjack.com%252Ff164d4c0677409%26relation%3Dparent.parent&amp;container_width=773&amp;href=https%3A%2F%2Fwww.facebook.com%2Fhoc.cung.vietjack%2F&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=false&amp;show_faces=false&amp;size=small"
                                        style="border: none; visibility: visible; width: 96px; height: 20px;"
                                        class=""></iframe></span></div>
                            <div id="___ytsubscribe_0"
                                 style="text-indent: 0px; margin: 0px; padding: 0px; background: transparent; border-style: none; float: none; line-height: normal; font-size: 1px; vertical-align: baseline; display: inline-block; width: 117px; height: 24px;">
                                <iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0"
                                        scrolling="no"
                                        style="position: static; top: 0px; width: 117px; margin: 0px; border-style: none; left: 0px; visibility: visible; height: 24px;"
                                        tabindex="0" vspace="0" width="100%" id="I1_1582170073783"
                                        name="I1_1582170073783"
                                        src="https://www.youtube.com/subscribe_embed?usegapi=1&amp;channelid=UCTmKz2bAMiz1Lb54z2gHjXg&amp;layout=default&amp;count=default&amp;hl=vi&amp;origin=https%3A%2F%2Fvietjack.com&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.ucQ2O9Ms-s8.O%2Fam%3DwQE%2Fd%3D1%2Fct%3Dzgms%2Frs%3DAGLTcCMNY0JNsSwg5V1ozLNl0nI1furXRA%2Fm%3D__features__#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I1_1582170073783&amp;_gfid=I1_1582170073783&amp;parent=https%3A%2F%2Fvietjack.com&amp;pfname=&amp;rpctoken=25665795"
                                        data-gapiattached="true"></iframe>
                            </div>
                        </div>


                        <p>Follow fanpage của team <a
                                href="https://www.facebook.com/sql/">https://www.facebook.com/sql/ </a> hoặc facebook cá
                            nhân Nguyễn Đức Mạnh <a href="https://www.facebook.com/manhhn121198">https://www.facebook.com/manh.sql </a>để
                            tiếp tục theo dõi các loạt bài mới nhất về Database mới nhất của chúng tôi.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- End content -->
</div>


</body>
</html>
