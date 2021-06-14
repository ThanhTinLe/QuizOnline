<%-- 
    Document   : updateQues
    Created on : Feb 5, 2021, 1:23:27 PM
    Author     : Ray Khum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Question Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/1acc75252a.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <a href="teacher.jsp">Back</a>
        <form action="updateQues" method="POST">
            <div  style="text-align: center; background-color: buttonface; width: 50%; height: 500px; margin-left: 25%;margin-top: 60px">
                <h1 style="padding-top: 20px">Create question</h1>

                <div class="dropdown show">
                    <label>Subject:</label>
                    <select name="txtSubID" class="btn btn-secondary dropdown-toggle">
                        <c:forEach var="sub" items="${sessionScope.SUB}">
                            <option class="dropdown-item" value="${sub.subID}" <c:if test="${sessionScope.QUES.subID eq sub.subID}">selected="true"</c:if>>${sub.subName}</option>
                        </c:forEach>   
                    </select>
                </div>
                <div style="padding: 10px">
                    <div class="input-group input-group-lg">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-lg">Question</span>
                        </div>
                        <input name="txtQues" type="text" value="${sessionScope.QUES.quesContent}" class="form-control" />
                    </div>
                    <div style="margin-top: 10px">
                        <div class="input-group mb-3">

                            <input type="radio" name="creat" value="ans1" <c:if test="${sessionScope.ANSWER1.ansCorrect eq true}">checked</c:if> />
                            <input type="text" name="txtAns1" value="${sessionScope.ANSWER1.ansContent}" class="form-control"/><br>
                            <input type="hidden" name="txtAnsID1" value="${sessionScope.ANSWER1.ansID}" />
                        </div>
                        <div class="input-group mb-3">
                            <input type="radio" name="creat" value="ans2" <c:if test="${sessionScope.ANSWER2.ansCorrect eq true}">checked</c:if> />
                            <input type="text" name="txtAns2" value="${sessionScope.ANSWER2.ansContent}" class="form-control"/><br>
                            <input type="hidden" name="txtAnsID2" value="${sessionScope.ANSWER2.ansID}" />
                        </div>
                        <div class="input-group mb-3">
                            <input type="radio" name="creat" value="ans3" <c:if test="${sessionScope.ANSWER3.ansCorrect eq true}">checked</c:if> />
                            <input type="text" name="txtAns3" value="${sessionScope.ANSWER3.ansContent}" class="form-control"/><br>
                            <input type="hidden" name="txtAnsID3" value="${sessionScope.ANSWER3.ansID}" />
                        </div>
                        <div class="input-group mb-3">
                            <input type="radio" name="creat" value="ans4" <c:if test="${sessionScope.ANSWER4.ansCorrect eq true}">checked</c:if> />
                            <input type="text" name="txtAns4" value="${sessionScope.ANSWER4.ansContent}" class="form-control"/><br>
                            <input type="hidden" name="txtAnsID4" value="${sessionScope.ANSWER4.ansID}" />
                        </div>
                    </div>
                    <div>
                        <label>Status:</label>
                        <input type="checkbox" name="txtCheckBox" <c:if test="${sessionScope.QUES.status}">checked</c:if> />
                    </div>
                </div>
                    <input type="hidden" name="txtquesID" value="${sessionScope.QUES.quesID}" />
                <input type="submit" value="update" class="btn btn-info"/>
            </div>
        </form>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    </body>
</html>
