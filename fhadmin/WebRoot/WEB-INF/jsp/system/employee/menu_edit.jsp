<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
				
					<div class="page-header">
							<h1>
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									添加员工
								</small>
							</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">

						<form  action="employee/${MSG }.do" name="employeeForm" id="employeeForm" method="post" class="form-horizontal">
							<input type="hidden" value="${employee.ID }" name="ID">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 姓名 :</label>
								<div class="col-sm-9">
									<input type="text" name="NAME" id="name" placeholder="请输入姓名" class="col-xs-10 col-sm-5" value="${employee.NAME }"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">性别: </label>
								<div class="col-sm-9">
								<c:choose>
									<c:when test="${employee.SEX=='男'}">
										<label style="float:left;padding-left: 8px;padding-top:7px;">
										<input type="radio" class="ace" id="form-field-radio3" name="SEX" value="男" checked/>
										<span class="lbl"> 男</span>
									</label>
									</c:when>
									<c:otherwise>
										<label style="float:left;padding-left: 8px;padding-top:7px;">
										<input type="radio" class="ace" id="form-field-radio3" name="SEX" value="男"/>
										<span class="lbl"> 男</span>
									</label>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${employee.SEX=='女'}">
										<label style="float:left;padding-left: 5px;padding-top:7px;">
											<input  type="radio" class="ace" id="form-field-radio4" name="SEX" value="女" checked/>
											<span class="lbl"> 女</span>
										</label>
									</c:when>
									<c:otherwise>
										<label style="float:left;padding-left: 5px;padding-top:7px;">
											<input  type="radio" class="ace" id="form-field-radio4" name="SEX" value="女"/>
											<span class="lbl"> 女</span>
										</label>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 年龄 : </label>
								<div class="col-sm-9">
									<input type="number" name="AGE" id="age" placeholder="请输入年龄" title="请输入正整数" class="col-xs-10 col-sm-5" value="${employee.AGE }"/>
								</div>
							</div>
																			
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="goback();">取消</a>
								</div>
							</div>
							<div class="hr hr-18 dotted hr-double"></div>
						</form>

						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->


		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		//返回
		function goback(){
			window.location.href="<%=basePath%>employee.do";
		}
		
		//保存
		function save(){
			if($("#name").val()==""){
				$("#name").tips({
					side:3,
		            msg:'请输入姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#name").focus();
				return false;
			}
			if($("#age").val()==""){
				$("#age").tips({
					side:3,
		            msg:'请输入年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#age").focus();
				return false;
			}
			$("#employeeForm").submit();
		}
		
	</script>


</body>
</html>