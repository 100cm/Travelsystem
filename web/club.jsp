<%@ page import="com.zhou.service.UserService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%String path = request.getContextPath(); %>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/vegas.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/main.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js" type="text/javascript"></script>
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
        <div style="margin-left: 180px">
        <h3 >驴友网----我们走 我们走!</h3></br>
            <div>
                欢迎您:${user.username}&nbsp;&nbsp;&nbsp;&nbsp;
                今日帖子:&nbsp;&nbsp;&nbsp;&nbsp;
                总帖子:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                总活动:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                会员人数:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
</div>
    </div>




    <div class="content-body">
        <c:forEach var="list" items="${requestScope.list}"  varStatus="status">
        <div class="content-item">
            <div class="row">
                <div class="col-sm-1">
                    <div class="reply_image">
                1111
                    </div>
                </div>
            <div class="col-sm-11">
              <div class="paper item-header">
                  <div class="content-title">
                      <a  style="color: #888 ;" href="/article.do?id=${status.current.id}"><c:out value="${status.current.title}"></c:out>
                      </a></div>
              </div>
                <div class="paper item-body">
                    <div class="content-inner">

                        <c:out value="${status.current.content}" escapeXml="false"></c:out>
                    </div>

                    <div class="content-time"><fmt:formatDate value="${status.current.createdAt}" type="date"></fmt:formatDate>
                    </div>

                    <div class="content-author"><c:out value="${status.current.authorname}"></c:out></div>
                </div>
                <c:if test="${status.current.img !=''}">
                <div class="paper item-image">
                    <c:out value="${status.current.img}" escapeXml="false"></c:out>
                </div>
                </c:if>
                <div style="clear: both"></div>
            </div>



</div>
        </div>
</c:forEach>


        <div style="clear: both;"></div>


    </div>
    <div class="page-control">
        <nav>
            <ul class="pagination" style="float: right">
                <li>
                    <a href="/club.do?page=${pre_page}" aria-label="上一页">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
               <c:choose>
                   <c:when test="${total_page>=5}">
                       <li><a href="/club.do?page=${page_num}">${page_num}</a></li>
                       <li><a href="/club.do?page=${page_num+1}">${page_num+1}</a></li>
                       <li><a href="/club.do?page=${page_num+2}">${page_num+2}</a></li>
                       <li><a href="/club.do?page=${page_num+3}">${page_num+3}</a></li>
                       <li><a href="/club.do?page=${page_num+4}">${page_num+4}</a></li>
                   </c:when>

                   <c:when test="${total_page<5}">
                       <c:forEach var="item" varStatus="status" begin="1" end="${total_page}">
                           <li><a href="/club.do?page=${item}">${item}</a></li>
                       </c:forEach>
                   </c:when>

               </c:choose>


                <li>
                    <a href="/club.do?page=${next_page}" aria-label="下一页">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <form action="/new_article.do" id ="new_article" method="post">
    <div class="new-content">
<h5>发布新帖:</h5></br>
        <div class="alert alert-alert alert-danger"  id="danger-alert" style="display: none">

            <a href="#" data-dismiss="alert" class="close">×</a>
            <p id="word-alert"></p>

        </div>
        主题:
        <input class="form-control"  id="article_title"  name="title" style="margin-bottom: 20px">


    </div>
    <div>

        <textarea  name="maincontent" id="content-textarea" class="form-control" style="height: 300px; width:100%;resize: none;"></textarea>

    </div>
    <div>
        <button  style="float: right;" class="btn btn-large  btn-primary"  type="button" onclick="new_article()">发布</button>

    </div>
    </form>

</div>

<script>
    CKEDITOR.replace('content-textarea');


    function new_article(){
        console.log($("#content-textarea").val())

        if($("#article_title").val()!=""){
            for(instance in CKEDITOR.instances)
            CKEDITOR.instances[instance].updateElement()

            $("#new_article").submit();
        }else{

            $("#word-alert").html("标题或者内容不得为空");
            $("#danger-alert").show();
        }




    };
  
</script>

<jsp:include page="layout/foot.jsp"></jsp:include>

</body>

</html>