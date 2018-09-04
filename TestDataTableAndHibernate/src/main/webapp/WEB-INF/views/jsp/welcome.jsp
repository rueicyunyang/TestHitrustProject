 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--<c:url var="home" value="/" scope="request" />-->
<title>Spring MVC 4 + Ajax Hello World</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
	<META HTTP-EQUIV="EXPIRES" CONTENT="0">
	<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">-->

<link href="<c:url value='/resources/core/css/bootstrap.min.css'/>" rel="stylesheet" />
<script src="<c:url value='/resources/core/js/jquery.1.10.2.min.js'/>"></script>
</head>

<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Spring 4 MVC Ajax Hello World</a>
		</div>
	</div>
</nav>

<div class="container" style="min-height: 500px">

	<div class="starter-template">
		<h1>Search Form</h1>
		<br>

		<div id="feedback"></div>

		<!-- <form class="form-horizontal" id="search-form1" action="<% request.getContextPath();%>/user.do" method="post"> -->
		<!-- <form class="form-horizontal" id="search-form1" action="<%= request.getContextPath()%>/user.do" method="post">-->
		<form class="form-horizontal" id="search-form" action="<c:url value='/user.do'/>" method="post">
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label">Username</label>
				<div class="col-sm-10">
					<input type=text class="form-control" id="username">
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="email">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" id="bth-search"
						class="btn btn-primary btn-lg">Search</button>
				</div>
			</div>
		</form>

	</div>

</div>

<div class="container">
	<footer>
		<p>
			&copy; <a href="http://www.mkyong.com">Mkyong.com</a> 2015
		</p>
	</footer>
</div>

<script>
	function checkEmail(string) {
		re = /^[^\s]+@[^\s]+\.[^\s]{2,3}$/;
		if (re.test(string)){
			alert("成功！符合「" + re + "」的格式！");
			return true;
		}
		else{
			alert("失敗！不符合「" + re + "」的格式！");
			return false;
		}			
	}
	jQuery(document).ready(function($) {

		$("#search-form").submit(function(event) {

			result=checkEmail($("#email").val());
			
			if(result==true){
				// Prevent the form from submitting via the browser.
				event.preventDefault();

				searchViaAjax();				
			}
			else{
				event.preventDefault();
			}
		});

	});

	function searchViaAjax() {

		var search = {}
		search["username"] = $("#username").val();
		search["email"] = $("#email").val();

		$.ajax({
			type : "POST",
			//contentType用預設值(application/x-www-form-urlencoded)就好，這樣後端就可用request.getParameter取值；所以不設定
			//contentType : "application/json",
			url : "/TestSpring4Ajax1/search/api/getSearchResult.do",
			data : {'search': JSON.stringify(search)},
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				display(data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
			}
		});

	}

	function display(data) {
		var json = "<h4>Ajax Response</h4><pre>"
				+ JSON.stringify(data, null, 4) + "</pre>";
		$('#feedback').html(json);
	}
</script>

</body>
</html>