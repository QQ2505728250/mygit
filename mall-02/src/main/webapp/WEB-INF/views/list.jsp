<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>员工列表</title>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!--	web路径问题
不以/开始的相对路径，找资源是以当前路径为基准，经常出现问题
以/开始的相对路径，找资源是以服务器的路径为基准（http://localhost:3306）,再加上自己的项目名 
 -->
<link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="${APP_PATH}/static/js/jquery.min.js"></script>
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>

		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button type="button" class="btn btn-primary">新增</button>
				<button type="button" class="btn btn-danger">删除</button>
			</div>
		</div>

		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>

					<c:forEach items="${pageInfo.list}" var="emp" >
						<tr>
						<th>${emp.empId}</th>
						<th>${emp.empName}</th>
						<th>${emp.gender=="M"?"男":"女"}</th>
						<th>${emp.email}</th>
						<th>${emp.department.deptName}</th>
						<th>
							<button type="button" class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>新增
							</button>
							<button type="button" class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
							</button>
						</th>
					</tr>
				</c:forEach>
				
				
				</table>
			</div>
		</div>

		<!-- 分页 -->
		<div class="row">
			<div class="col-md-6">
			当前第${pageInfo.pageNum}页，有${pageInfo.pages}页，共有${pageInfo.total}条记录</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span>
					</a></li>
					</c:if>
					
					<c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a href="#">${page_Num}</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<li><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
						</c:if>
					</c:forEach>
					
					
					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a></li>
					</c:if>
					
					
					<li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">尾页</a></li>
				</ul>
				</nav>
			</div>
		</div>

	</div>
</body>
</html>