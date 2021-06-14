<%-- 
    Document   : historyDetail
    Created on : Apr 22, 2021, 9:03:34 PM
    Author     : Ray Khum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>history detail Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/1acc75252a.js" crossorigin="anonymous"></script>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="home.jsp">Quiz Online</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mr-auto">
                    <c:if test="${not empty sessionScope.USER.fullName}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${sessionScope.USER.fullName}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="history.jsp">History</a>
                                <a class="dropdown-item" href="LogoutController">Logout</a>
                            </div>
                        </li>
                    </c:if>
                </ul>
                <form class="form-inline my-2 my-lg-0" action="history">
                    <lable>select subject: </lable>
                    <select class="form-control mr-sm-2" name="txtSubID">
                        <option value="">--select--</option>
                        <c:forEach var="sub" items="${sessionScope.SUB}">
                            <option value="${sub.subID}" <c:if test="${sessionScope.SUBID eq sub.subID}">selected="true"</c:if>>${sub.subName}</option>
                        </c:forEach>   
                    </select>
                    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" name="btnAction" value="Get History"/>
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

        <c:forEach var="map" items="${sessionScope.MAP_HIS}">
            <c:forEach var="his" items="${sessionScope.LIST_HIS_DETAIL}">
                <c:if test="${map.key.quesID eq his.quesID}">
                    <h3>${map.key.quesContent}</h3>
                    <c:forEach var="value" items="${map.value}">
                        <p <c:if test="${value.ansCorrect eq true}">style="color: green"</c:if>>${value.ansContent}<c:if test="${value.ansID eq his.userAns}"><label>-->your choice</label></c:if></p>
                    </c:forEach>
                </c:if>
            </c:forEach>
        </c:forEach> 
        <c:forEach begin="1" end="${sessionScope.END_PAGE}" varStatus="counter">
            <form action="hisDetail" style="display: inline">
                <input type="hidden" name="txtHisID" value="${sessionScope.HIS_ID}" />
                <button name="txtPaging" value="${counter.count - 1}">${counter.count}</button>
            </form>
        </c:forEach>
    </body>
</html>
