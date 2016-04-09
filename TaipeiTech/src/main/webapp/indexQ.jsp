<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC的CRUD、jquery的AJAX、Json方法</title>
<!-- <link rel="shortcut icon" href="圖示網址/favicon.ico" /> -->
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-1.12.0.min.js"></script>
<style>
#updateEmp>input {
	width: 100px;
}
</style>
</head>


<script>
	$(function() {

	})
</script>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h2>請輸入資料庫名稱</h2>
					</div>
					<div class="panel-body">
						<form class="navbar-form navbar-left" role="search"
							action="queryDb" method="post">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="先別用我"
									name="dbname">
							</div>
							<button type="submit" class="btn btn-default">搜尋</button>
						</form>
					</div>
					<div class="panel-body">
						<form class="navbar-form navbar-left" role="search"
							action="queryEmp" method="post">
							<button type="submit" class="btn btn-default">Emp</button>
						</form>
					</div>
				</div>

			</div>


		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<table class="table table-striped">
				<tr>
					<td class="active">選項</td>
					<td class="active">員工編號</td>
					<td class="active">員工名字</td>
					<td class="active">員工工作</td>
					<td class="success">負責人</td>
					<td class="active">雇用日期</td>
					<td class="warning">薪資</td>
					<td class="warning">獎金</td>
					<td class="warning">部門名稱</td>
					<td class="warning">更改</td>
				</tr>
<form action='RetainCheckboxValue' method='POST'>
				<c:choose>
					<c:when test="${not empty etb}">
						<c:forEach var='ee' varStatus='vs' items='${etb}'>
							<form id="updateEmp" action="updateEmp" method="post">
								<%-- 								<input type="hidden" name="pk" value="${ee.empno}"> <input
									type="hidden" name="plName" value="${ee.ename}"> <input
									type="hidden" name="plClass" value="${ee.job}"> <input
									type="hidden" name="plName" value="${ee.mgr}"><input
									type="hidden" name="time" value="${ee.hiredate}"> <input
									type="hidden" name="plNo" value="${ee.sal}"><input
									type="hidden" name="plNo" value="${ee.comm}"><input
									type="hidden" name="plNo" value="${ee.deptno}"> --%>

								<tr>
									<td><input type="checkbox" name="ckbox"></td>
									<td class="active"><input
										class="empno" type="text" name="empno" value="${ee.empno}"></td>
									<td id="ename" class="active"><input class="ename"
										name="ename" type="text" value="${ee.ename}"></td>
									<td id="magic2" class="active"><input class="job"
										name="job" type="text" value="${ee.job}"></td>
									<td class="success"><input class="mgr" name="mgr"
										type="text" value="${ee.mgr}"></td>
									<td class="active"><input id="ss" class="wone"
										name="hiredate" type="text" value="${ee.hiredate}"></td>
									<td class="warning"><input id="magicComment" type="text"
										name="sal" value="${ee.sal}"></td>
									<td class="warning"><input id="magicComment" type="text"
										name="comm" value="${ee.comm}"></td>
									<td class="warning"><input id="magicComment" type="text"
										name="deptno" value="${ee.deptno}"></td>
									<td class="warning">
										<button class="btn btn-default" type="submit">更改</button>
									</td>
								</tr>
							</form>
						</c:forEach>
<button class="btn btn-default" type="submit">刪除</button>
</form>

					</c:when>

					<c:otherwise>
						<h2>請按一下emp</h2>
					</c:otherwise>
				</c:choose>

			</table>
		</div>
	</div>


</body>
</html>

