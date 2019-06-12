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
	<script type="text/javascript">
	</script>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">

							<table id="dynamic-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">序号</th>
										<th class='center'>姓名</th>
										<th class='center'>性别</th>
										<th class='center'>年龄</th>
										<th class='center'>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${not empty employeeList}">
									<c:forEach items="${employeeList}" var="employee" varStatus="vs">
									<tr>
										<td class='center'>${employee.ID }</td>
										<td class='center'>${employee.NAME }
										</td>
										<td class='center'>${employee.SEX }</td>
										<td class='center'>${employee.AGE }</td>
										<td class='center'>
										<a class="btn btn-mini btn-primary" onclick="editEmployee('${employee.ID }');">编辑</a>
										<a class="btn btn-mini btn-danger" onclick="deleteEmployee('${employee.ID }');">删除</a>
										</td>
									</tr>
									</c:forEach>
									</c:when>
										<c:otherwise>
											<tr>
											<td colspan="100" class='center'>没有相关数据</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<div>
								&nbsp;&nbsp;
								<a class="btn btn-sm btn-success" onclick="addEmployee();">新增</a>
								
							</div>
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
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	$(document).ready(function(){
		top.hangge();
	});	
		function addEmployee(){
			window.location.href="<%=basePath%>employee/toAdd.do";
		};
		function editEmployee(id){
			window.location.href="<%=basePath%>employee/toEdit.do?ID="+id;
		};
		function deleteEmployee(id){
			window.location.href="<%=basePath%>employee/deleteEmployee.do?ID="+id;
		};
		

	</script>


</body>
</html>