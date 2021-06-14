<%-- 
    Document   : create
    Created on : Jan 29, 2021, 5:59:09 PM
    Author     : Ray Khum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create Form</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <meta name="google-signin-client_id" content="459916350722-tdrki1jtr8s0ou7mj8694dak61e0uhjo.apps.googleusercontent.com">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #F2F3F5;
                min-height: 100vh;
                display: grid;
                place-items: center;
                padding: 80px 20px;
            }

            * {
                box-sizing: border-box;
            }

            .signup {
                padding: 80px 60px;
                background-color: white;
                border-radius: 30px;
                width: 100%;
                max-width: 480px;
            }
            .signup-heading {
                text-align: center;
                font-weight: 600;
                color: #363A40;
                font-size: 35px;
                margin-bottom: 35px;
            }
            .signup-google {
                display: -webkit-box;
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                width: 100%;
                border-radius: 16px;
                background-color: #4C6EF4;
                text-decoration: none;
                padding: 8px;
                margin-bottom: 45px;
                box-shadow: 0 10px 20px -5px rgba(76, 110, 244, 0.9);
            }
            .signup-google-icon {
                width: 50px;
                height: 50px;
                display: -webkit-box;
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
                color: #ff7870;
                border-radius: 10px;
                background-color: white;
                font-size: 25px;
            }
            .signup-google-text {
                color: white;
                font-weight: 500;
                display: block;
                margin: 0 auto;
            }
            .signup-or {
                color: #363A40;
                display: block;
                text-align: center;
                position: relative;
                margin-bottom: 55px;
            }
            .signup-or-text {
                display: inline-block;
                padding: 5px 20px;
                background-color: white;
                position: relative;
                font-size: 14px;
            }
            .signup-or:before {
                content: "";
                height: 1px;
                width: 100%;
                position: absolute;
                top: 50%;
                left: 0;
                background-color: #999;
                -webkit-transform: translateY(-50%);
                transform: translateY(-50%);
            }
            .signup-already {
                text-align: center;
                color: #363A40;
                font-size: 13px;
            }
            .signup-already-link {
                color: #4C6EF4;
                text-decoration: none;
            }

            .form-group {
                margin-bottom: 25px;
            }

            .form-label {
                display: inline-block;
                cursor: pointer;
                color: #363A40;
                margin-bottom: 15px;
                font-size: 13px;
            }

            .form-input {
                display: block;
                width: 100%;
                padding: 20px;
                border-radius: 15px;
                border: 0;
                outline: none;
                font-family: "Poppins", sans-serif;
                background-color: #F2F3F5;
                color: #363A40;
                font-size: 16px;
            }
            .form-input::-webkit-input-placeholder {
                color: #B4BDC1;
            }

            .form-submit {
                display: block;
                margin-top: 45px;
                width: 100%;
                padding: 20px;
                color: white;
                text-align: center;
                cursor: pointer;
                border: 0;
                border-radius: 15px;
                background-color: #81C91D;
                font-size: 16px;
                font-weight: 500;
                font-family: "Poppins", sans-serif;
                margin-bottom: 20px;
                box-shadow: 0 10px 20px -5px rgba(129, 201, 29, 0.9);
                outline: none;
            }

            @media screen and (max-width: 767px) {
                .signup {
                    padding: 30px 20px;
                }
            }
        </style>
    </head>
    <body>
        <c:set var="loi" value="${requestScope.ERROR}"/>
        <div class="signup">
            <h1 class="signup-heading">Quiz Online</h1>
            <h1 class="signup-heading">Sign up</h1>
            <form action="create" method="POST" class="signup-form" autocomplete="off">
                <div class="form-group">
                    <input type="email" class="form-input" id="name" placeholder="abc@gmail.com" name="txtEmail" value="${param.txtEmail}">
                </div>
                <c:if test="${not empty loi}">
                    <font color ="red" size="5%">${loi.emailError}</font>
                </c:if>
                <div class="form-group">
                    <input type="text" class="form-input" id="name" placeholder="fullName" name="txtFullName" value="${param.txtFullName}" >
                </div>
                <c:if test="${not empty loi}">
                    <font color ="red" size="5%">${loi.fullNameError}</font>
                </c:if>
                <div class="form-group">
                    <input type="password" class="form-input" id="email" placeholder="password" name="txtPassword">
                </div>   
                <c:if test="${not empty loi}">
                    <font color ="red" size="5%">${loi.passwordError}</font>
                </c:if>
                <div class="form-group">
                    <input type="password" class="form-input" id="email" placeholder="confirm" name="txtConfirm">
                </div>   
                <c:if test="${not empty loi}">
                    <font color ="red" size="5%">${loi.confirmError}</font>
                </c:if>
                <button type="submit" class="form-submit" name="btnAction" value="create">create</button>
                <a href="login.jsp">sign in</a>
            </form>
        </div>
    </body>
</html>
