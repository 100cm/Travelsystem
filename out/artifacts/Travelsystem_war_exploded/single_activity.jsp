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

    <h6>活动主题:${activity.theme}</h6>

  </div>

    <div class="apply-floor" >
      <div class="author-avator">
        <div class="avator">
        </div>
        <div class="author-name">
          ${activity.createdByName}
        </div>
      </div>

      <div class="apply-body">
          活动地址： ${activity.location}</br>
          每人开销: ${activity.spend}</br>
          需求人数：${activity.needPerson}</br>
          活动介绍：${activity.introduce}</br>
        <div class="apply-button">
            <%--<a href="#">回复</a>--%>
        </div>

      </div>

      <div style="clear: both"></div>

    </div>


  <div>
    <button  style="float: right;" class="btn btn-large  btn-primary"  type="button" onclick="new_comment(${activity.id},'${user.id}')">我要参加这个活动</button>

  </div>

</div>


<jsp:include page="layout/foot.jsp"></jsp:include>

<script>
  function new_comment(article_id,userid){

    $.ajax({
              url:"/new_join_activity.do",

              type:"post",

              data:{"articleId":article_id,"userid":userid},

              success:function(data){

                if(data.message=="success"){
                  window.location.href="/single_activity.do?id="+article_id;
                }else{

                  alert("你已经报过名了")
                }


              }

            }

    )

  }


</script>

</body>

</html>