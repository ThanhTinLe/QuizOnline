<%-- 
    Document   : createQues
    Created on : Feb 1, 2021, 2:05:23 AM
    Author     : Ray Khum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Question Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/1acc75252a.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <a href="teacher.jsp">Back</a>
        <c:set var="loi" value="${requestScope.ERROR1}"/>
        <h1 style="color: red">${requestScope.CREATED}</h1>
        <c:if test="${empty requestScope.CREATED}">
            <form action="createQues" method="POST">
                <div  style="text-align: center; background-color: buttonface; width: 50%; height: 500px; margin-left: 25%;margin-top: 60px">
                    <h1 style="padding-top: 20px">Create question</h1>

                    <div class="dropdown show">
                        <label>Subject:</label>
                        <select name="txtSubID" class="btn btn-secondary dropdown-toggle">
                            <c:forEach var="sub" items="${sessionScope.SUB}">
                                <option class="dropdown-item" value="${sub.subID}" <c:if test="${sessionScope.SUBID eq sub.subID}">selected="true"</c:if>>${sub.subName}</option>
                            </c:forEach>   
                        </select>
                    </div>
                    <div style="padding: 10px">
                        <div class="input-group input-group-lg">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-lg">Question</span>
                            </div>
                            <input name="txtQues" type="text" value="${param.txtQues}" class="form-control" />
                        </div>
                        <c:if test="${not empty loi}">
                            <font color ="red" size="5%">${loi.question}</font>
                        </c:if>
                        <div style="margin-top: 10px">
                            <div class="input-group mb-3">
                                <input type="radio" name="creat" value="ans1"/>
                                <input type="text" name="txtAns1" value="${param.txtAns1}" class="form-control"/><br>
                            </div>
                            <c:if test="${not empty loi}">
                                <font color ="red" size="5%">${loi.ans1}</font>
                            </c:if>
                            <div class="input-group mb-3">
                                <input type="radio" name="creat" value="ans2"/>
                                <input type="text" name="txtAns2" value="${param.txtAns2}" class="form-control"/><br>
                            </div>
                            <c:if test="${not empty loi}">
                                <font color ="red" size="5%">${loi.ans2}</font>
                            </c:if>
                            <div class="input-group mb-3">
                                <input type="radio" name="creat" value="ans3"/>
                                <input type="text" name="txtAns3" value="${param.txtAns3}" class="form-control"/><br>
                            </div>
                            <c:if test="${not empty loi}">
                                <font color ="red" size="5%">${loi.ans3}</font>
                            </c:if>
                            <div class="input-group mb-3">
                                <input type="radio" name="creat" value="ans4"/>
                                <input type="text" name="txtAns4" value="${param.txtAns4}" class="form-control"/><br>
                            </div>
                            <c:if test="${not empty loi}">
                                <font color ="red" size="5%">${loi.ans4}</font>
                            </c:if>
                        </div>
                        <c:if test="${not empty loi}">
                            <font color ="red" size="5%">${loi.choice}</font>
                        </c:if>
                    </div>
                    <input type="submit" value="create" class="btn btn-info"/>
                </div>
            </form>
        </c:if>
        <c:if test="${not empty requestScope.CREATED}">
            <form action="createQues" method="POST">
                <div  style="text-align: center; background-color: buttonface; width: 50%; height: 500px; margin-left: 25%;margin-top: 60px">
                    <h1 style="padding-top: 20px">Create question</h1>

                    <div class="dropdown show">
                        <label>Subject:</label>
                        <select name="txtSubID" class="btn btn-secondary dropdown-toggle">
                            <c:forEach var="sub" items="${sessionScope.SUB}">
                                <option class="dropdown-item" value="${sub.subID}" <c:if test="${sessionScope.SUBID eq sub.subID}">selected="true"</c:if>>${sub.subName}</option>
                            </c:forEach>   
                        </select>
                    </div>
                    <div style="padding: 10px">
                        <div class="input-group input-group-lg">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-lg">Question</span>
                            </div>
                            <input name="txtQues" type="text" class="form-control" />
                        </div>
                        <c:if test="${not empty loi}">
                            <font color ="red" size="5%">${loi.question}</font>
                        </c:if>
                        <div style="margin-top: 10px">
                            <div class="input-group mb-3">
                                <input type="radio" name="creat" value="ans1"/>
                                <input type="text" name="txtAns1" class="form-control"/><br>
                            </div>
                            <c:if test="${not empty loi}">
                                <font color ="red" size="5%">${loi.ans1}</font>
                            </c:if>
                            <div class="input-group mb-3">
                                <input type="radio" name="creat" value="ans2"/>
                                <input type="text" name="txtAns2" class="form-control"/><br>
                            </div>
                            <c:if test="${not empty loi}">
                                <font color ="red" size="5%">${loi.ans2}</font>
                            </c:if>
                            <div class="input-group mb-3">
                                <input type="radio" name="creat" value="ans3"/>
                                <input type="text" name="txtAns3" class="form-control"/><br>
                            </div>
                            <c:if test="${not empty loi}">
                                <font color ="red" size="5%">${loi.ans3}</font>
                            </c:if>
                            <div class="input-group mb-3">
                                <input type="radio" name="creat" value="ans4"/>
                                <input type="text" name="txtAns4" class="form-control"/><br>
                            </div>
                            <c:if test="${not empty loi}">
                                <font color ="red" size="5%">${loi.ans4}</font>
                            </c:if>
                        </div>
                        <c:if test="${not empty loi}">
                            <font color ="red" size="5%">${loi.choice}</font>
                        </c:if>
                    </div>
                    <input type="submit" value="create" class="btn btn-info"/>
                </div>
            </form>
        </c:if>


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
