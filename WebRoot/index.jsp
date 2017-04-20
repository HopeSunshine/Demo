<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>angularJS页面显示</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/angular.js"></script>
    <link href="css/demo01.css">
	<script type="text/javascript">
            angular.module("myapp",[]).controller("one",function($scope,$http){
                $http.get("js/db.json").success(function(request){
                    $scope.mytb=request;
                    $scope.speak=function(sex){
                        if(sex=="女"){
                            alert("只有性别为"+sex+",才会弹噢！");
                        }
                        
                    }
                })
            })
        </script>
  </head>
   <body ng-app="myapp" ng-controller="one">
        <div>
            <fieldset>
                <legend>老湿资料</legend>
                <table >
                    <thead>
                        <tr>
                            <th>名字</th>  
                            <th>性别</th>  
                            <th>年龄</th>
                        </tr>
                    </thead>
                    <tbody>
                       <tr ng-repeat="y in mytb">
                            <td>{{y.name}}</td>
                            <td ng-class="{girl:y.sex=='男'}" ng-click="speak(y.sex)">{{y.sex}}</td>
                            <td>{{y.age}}</td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
        </div>
    </body>
</html>
