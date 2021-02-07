
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Регистрация</title>
    <jsp:include page="/jsp/blocks/header1.jsp"/>
</head>
<body>
<div class="wrapper-page animated fadeInDown">
    <div class="panel panel-color panel-primary">
        <div class="panel-heading">
            <h3 class="text-center m-t-10"> Регистрация клиента в спортивный клуб </h3>
        </div>

        <form class="form-horizontal m-t-40" action="/register" method="post">

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
                    <button class="btn btn-primary w-md" type="submit">Зарегестрироваться</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </div>


        </form>

    </div>
</div>
</body>
</html>
