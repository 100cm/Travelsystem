<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%String path = request.getContextPath(); %>
    <script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/vegas.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/main.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/vegas.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/flat-ui.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/Font-Awesome/css/font-awesome.css" rel="stylesheet"
          type="text/css">
    <title>驴友网</title>
</head>


<jsp:include page="layout/head.jsp"></jsp:include>

<div class="container">
    <div class="content-header">

        <img src="img/logo.jpg" style="width: 150px;height: 150px ;margin-top: 150px;border: 1px solid #DDDDDD;">
    </div>
    <div style="margin-top: 10px">
        <div style="margin-left: 180px ">
            <h3 >驴友网----想去哪,就去哪!</h3></br>
            <div>
                今日帖子:&nbsp;&nbsp;&nbsp;&nbsp;
                总帖子:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                总活动:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                会员人数:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </div>
    <div class="apply-header">

        <h6>帖子主题:${article.title} ${page}</h6>

    </div>

<c:choose>
    <c:when test="${page==1}">
        <div class="apply-floor" >
            <div class="author-avator">
                <div class="avator">
                </div>
                <div class="author-name">
                        ${article.authorname}
                </div>
            </div>

            <div class="apply-body">
                    ${article.maincontent}
                <div class="apply-button">
                    <%--<a href="#">回复</a>--%>
                </div>

            </div>

            <div style="clear: both"></div>

        </div>
    </c:when>

</c:choose>


    <c:forEach  var="list" varStatus="status" items="${requestScope.list}" >
    <div class="apply-floor" >
        <div class="author-avator">
            <div class="avator">
            </div>
            <div class="author-name">

                ${status.current.username}
            </div>
        </div>

        <div class="apply-body">
            ${status.current.content}
            <div class="apply-button">
                <%--<a href="#">回复</a>--%>
            </div>

        </div>

        <div style="clear: both"></div>

    </div>

    </c:forEach>

    <div class="page-control">
        <nav>
            <ul class="pagination" style="float: right">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:choose>
                    <c:when test="${total_page>=5}">
                        <li><a href="/article.do?page=${page_num}&id=${article.id}">${page_num}</a></li>
                        <li><a href="/article.do?page=${page_num+1}&id=${article.id}">${page_num+1}</a></li>
                        <li><a href="/article.do?page=${page_num+2}&id=${article.id}">${page_num+2}</a></li>
                        <li><a href="/article.do?page=${page_num+3}&id=${article.id}">${page_num+3}</a></li>
                        <li><a href="/article.do?page=${page_num+4}&id=${article.id}">${page_num+4}</a></li>
                    </c:when>

                    <c:when test="${total_page<5}">
                        <c:forEach var="item" varStatus="status" begin="1" end="${total_page}">
                            <li><a href="/article.do?page=${item}&id=${article.id}">${item}</a></li>
                        </c:forEach>
                    </c:when>

                </c:choose>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>


    <div class="new-content">
        <h6>发布回复:</h6></br>
    </div>

    <div>

        <textarea   id="content-textarea" class="form-control" style="height: 300px; width:100%;resize: none;"></textarea>

    </div>
    <div>
        <button  style="float: right;" class="btn btn-large  btn-primary"  type="button" onclick="new_comment(${article_id},'${user.username}')">发布</button>

    </div>
    <script>
        CKEDITOR.replace('content-textarea');

    </script>
    </div>


<jsp:include page="layout/foot.jsp"></jsp:include>

<script>
    function new_comment(article_id,username){
        console.log(username);
        console.log(article_id);

        for(instance in CKEDITOR.instances){
            CKEDITOR.instances[instance].updateElement()
        }

            var content=$("#content-textarea").val();

            console.log(content);

            $.ajax({
                url:"/new_comment.do",

                type:"post",

                data:{"content":content,"articleId":article_id,"username":username},

                success:function(data){

                    window.location.href="/article.do?id="+data.article_id;

            }

                    }

            )

    }


</script>

</body>

</html>