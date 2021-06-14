<%-- 
    Document   : home
    Created on : Jan 30, 2021, 1:35:21 AM
    Author     : Ray Khum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/1acc75252a.js" crossorigin="anonymous"></script>
        <title>Teacher Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Quiz Online</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <c:if test="${not empty sessionScope.USER.fullName}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${sessionScope.USER.fullName}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="createQues.jsp">Create Question</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="LogoutController">Logout</a>
                            </div>
                        </li>
                    </c:if>
                </ul>

                <h2 style="color: red">${requestScope.DELETED}</h2>
                <h1 style="color: red">${requestScope.UPDATED}</h1>

                <form class="form-inline my-2 my-lg-0" action="search">
                    <select class="form-control mr-sm-2" name="txtSubID">
                        <c:forEach var="sub" items="${sessionScope.SUB}">
                            <option value="${sub.subID}" <c:if test="${sessionScope.SUBID eq sub.subID}">selected="true"</c:if>>${sub.subName}</option>
                        </c:forEach>   
                    </select>
                    <select class="form-control mr-sm-2" name="txtStatus">
                        <option <c:if test="${sessionScope.STATUS eq true}">selected</c:if>>Active</option>
                        <option <c:if test="${sessionScope.STATUS eq false}">selected</c:if>>Inactive</option>
                    </select>
                    <input class="form-control mr-sm-2" name="txtSearch" type="text" placeholder="Search" value="${param.txtSearch}" aria-label="Search">
                    <input type="hidden" name="txtPage" value="1" />
                    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" name="btnAction" value="Search"/>
                </form>
            </div>
        </nav>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
        <div style="background-color: #f1f5ef; margin: 0px">
            <div style="margin-left: 30px">
                <c:set var="map" value="${sessionScope.MAP}"/>
                <h1 style="background-color: pink">${sub.subName}</h1>
                <c:forEach var="key" items="${map}" varStatus="counter">
                    <h5 style="color: green">${sessionScope.INDEX*20 + counter.count}. ${key.key.quesContent}</h5>
                    <div id="value">
                        <c:forEach var="value" items="${key.value}">
                            <input type="radio" name="ans${counter.count}" <c:if test="${value.ansCorrect eq true}">checked</c:if> />
                            <label <c:if test="${value.ansCorrect eq true}">style="color: red;"</c:if>>${value.ansContent}</label><br>
                        </c:forEach>
                    </div>
                    <h5>Status:${key.key.status}</h5>
                    <form method="POST" action="delete" style="display: inline">
                        <c:if test="${key.key.status eq true}">
                            <button class="btn btn-outline-danger" name="txtDelete" onclick="return confirm('do you want to delete this question')" value="${key.key.quesID}">Delete</button>
                        </c:if>
                    </form>
                    <form method="POST" action="update" style="display: inline">
                        <button class="btn btn-outline-success" name="txtUpdate" value="${key.key.quesID}">Update</button>
                    </form>
                </c:forEach>
            </div>
        </div>
        <form action="search" method="POST" style="text-align: center">
            <c:if test="${sessionScope.PAGE > 1}">
                <c:forEach var="page" begin="1" end="${sessionScope.PAGE}"> 
                    <button type="submit" name="txtPage" value="${page}" class="btn btn-outline-primary">${page}</button>
                </c:forEach>
            </c:if>
        </form>
    </body>
    <style>
        body div{
            margin-left: 20px;
        }
        body div #value{
            margin-left: 20px;
        }
    </style>
</html>
