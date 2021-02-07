<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/jsp/blocks/header1.jsp"/>
</head>
<body>
<div class="wrapper-page animated fadeInDown">
    <div class="panel panel-color panel-primary">
        <div class="panel-heading">
            <h3 class="text-center m-t-10"> Вход в систему спортивного клуба </h3>
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible">${error}</div>
            </c:if>
            <c:if test="${not empty msg}">
                <div class="alert alert-info alert-dismissible">${msg}</div>
            </c:if>

        </div>

        <form class="form-horizontal m-t-40" action="<c:url value='/login'/>" method="post">

            <div class="form-group">
                <div class="col-xs-12">
                    <input class="form-control" type="email" required="" name="username" placeholder="Логин">
                </div>
            </div>
            <div class="form-group ">

                <div class="col-xs-12">
                    <input class="form-control" type="password" name="password" placeholder="Пароль">
                </div>
            </div>

            <div class="form-group ">
                <div class="col-xs-12">
                    <input type="checkbox" id="test5"/>
                    <label for="test5">Запомнить меня</label>
                </div>
            </div>

            <div class="form-group text-right">
                <div class="col-xs-12">
                    <button class="btn btn-primary w-md" type="submit">Войти</button>
                </div>
            </div>
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
        </form>
        <div class="form-horizontal m-t-0">
            <div class="form-group text-right">
                <div class="col-xs-12">
                    <a href="/register"><button class="btn btn-primary w-md" type="submit">Регистрация</button></a>
                </div>
            </div>
        </div>


    </div>
</div>

</body>
</html>
