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
    <script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/vegas.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/flat-ui.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/Font-Awesome/css/font-awesome.css" rel="stylesheet"
          type="text/css">
    <link href="css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css">

    <title>驴友网</title>
</head>


<jsp:include page="layout/head.jsp"></jsp:include>

<div class="container">

    <div class="content-header">

        <img src="img/logo.jpg" style="width: 150px;height: 150px ;margin-top: 150px;border: 1px solid #DDDDDD;">
    </div>
    <div style="margin-top: 10px">
        <div style="margin-left: 180px">
            <h3 >发布新活动----我们走 我们走!</h3></br>
            <div>
                今日帖子:&nbsp;&nbsp;&nbsp;&nbsp;
                总帖子:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                总活动:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                会员人数:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </div>


    <div class="add-activity">

        <form>
            <div class="form-group">
                <label >主题</label>
                <input type="text" class="form-control"  placeholder="主题">
            </div>
            <div class="form-group">
                <label >活动地址</label>
                <input type="text" class="form-control"  placeholder="想去哪里">
            </div>
            <div class="form-group">
                <label >每人开销</label>
                <input type="text" class="form-control"  placeholder="花费多少">
            </div>
            <div class="form-group">
                <label >需求人数</label>
                <input type="text" class="form-control"  placeholder="人数">
            </div>
            <div class="form-group">
                <label for="dtp_input2">报名截止日期</label>
                <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input4" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                <input type="hidden" id="dtp_input4" value="" /><br/>
            </div>
            <div class="form-inline" style="margin-bottom: 30px">
                <div class="form-group">
                    <label for="dtp_input2">开始时间</label><br>
                    <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                        <input class="form-control" size="16"style="width: 300px" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <input type="hidden" id="dtp_input2" value="" /><br/>
                </div>
                <div class="form-group" style="">
                    <label for="dtp_input2">结束时间</label><br>
                    <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input3" data-link-format="yyyy-mm-dd">
                        <input class="form-control" size="16" style="width: 300px" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <input type="hidden" id="dtp_input3" value="" /><br/>
                </div>
            </div>

             <div class="form-group">
                 <label>介绍本次活动</label>
                 <div class="alert alert-alert alert-danger"  id="danger-alert" style="display: none">

                     <a href="#" data-dismiss="alert" class="close">×</a>
                     <p id="word-alert"></p>

                 </div>

                     <textarea  id="content-textarea" class="form-control"   style="height: 300px; width:100%;resize: none;"></textarea>



             </div>


            <button type="submit" class="btn btn-default">提交</button>
        </form>


    </div>

</div>

<jsp:include page="layout/foot.jsp"></jsp:include>
<script>

    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,

    })

</script>
<script>
    CKEDITOR.replace('content-textarea');
    window.setInterval(function(){
    datebig()
    },60);
    function datebig() {
    var date3 = $("#dtp_input3").attr("value");
    var date2 = $("#dtp_input2").attr("value");
    var date1 = $("#dtp_input4").attr("value");
    if (date3 < date2) {
        $("#word-alert").html("结束日期不能小于出发日期!");
        $("#danger-alert").show();
    }
    else{

        $("#danger-alert").hide();
    }
}
</script>

</body>

</html>