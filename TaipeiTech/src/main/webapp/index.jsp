<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC的CRUD、jquery的AJAX、Json方法。</title>
<!-- <link rel="shortcut icon" href="圖示網址/favicon.ico" /> -->
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-1.12.0.min.js"></script>
<style>
.empno{
width: 80px;
}
.ename{
width: 80px;
}
td{
text-align:center;
}
.comm{
width: 80px;
}
.deptno{
width: 50px;
}
/* input[type="text"] {
    width: 167px;
} */

</style>
</head>


<script>
	$(function() {
		//var it = $( "form[id^=updateEmp] :input[id^=i]" );
		//var ef = $("form[id^=updateEmp]");

		//console.log($ip.eq(2).val());
		//for ( var i in $ip) {
		//console.log($ip.eq(i).val());
		//console.log($ip.eq(2).val());
		//}

		//console.log(ip.eq(0).val());
		//console.log("value:"+it.eq(0)(0).val());
		//if(ip.eq(0).val()==="KINGE"){
		//$(this.td).css("background-color", "lightgray");
		//}
		//var $ip = $("input[class^=ename]");
		//console.log($ip);

		$("form").submit(function() {
			switch (this.id) {
			//gg的神奇小按鈕
			/* 			case "magic":
			 var $mname = $('#mname').val();
			 console.log($mname);
			 $('#magic1').val($mname);
			 $('#magic2').val($mname);
			 $('#magic3').val($mname); */
			//return false;
			//			case "search":
			//				var $int = $('#int').val();
			// var $pattern = /^[1-9]$|^[1-9][0-9]$|^56[0-3]$/;
			// $int.trim().length == 0 || 
			//				if (!$pattern.test($int)) {
			//					alert("請檢察格式是否正確");
			//					return false;
			//			} else {
			//					return true;
			//				}
			case "updateEmp":
				//var $ue = $("#updateEmp");
				//for(var i in $ue){
				//	console.log($ue.eq(i));
				//}
				var $ip = $("input[class^=ename]");

				//var $ip = $("input[class^=ename]");
				//for(var i in $ip){
				//	console.log($ip.eq(i).val());
				//}
				//console.log($ip.eq(2).val());
				var $pattern = /^[a-z][a-z\d]*$/i;
				//index = $(this).find($ip).index();
				index = $(this).index()-1;
				//console.log(index);
				//if(index/2 != 0){

				//}
				console.log($ip.eq(index).val());
				console.log("now form index is:" + index)
				if (!$pattern.test($ip.eq(index).val())) {
					alert('檢查格式是否正確！');
					$ip.eq(index).css("background-color", "red").focus();
					return false;
				} else {
					alert("輸入完成!!轉回原先頁面");
					return true;
				}
				//		var x = "intscore" + index;
				//		var newQty = document.getElementById(x).value;

				//				console.log($('#intscore'));
				//				if (!$pattern.test($int)) {

				//					alert("請檢察分數格式是否正確");
				//					return false;
				//			} else {
				//第一種
				//alert("輸入完成!!轉回搜尋頁面");
				//第二種
				//				alert("輸入完成!!轉回原先頁面");
				//			}
				//					return true;
				//			case "getall":
				//return true;

				// var $lg_password = $('#login_password').val();
				//  var $Check_ver = $('#Check_ver').val();
				//  if ($lg_username == "ERROR") {
				//  msgChange($('#div-login-msg'),
				//  $('#icon-login-msg'),
				//  $('#text-login-msg'), "error",
				//  "glyphicon-remove", "Login error");
				//  } else {
				//  msgChange($('#div-login-msg'),
				//  $('#icon-login-msg'),
				//  $('#text-login-msg'), "success",
				//  "glyphicon-ok", "Login OK");
				//  }
				//  if ($Check_ver !== "java001Class") {
				//  msgChange($('#div-login-msg'),
				//  $('#icon-login-msg'),
				//  $('#text-login-msg'), "error",
				//  "glyphicon-remove", "驗證錯誤");

				//  return false;
				//  } else {
				//  msgChange($('#div-login-msg'),
				//  $('#icon-login-msg'),
				//  $('#text-login-msg'), "success",
				//  "glyphicon-ok", "驗證中....");
				//  return true;
				//  }
				// return false;
			case "qEmp":
				return true;
			default:
				return false;
			}

		});

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
						<form id="qEmp" class="navbar-form navbar-left" role="search"
							action="queryEmp" method="post">
							<button type="submit" class="btn btn-default">Emp</button>
						</form>
					</div>
				</div>

			</div>


		</div>
	</div>
<!-- 該死的BUG，Table不可以把form包起來 -->
	<div class="container-fluid">
		<div class="row">
			<c:choose>
				<c:when test="${not empty etb}">
					<table class="table table-striped">
						<tr>
							<td class="active empno">員工編號</td>
							<td class="active ename">員工名字</td>
							<td class="active">員工工作</td>
							<td class="success">負責人</td>
							<td class="active">雇用日期</td>
							<td class="warning">薪資</td>
							<td class="warning comm">獎金</td>
							<td class="warning deptno">部門名稱</td>
							<td class="warning">更改</td>
						</tr>
									</table>
						<c:forEach var='ee' varStatus='vs' items='${etb}'>
							<FORM id="updateEmp" action="updateEmp" method="post">
							<table class="table table-striped">
							<tr>
								<td class="active"><input class="empno"
									type="text" name="empno" value="${ee.empno}"></td>
								<td class="active"><input class="ename" name="ename"
									type="text" value="${ee.ename}"></td>
								<td id="magic2" class="active"><input
									class="job${vs.count}" name="job" type="text" value="${ee.job}"></td>
								<td class="success"><input class="mgr${vs.count}"
									name="mgr" type="text" value="${ee.mgr}"></td>
								<td class="active"><input class="hiredate${vs.count}"
									name="hiredate" type="text" value="${ee.hiredate}"></td>
								<td class="warning"><input class="sal${vs.count}"
									type="text" name="sal" value="${ee.sal}"></td>
								<td class="warning"><input class="comm"
									type="text" name="comm" value="${ee.comm}"></td>
								<td class="warning"><input class="deptno"
									type="text" name="deptno" value="${ee.deptno}"></td>
								<td class="warning">
									<button class="btn btn-default" type="submit">更改</button>
									<button class="btn btn-default" type="submit">刪除</button>
								</td>
							</tr>
							</table>
							</FORM>
						</c:forEach>
				</c:when>
				<c:otherwise>
					<h2>請按一下emp</h2>
				</c:otherwise>
			</c:choose>


		</div>
	</div>


</body>
</html>

