<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String path=request.getContextPath(); %>

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

<div class="custom-content">

    <div class="container">
        <div class="col-md-8">
        </div>
        <div class="col-md-4">
            <div class="panel panel-default welcome-panel">
                <div class="panel-heading">
                    欢迎来到驴友网！
                </div>

                <div class="panel-body" style="padding: 0px 15px">
                    <form id="sign_in-form">
                        <div class="form-group has-feedback">
                        <div class="alert alert-alert alert-danger"  id="danger-alert" style="display: none">

                            <a href="#" data-dismiss="alert" class="close">×</a>
                            <p id="word-alert"></p>

                        </div>
                        </div>
                    <div class="form-group has-feedback">
                        邮箱:
                    <input class="form-control" type="email" name="email" placeholder="邮箱">
                    </div>

                    <div class="form-group has-feedback" style="margin-bottom: 0;">
                        密码:
                        <input class="form-control" type="password"  name="password"  placeholder="密码">
                    </div>

                    <div class="checkbox c-checkbox pull-left mt0">
                        <label>
                            <input type="checkbox" value="记住我">
                            记住我</label>
                    </div>

                    <div class="pull-right" style="display: none;">
                        <a href="#" class="text-muted">Forget password?</a>
                    </div>

                    <button class="btn btn-primary btn-block" onclick="submit_sign_in_form()" type="button" >登录 </button>

                </form>

                    <p class="pt-lg text-center" style="margin-top: 10px;">没有账号?</p>
                    <a href="/register.jsp" class="btn btn-block btn-default" style="margin-bottom: 10px ">现在注册</a>

                </div>
            </div>
        </div>
    </div>

</div>

<jsp:include page="layout/foot.jsp"></jsp:include>
<script>
    $(".custom-content").vegas({
        slides: [
            { src: "/img/slider/travel1.jpg" },
            { src: "/img/slider/travel3.jpg" },
            { src: "/img/slider/travel2.jpg" },
            { src: "/img/slider/travel5.jpg" },
            { src: "/img/slider/travel6.jpg" },

        ]
    });


    function submit_sign_in_form(){


        $.ajax({
            type:'get',

            url:'/signin.do',

            data:$("#sign_in-form").serialize(),

            success:function(msg){
                console.log(msg);

                if(msg.msg=="success"){

                    window.location.href="/login.do";
                }
                else if(msg.msg=="error"){

                    $("#word-alert").html("密码错误");
                    $("#danger-alert").show();

                }else if(msg.msg=="none"){
                    $("#word-alert").html("账号不存在");

                    $("#danger-alert").show();

                }


            }


        })


    }


</script>



</body>

</html>