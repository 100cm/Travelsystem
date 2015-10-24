<%--
  Created by IntelliJ IDEA.
  User: icepoint
  Date: 8/18/15
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

  %>

  <nav class="navbar custom">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">驴友网</a>
    </div>
<c:if test="${is_login ==true}">
  <!-- Collect the nav links, forms, and other content for toggling -->
  <div  class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


    <div class="left-div">
      <ul class="nav navbar-nav navbar-left">
        <li  <c:choose>
          <c:when test="${main_active==true}"> class="active"</c:when><c:otherwise>class="not-active"</c:otherwise></c:choose> ><a onlick="javascript:;" href="/main.do">首页<span class="sr-only">(current)</span></a></li>
        <li   <c:choose>
          <c:when test="${profile_active==true}"> class="active"</c:when><c:otherwise>class="not-active"</c:otherwise></c:choose>><a onlick="javascript:;" href="/profile.do">个人中心</a></li>

        <li   <c:choose>
          <c:when test="${club_active==true}"> class="active"</c:when><c:otherwise>class="not-active"</c:otherwise></c:choose>><a onlick="javascript:;" href="/club.do">社区</a></li>
      </ul>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a>寻找驴友</a></li>
      <li><a>旅游胜地</a></li>
      <li><a>旅游公司</a></li>
    </ul>
  </div><!-- /.navbar-collapse -->

</c:if>

  </div><!-- /.container-fluid -->
</nav>

