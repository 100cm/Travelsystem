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
    <c:forEach var="list" items="${requestScope.activity}"  varStatus="status">
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
                <a  style="color: #888 ;" href="/single_activity.do?id=${status.current.id}"><c:out value="${status.current.theme}"></c:out>
                </a></div>
            </div>
            <div class="paper item-body">
              <div class="content-inner">

                <c:out value="${status.current.introduce}" escapeXml="false"></c:out>
              </div>

              <div class="content-time"><fmt:formatDate value="${status.current.createdAt}" type="date"></fmt:formatDate>
              </div>

              <div class="content-author"><c:out value="${status.current.createdByName}"></c:out></div>
            </div>
            <%--<c:if test="${status.current.img !=''}">--%>
              <%--<div class="paper item-image">--%>
                <%--<c:out value="${status.current.img}" escapeXml="false"></c:out>--%>
              <%--</div>--%>
            <%--</c:if>--%>
            <div style="clear: both"></div>
          </div>



        </div>
      </div>
    </c:forEach>


    <div style="clear: both;"></div>


  </div>

</div>


<jsp:include page="layout/foot.jsp"></jsp:include>

</body>

</html>