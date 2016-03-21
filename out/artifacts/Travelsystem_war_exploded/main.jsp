<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
        <div style="margin-left: 180px">
            <h3 >驴友网----我们走 我们走!</h3></br>
            <div>
                欢迎您:${user.username}&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </div>

    <div class="ad-panel">
      <div class="ad-left">
          <img src="img/ad2.gif" alt="">
      </div>
<div class="ad-right">
    <img src="img/ad2.gif" alt="">
</div>
    </div>
    <div class="ad-panel">
        <img src="img/ad1.gif" alt="">
    </div>
<div style="clear: both">
</div>

<div class="main-header">
最新资讯</div>
    <div class="main-panel">
       <div class="col-sm-4">

           <div class="panel " style="color: black">
               <div class="panel-heading" style="color: black">
                   <h3 class="panel-title">最新活动</h3>
               </div>
               <div class="panel-body" style="color: #888">
                   <c:forEach var="articles" items="${requestScope.articles}"  varStatus="status">

                       <div class="custom-list-group">
                           <a href="/article.do?id=${status.current.id}">${status.current.title}</a>
                        <span><fmt:formatDate value="${status.current.createdAt}" type="date"></fmt:formatDate>
                           </span>
                           <div style="clear: both"></div>
                       </div>
                   </c:forEach>

               </div>

           </div>
       </div>
        <div class="col-sm-4">

            <div class="panel " style="color: black">
                <div class="panel-heading" style="color: black">
                    <h3 class="panel-title">最新帖子</h3>
                </div>
                <div class="panel-body" style="color: #888">
                    <c:forEach var="articles" items="${requestScope.articles}"  varStatus="status">

                    <div class="custom-list-group">
                        <a href="/article.do?id=${status.current.id}">${status.current.title}</a>
                        <span><fmt:formatDate value="${status.current.createdAt}" type="date"></fmt:formatDate>
                           </span>
                        <div style="clear: both"></div>
                    </div>
                    </c:forEach>

                </div>

            </div>
        </div>
        <div class="col-sm-4">

            <div class="panel " style="color: black">
                <div class="panel-heading" style="color: black">
                    <h3 class="panel-title">最热景点</h3>
                </div>
                <div class="panel-body" style="color: #888">
                    <c:forEach var="articles" items="${requestScope.articles}"  varStatus="status">

                        <div class="custom-list-group">
                            <a href="/article.do?id=${status.current.id}">${status.current.title}</a>
                        <span><fmt:formatDate value="${status.current.createdAt}" type="date"></fmt:formatDate>
                           </span>
                            <div style="clear: both"></div>
                        </div>
                    </c:forEach>

                </div>

            </div>
        </div>


        <div style="clear: both"></div>



    </div>


    <div class="main-header">
        最新景点
    </div>
    <div class="main-panel">
       <div class="img-ul">
           <div><img src="img/tietu1.jpg" alt=""></div>
           <div><img src="img/tietu2.jpg" alt=""></div>
           <div><img src="img/tietu3.jpg" alt=""></div>
           <div><img src="img/tietu4.jpg" alt=""></div>
           <div><img src="img/tietu5.jpg" alt=""></div>



       </div>



        <div style="clear: both"></div>
    </div>
</div>

<jsp:include page="layout/foot.jsp"></jsp:include>

</body>

</html>