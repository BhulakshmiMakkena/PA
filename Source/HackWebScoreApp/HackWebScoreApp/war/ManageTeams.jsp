<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>  

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.5/angular.min.js"></script>  
</head>  
<body ng-app="myapp">  
<div ng-controller="HelloController" >  
<h2>Hello {{helloTo.title}} !</h2>  
</div>  
  
<script>  
angular.module("myapp", [])  
    .controller("HelloController", function($scope) {  
        $scope.helloTo = {};  
        $scope.helloTo.title = "World, AngularJS";  
    } );  
</script>  
</body>  
</html>