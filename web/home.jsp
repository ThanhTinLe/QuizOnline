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
        <title>Home Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <c:if test="${not empty sessionScope.QUIZ_MAP}">
                    <form action="submitQuiz">
                        <button id="submit" type="submit" onclick="return confirm'do you want to submit'">Submit</button>
                    </form>
                    <div class="col-2 text-center" style="border: 2px solid black; border-radius: 10px; ">
                        Time: ${sessionScope.TIME} minutes <br/>
                        <table>
                            <tr>
                                <td>
                                    <form action="http://www.google.fr">
                                        <input type="hidden" id="time" class="btn" formtarget="_blank" value="">
                                    </form>
                                </td>
                                <td>${sessionScope.HOUR}:${sessionScope.MIN}:${sessionScope.SECOND}</td>
                            </tr>
                        </table>
                    </div>
                </c:if>
                <c:if test="${empty sessionScope.QUIZ_MAP}">
                    <form class="form-inline my-2 my-lg-0" action="createQuiz">
                        <lable>select subject: </lable>
                        <select class="form-control mr-sm-2" name="txtSubID">

                            <c:forEach var="sub" items="${sessionScope.SUB}">
                                <option value="${sub.subID}" <c:if test="${sessionScope.SUBID eq sub.subID}">selected="true"</c:if>>${sub.subName}</option>
                            </c:forEach>   
                        </select>
                        <input class="btn btn-outline-success my-2 my-sm-0" type="submit" name="btnAction" value="Take Quiz"/>
                    </form>
                </c:if>
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

        <h2>${requestScope.NOT_ENOUGHT}</h2>
        <c:if test="${not empty sessionScope.QUIZ_MAP}">
            <form action="takeQuiz">
                <c:forEach varStatus="counter" var="map" items="${sessionScope.QUIZ_MAP}">
                    <c:if test="${sessionScope.INDEX_QUES.quesID eq map.key.quesID}">
                        <h3>${sessionScope.INDEX + 1}: ${map.key.quesContent}</h3>
                        <c:forEach var="answer" items="${map.value}">
                            <input type="radio" name="ans" value="${answer.ansID}" <c:if test="${answer.ansID eq sessionScope.USER_ANS}">checked="true"</c:if>/>
                            <label>${answer.ansContent}</label><br>
                        </c:forEach> 
                        <input type="hidden" name="txtQuesID" value="${map.key.quesID}" />
                    </c:if>
                </c:forEach>
                <c:if test="${sessionScope.INDEX >= 1}">
                    <button type="submit" name="txtNext" value="previous">Previous</button>
                </c:if>
                <c:if test="${sessionScope.INDEX < sessionScope.NUM_OF_QUES -1}">
                    <button type="submit" name="txtNext" value="next">Next</button>
                </c:if>
            </form>
        </c:if>
        <c:if test="${not empty requestScope.SCORE}">
            <h3>your score is: ${requestScope.SCORE}</h3>
        </c:if>

        <script>
                            function Click() {
                                document.getElementById('button').click();
                            }
                            ;
                            function toTimeString(seconds) {
                                return (new Date(seconds * 1000)).toUTCString().match(/(\d\d:\d\d:\d\d)/)[0];
                            }
                            function startTimer() {
                                var nextElem = $(this).parents('td').next();
                                var duration = nextElem.text();
                                var a = duration.split(':');
                                var seconds = (+a[0]) * 60 * 60 + (+a[1]) * 60 + (+a[2]);
                                setInterval(function () {
                                    seconds--;
                                    if (seconds >= 0) {
                                        nextElem.html(toTimeString(seconds));
                                    }
                                    if (seconds <= 20) {
                                        nextElem.css('color', 'red');
                                    }
                                    if (seconds === 0) {
                                        document.getElementById('submit').click();
                                        clearInterval(seconds);
                                    }
                                }, 1000);
                            }
                            $('#time').on('click', startTimer);
                            jQuery(function () {
                                jQuery('#time').click();
                            });
        </script>       
    </body>
</html>
