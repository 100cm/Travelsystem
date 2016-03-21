<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%String path = request.getContextPath(); %>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/vegas.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/main.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/vegas.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/flat-ui.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">

    <title>驴友网</title>
</head>


<jsp:include page="layout/head.jsp"></jsp:include>

<div class="container">

    <div class="panel devise-panel" style="margin-top: 40px">
        <div class="panel-heading text-center">
            <a href="#" class="sign-title">
                注册
            </a>
        </div>
        <div class="panel-body">


<form action="/register.do" id="register-form" method="get">
    <div class="alert alert-alert alert-danger"  id="danger-alert" style="display: none">

        <a href="#" data-dismiss="alert" class="close">×</a>
        <p id="word-alert"></p>

    </div>
            <div class="form-group has-feedback">
                <input class="form-control" placeholder="邮箱" type="text" name="email">
                <ul class="parsley-errors-list"></ul>
                <i class="fa fa-envelope-o form-control-feedback text-muted"></i>
            </div>
            <div class="form-group has-feedback">
                <input class="form-control" placeholder="昵称" name="username">
                <ul class="parsley-errors-list"></ul>
                <span class="fa fa-envelope form-control-feedback text-muted "style="top:10px"></span>
            </div>

            <div class="form-group has-feedback">
                <input class="form-control"  type="password"  id="password" placeholder="密码" name="password">
                <ul class="parsley-errors-list"></ul>
                <span class="fa fa-user  form-control-feedback text-muted"style="top:10px"></span>
            </div>

            <div class="form-group has-feedback">
                <input class="form-control"  type="password" id="repassword" placeholder="确认密码">
                <ul class="parsley-errors-list"></ul>
                <span class="fa fa-user form-control-feedback text-muted"style="top:10px"></span>
            </div>






            <button type="button"  onclick="register()" class="btn btn-block btn-primary mt-lg">注册</button>
            <p class="pt-lg text-center" style="margin-top: 10px;">已有账号?</p>
            <a href="/sign_up.do" class="btn btn-block btn-default">登录</a>

</form>



        </div>
    </div>



</div>
<script language="JavaScript">

    function register(){
       if($("#password").val() == $("#repassword").val()){

           $("#register-form").submit();

       } else{
           $("#word-alert").html("两次密码不一致");
           $("#danger-alert").show();


       }



    }

</script>

<jsp:include page="layout/foot.jsp"></jsp:include>

</body>

</html>