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

        <img src="img/cat_logo.png" style="width: 150px;height: 150px ;margin-top: 150px;border: 1px solid #DDDDDD;">
    </div>
    <div style="margin-top: 10px">
        <div style="margin-left: 180px">
            <h3 >${user.username}----我们走 我们走!</h3></br>
            <div>

            </div>
        </div>
    </div>
    <div class="new-action">

        <button class="btn btn-large btn-block btn-primary" onclick="javascript:window.location.href='/activity.jsp'">发起新活动</button>

    </div>
    <c:forEach  var="list" varStatus="status" items="${requestScope.joins}" >
    <div class="profile-message">

        <div class="message-action">
            <span>参与了:</span>
        </div>
        <div class="message-title">

            <a href="#">${status.current.theme}！</a>

        </div>
        <div class="message-time">

            <p>2012-10-10</p>

        </div>

    </div>
</c:forEach>



<div style="clear: both"></div>


</div>

<jsp:include page="layout/foot.jsp"></jsp:include>

</body>

</html>