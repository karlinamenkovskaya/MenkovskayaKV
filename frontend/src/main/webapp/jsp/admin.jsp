<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/jsp/blocks/header1.jsp"/>

    <script>


        function adminPageInit() {
            $('#tclient').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false

            });
            $('#tcoach').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false
            });
            $('#tinformation').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false
            });
            $('#tgym').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false
            });
            $('#tusers').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': true
            });
            $('#tuser_roles').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': true
            });
            $('#user_roles_edit').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#faculty').text($("#faculties option[value='" + data.idFaculty + "']").text());
                        $('#success').css('display', 'block');
                    } else {
                        $('#error').css('display', 'block');
                    }
                }
            });
            $('#user_roles_edit1').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#faculty').text($("#faculties option[value='" + data.idFaculty + "']").text());
                        $('#success').css('display', 'block');
                    } else {
                        $('#error').css('display', 'block');
                    }
                }
            });
            $('#users_edit').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#faculty').text($("#faculties option[value='" + data.idFaculty + "']").text());
                        $('#success').css('display', 'block');
                    } else {
                        $('#error').css('display', 'block');
                    }
                }
            });
            $('#subscription_edit').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#faculty').text($("#faculties option[value='" + data.idFaculty + "']").text());
                        $('#success').css('display', 'block');
                    } else {
                        $('#error').css('display', 'block');
                    }
                }
            });
            $('#subscription_edit1').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#faculty').text($("#faculties option[value='" + data.idFaculty + "']").text());
                        $('#success').css('display', 'block');
                    } else {
                        $('#error').css('display', 'block');
                    }
                }
            });
            $('#gym_edit').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#faculty').text($("#faculties option[value='" + data.idFaculty + "']").text());
                        $('#success').css('display', 'block');
                    } else {
                        $('#error').css('display', 'block');
                    }
                }
            });
            $('#gym_edit1').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#faculty').text($("#faculties option[value='" + data.idFaculty + "']").text());
                        $('#success').css('display', 'block');
                    } else {
                        $('#error').css('display', 'block');
                    }
                }
            });
            $('#coach_edit').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#faculty').text($("#faculties option[value='" + data.idFaculty + "']").text());
                        $('#success').css('display', 'block');
                    } else {
                        $('#error').css('display', 'block');
                    }
                }
            });

        }

    </script>
</head>
<body onload="adminPageInit()">
<div class="col-md-12">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title" align="center">Страница администратора</h3>
                </div>
                <div class="panel-body">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab" aria-expanded="false">Клиенты и
                            абонементы</a>
                        </li>
                        <li class=""><a href="#profile" data-toggle="tab" aria-expanded="false">Тренеры и залы</a>
                        <li class=""><a href="#users" data-toggle="tab" aria-expanded="false">Пользователи системы</a>
                        <li class="">
                            <a href="/logout">
                                <button class="btn btn-primary w-md">Выйти</button>
                            </a>
                        </li>

                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content ">
                        <div class="tab-pane fade active in" id="home">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title" align="center">Таблица всех клиентов</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <table id="tclient"
                                                           class="table table-striped table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>Имя</th>
                                                            <th>Фамилия</th>
                                                            <th>Номер телефона</th>
                                                            <th>Эл.почта</th>
                                                            <th>Удалить</th>
                                                        </tr>
                                                        </thead>

                                                        <tbody>
                                                        <c:forEach items="${clients}" var="cl">
                                                            <tr>
                                                                <td>${cl.getFirst_name()}</td>
                                                                <td>${cl.getLast_name()}</td>
                                                                <td>${cl.getPhone_number()}</td>
                                                                <td>${cl.getEmail()}</td>
                                                                <td>
                                                                    <a href="#myModal${cl.getIdClient()+ 2000775}"
                                                                       class="btn btn-block btn-danger"
                                                                       data-toggle="modal">Удалить</a>
                                                                    <!-- HTML-код модального окна-->
                                                                    <div id="myModal${cl.getIdClient() + 2000775}"
                                                                         class="modal fade">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <!-- Заголовок модального окна -->
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close"
                                                                                            data-dismiss="modal"
                                                                                            aria-hidden="true">×
                                                                                    </button>
                                                                                    <h4 class="modal-title">Вы точно
                                                                                        хотите удалить
                                                                                        клиента ${cl.getFirst_name()} ${cl.getLast_name()}</h4>
                                                                                </div>
                                                                                <!-- Основное содержимое модального окна -->
                                                                                <div class="modal-body">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <div class="panel panel-default">
                                                                                                <div class="panel-heading">
                                                                                                    <h3 class="panel-title"
                                                                                                        align="center">
                                                                                                        Удалить</h3>
                                                                                                </div>
                                                                                                <div class="panel-body">
                                                                                                    <form class="form-horizontal"
                                                                                                          role="form">
                                                                                                        <a href=" <c:url value='/admin/deleteClient/${cl.getIdClient()}'/> ">
                                                                                                            <button
                                                                                                                    type="button"
                                                                                                                    class="btn btn-block btn-danger">
                                                                                                                Удалить
                                                                                                            </button>
                                                                                                        </a>
                                                                                                    </form>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                        </tbody>
                                                    </table>

                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title" align="center">Таблица всех абонементов</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <table id="tinformation"
                                                           class="table table-striped table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>Название</th>
                                                            <th>Стоимость</th>
                                                            <th>Зал</th>
                                                            <th>Дни проведения</th>
                                                            <th>Месяц</th>
                                                            <th>Записаться</th>
                                                        </tr>
                                                        </thead>

                                                        <tbody>
                                                        <c:forEach items="${subscription}" var="sub">
                                                            <tr>
                                                                <td>${sub.getDescription()}</td>
                                                                <td>${sub.getValue()}</td>
                                                                <td>${gyms.stream().filter(gym -> gym.getIdGym()==sub.getIdGym()).findFirst().get().getGym_name()}</td>
                                                                <td>${sub.getDay1()} - ${sub.getDay2()}</td>
                                                                <td>${sub.getMonth()}</td>
                                                                <td>
                                                                    <a href="#myModal${sub.getidSubscription()+ 17775}"
                                                                       class="btn btn-block btn-danger"
                                                                       data-toggle="modal">Удалить</a>
                                                                    <!-- HTML-код модального окна-->
                                                                    <div id="myModal${sub.getidSubscription() + 17775}"
                                                                         class="modal fade">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <!-- Заголовок модального окна -->
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close"
                                                                                            data-dismiss="modal"
                                                                                            aria-hidden="true">×
                                                                                    </button>
                                                                                    <h4 class="modal-title">Вы точно
                                                                                        хотите удалить
                                                                                        абонемент ${sub.getDescription()}</h4>
                                                                                </div>
                                                                                <!-- Основное содержимое модального окна -->
                                                                                <div class="modal-body">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <div class="panel panel-default">
                                                                                                <div class="panel-heading">
                                                                                                    <h3 class="panel-title"
                                                                                                        align="center">
                                                                                                        Удалить</h3>
                                                                                                </div>
                                                                                                <div class="panel-body">
                                                                                                    <form class="form-horizontal"
                                                                                                          role="form">
                                                                                                        <a href=" <c:url value='/admin/deleteSubscription/${sub.getidSubscription()}'/> ">
                                                                                                            <button
                                                                                                                    type="button"
                                                                                                                    class="btn btn-block btn-danger">
                                                                                                                Удалить
                                                                                                            </button>
                                                                                                        </a>
                                                                                                    </form>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <a href="#myModal6${sub.getidSubscription()+ 17775}"
                                                                       class="btn btn-block btn-default"
                                                                       data-toggle="modal">Изменить</a>

                                                                    <div id="myModal6${sub.getidSubscription()+ 17775}"
                                                                         class="modal fade">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <!-- Заголовок модального окна -->
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close"
                                                                                            data-dismiss="modal"
                                                                                            aria-hidden="true">×
                                                                                    </button>
                                                                                    <h4 class="modal-title">
                                                                                        Редактировать абонемент</h4>
                                                                                </div>
                                                                                <!-- Основное содержимое модального окна -->
                                                                                <div class="modal-body">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <div class="panel panel-default">
                                                                                                <div class="panel-heading">
                                                                                                    <h3 class="panel-title"
                                                                                                        align="center">
                                                                                                        Данные для
                                                                                                        редактирования
                                                                                                        абонемента</h3>
                                                                                                </div>
                                                                                                <div class="panel-body">
                                                                                                    <form class="form-horizontal"
                                                                                                          role="form"
                                                                                                          action="admin/editSubscription"
                                                                                                          id="subscription_edit1"
                                                                                                          method="post"
                                                                                                          accept-charset="windows1251">
                                                                                                        <input type="hidden"
                                                                                                               name="subId"
                                                                                                               value="${sub.getidSubscription()}"/>
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-md-2 control-label">Название</label>
                                                                                                            <div class="col-md-10">
                                                                                                                <input type="text"
                                                                                                                       class="form-control"
                                                                                                                       placeholder="Название"
                                                                                                                       name="description"
                                                                                                                       value="${sub.getDescription()}"/>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-md-2 control-label">Стоимость</label>
                                                                                                            <div class="col-md-10">
                                                                                                                <input type="text"
                                                                                                                       class="form-control"
                                                                                                                       placeholder="Стоимость"
                                                                                                                       name="value"
                                                                                                                       value="${sub.getValue()}">
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-sm-2 control-label">Зал</label>
                                                                                                            <div class="col-sm-10">
                                                                                                                <select id="fac1"
                                                                                                                        class="form-control"
                                                                                                                        name="idGym">
                                                                                                                    <c:forEach
                                                                                                                            items="${gyms}"
                                                                                                                            var="gym">
                                                                                                                        <option value="${gym.getIdGym()}">${gym.getGym_name()}</option>
                                                                                                                    </c:forEach>
                                                                                                                </select>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-sm-2 control-label">День
                                                                                                                недели</label>
                                                                                                            <div class="col-sm-10">
                                                                                                                <select class="form-control"
                                                                                                                        name="Day1">
                                                                                                                    <option>
                                                                                                                        Понедельник
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Вторник
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Среда
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Четверг
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Пятница
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Суббота
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Воскресенье
                                                                                                                    </option>

                                                                                                                </select>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-sm-2 control-label">День
                                                                                                                недели</label>
                                                                                                            <div class="col-sm-10">
                                                                                                                <select class="form-control"
                                                                                                                        name="Day2">
                                                                                                                    <option>
                                                                                                                        Понедельник
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Вторник
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Среда
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Четверг
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Пятница
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Суббота
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Воскресенье
                                                                                                                    </option>
                                                                                                                </select>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-sm-2 control-label">
                                                                                                                Месяц</label>
                                                                                                            <div class="col-sm-10">
                                                                                                                <select class="form-control"
                                                                                                                        name="Month">
                                                                                                                    <option>
                                                                                                                        Январь
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Февраль
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Март
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Апрель
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Май
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Июнь
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Июль
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Август
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Сентябрь
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Октябрь
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Ноябрь
                                                                                                                    </option>
                                                                                                                    <option>
                                                                                                                        Декабрь
                                                                                                                    </option>
                                                                                                                </select>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <input type="hidden"
                                                                                                               name="${_csrf.parameterName}"
                                                                                                               value="${_csrf.token}"/>

                                                                                                        <button type="submit"
                                                                                                                class="btn btn-purple">
                                                                                                            Применить
                                                                                                        </button>
                                                                                                    </form>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>

                                                    <div class="panel-body">
                                                        <a href="#myModal" class="btn btn-primary"
                                                           data-toggle="modal">Создать</a>
                                                        <!-- HTML-код модального окна-->
                                                        <div id="myModal" class="modal fade">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <!-- Заголовок модального окна -->
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal"
                                                                                aria-hidden="true">×
                                                                        </button>
                                                                        <h4 class="modal-title">Создать абонемент</h4>
                                                                    </div>
                                                                    <!-- Основное содержимое модального окна -->
                                                                    <div class="modal-body">
                                                                        <div class="row">
                                                                            <div class="col-sm-12">
                                                                                <div class="panel panel-default">
                                                                                    <div class="panel-heading">
                                                                                        <h3 class="panel-title"
                                                                                            align="center">
                                                                                            Данные для создания
                                                                                            абонемента</h3>
                                                                                    </div>
                                                                                    <div class="panel-body">
                                                                                        <form class="form-horizontal"
                                                                                              role="form"
                                                                                              action="admin/addSubscription"
                                                                                              id="subscription_edit"
                                                                                              method="post"
                                                                                              accept-charset="windows1251">
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-2 control-label">Название</label>
                                                                                                <div class="col-md-10">
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           placeholder="Название"
                                                                                                           name="description">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-2 control-label">Стоимость</label>
                                                                                                <div class="col-md-10">
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           placeholder="Стоимость"
                                                                                                           name="value">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-sm-2 control-label">Зал</label>
                                                                                                <div class="col-sm-10">
                                                                                                    <select id="fac"
                                                                                                            class="form-control"
                                                                                                            name="idGym">
                                                                                                        <c:forEach
                                                                                                                items="${gyms}"
                                                                                                                var="gym">
                                                                                                            <option value="${gym.getIdGym()}">${gym.getGym_name()}</option>
                                                                                                        </c:forEach>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-sm-2 control-label">День
                                                                                                    недели</label>
                                                                                                <div class="col-sm-10">
                                                                                                    <select class="form-control"
                                                                                                            name="Day1">
                                                                                                        <option>
                                                                                                            Понедельник
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Вторник
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Среда
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Четверг
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Пятница
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Суббота
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Воскресенье
                                                                                                        </option>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-sm-2 control-label">День
                                                                                                    недели</label>
                                                                                                <div class="col-sm-10">
                                                                                                    <select class="form-control"
                                                                                                            name="Day2">
                                                                                                        <option>
                                                                                                            Понедельник
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Вторник
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Среда
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Четверг
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Пятница
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Суббота
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Воскресенье
                                                                                                        </option>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-sm-2 control-label">
                                                                                                    Месяц</label>
                                                                                                <div class="col-sm-10">
                                                                                                    <select class="form-control"
                                                                                                            name="Month">
                                                                                                        <option>
                                                                                                            Январь
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Февраль
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Март
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Апрель
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Май
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Июнь
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Июль
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Август
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Сентябрь
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Октябрь
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Ноябрь
                                                                                                        </option>
                                                                                                        <option>
                                                                                                            Декабрь
                                                                                                        </option>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                            <input type="hidden"
                                                                                                   name="${_csrf.parameterName}"
                                                                                                   value="${_csrf.token}"/>

                                                                                            <button type="submit"
                                                                                                    class="btn btn-purple">
                                                                                                Применить
                                                                                            </button>
                                                                                        </form>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="tab-pane fade" id="profile">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title" align="center">Таблица всех тренеров</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <table id="tcoach"
                                                           class="table table-striped table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>Имя</th>
                                                            <th>Фамилия</th>
                                                            <th>Зарплата</th>
                                                            <th>Уволить</th>
                                                        </tr>
                                                        </thead>

                                                        <tbody>
                                                        <c:forEach items="${coach}" var="coa">
                                                            <tr>
                                                                <td>${coa.getFirst_name()}</td>
                                                                <td>${coa.getLast_name()}</td>
                                                                <td>${coa.getSalary()}</td>
                                                                <td>
                                                                    <a href="#myModal${coa.getIdCoach()+ 188976}"
                                                                       class="btn btn-block btn-danger"
                                                                       data-toggle="modal">Уволить</a>
                                                                    <!-- HTML-код модального окна-->
                                                                    <div id="myModal${coa.getIdCoach() + 188976}"
                                                                         class="modal fade">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <!-- Заголовок модального окна -->
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close"
                                                                                            data-dismiss="modal"
                                                                                            aria-hidden="true">×
                                                                                    </button>
                                                                                    <h4 class="modal-title">Вы точно
                                                                                        хотите уволить
                                                                                        тренера ${coa.getFirst_name()} ${coa.getLast_name()} </h4>
                                                                                </div>
                                                                                <!-- Основное содержимое модального окна -->
                                                                                <div class="modal-body">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <div class="panel panel-default">
                                                                                                <div class="panel-heading">
                                                                                                    <h3 class="panel-title"
                                                                                                        align="center">
                                                                                                        Уволить</h3>
                                                                                                </div>
                                                                                                <div class="panel-body">
                                                                                                    <form class="form-horizontal"
                                                                                                          role="form">
                                                                                                        <a href=" <c:url value='/admin/deleteCoach/${coa.getIdCoach()}'/> ">
                                                                                                            <button
                                                                                                                    type="button"
                                                                                                                    class="btn btn-block btn-danger">
                                                                                                                Уволить
                                                                                                            </button>
                                                                                                        </a>
                                                                                                    </form>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                        </tbody>
                                                    </table>
                                                    <div class="panel-body">
                                                        <a href="#myModal1" class="btn btn-primary"
                                                           data-toggle="modal">Добавить</a>
                                                        <!-- HTML-код модального окна-->
                                                        <div id="myModal1" class="modal fade">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <!-- Заголовок модального окна -->
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal"
                                                                                aria-hidden="true">×
                                                                        </button>
                                                                        <h4 class="modal-title">Добавить тренера</h4>
                                                                    </div>
                                                                    <!-- Основное содержимое модального окна -->
                                                                    <div class="modal-body">
                                                                        <div class="row">
                                                                            <div class="col-sm-12">
                                                                                <div class="panel panel-default">
                                                                                    <div class="panel-heading">
                                                                                        <h3 class="panel-title"
                                                                                            align="center">
                                                                                            Данные для добавления
                                                                                            тренера</h3>
                                                                                    </div>
                                                                                    <div class="panel-body">
                                                                                        <form class="form-horizontal"
                                                                                              role="form"
                                                                                              action="admin/addCoach"
                                                                                              id="coach_edit"
                                                                                              method="post"
                                                                                              accept-charset="windows1251">
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-2 control-label">Логин</label>
                                                                                                <div class="col-md-10">
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           placeholder="Логин"
                                                                                                           name="username">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-2 control-label">Пароль</label>
                                                                                                <div class="col-md-10">
                                                                                                    <input type="password"
                                                                                                           class="form-control"
                                                                                                           placeholder="Пароль"
                                                                                                           name="password">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-2 control-label">Имя</label>
                                                                                                <div class="col-md-10">
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           placeholder="Имя"
                                                                                                           name="first_name">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-2 control-label">Фамилия</label>
                                                                                                <div class="col-md-10">
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           placeholder="Фамилия"
                                                                                                           name="last_name">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-2 control-label">Оклад</label>
                                                                                                <div class="col-md-10">
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           placeholder="Оклад"
                                                                                                           name="salary">
                                                                                                </div>
                                                                                            </div>
                                                                                            <input type="hidden"
                                                                                                   name="${_csrf.parameterName}"
                                                                                                   value="${_csrf.token}"/>

                                                                                            <button type="submit"
                                                                                                    class="btn btn-purple">
                                                                                                Применить
                                                                                            </button>
                                                                                        </form>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title" align="center">Таблица всех залов</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <table id="tgym"
                                                           class="table table-striped table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>Название</th>
                                                            <th>Действие</th>
                                                        </tr>
                                                        </thead>

                                                        <tbody>
                                                        <c:forEach items="${gyms}" var="gym1">
                                                            <tr>
                                                                <td>${gym1.getGym_name()}</td>
                                                                <td>
                                                                    <a href="#myModal${gym1.getIdGym()+ 1575}"
                                                                       class="btn btn-block btn-danger"
                                                                       data-toggle="modal">Удалить</a>
                                                                    <!-- HTML-код модального окна-->
                                                                    <div id="myModal${gym1.getIdGym() + 1575}"
                                                                         class="modal fade">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <!-- Заголовок модального окна -->
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close"
                                                                                            data-dismiss="modal"
                                                                                            aria-hidden="true">×
                                                                                    </button>
                                                                                    <h4 class="modal-title">Вы точно
                                                                                        хотите удалить
                                                                                        зал ${gym1.getGym_name()}  </h4>
                                                                                </div>
                                                                                <!-- Основное содержимое модального окна -->
                                                                                <div class="modal-body">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <div class="panel panel-default">
                                                                                                <div class="panel-heading">
                                                                                                    <h3 class="panel-title"
                                                                                                        align="center">
                                                                                                        Удалить</h3>
                                                                                                </div>
                                                                                                <div class="panel-body">
                                                                                                    <form class="form-horizontal"
                                                                                                          role="form">
                                                                                                        <a href=" <c:url value='/admin/deleteGym/${gym1.getIdGym()}'/> ">
                                                                                                            <button
                                                                                                                    type="button"
                                                                                                                    class="btn btn-block btn-danger">
                                                                                                                Удалить
                                                                                                            </button>
                                                                                                        </a>
                                                                                                    </form>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <a href="#myModal4${gym1.getIdGym()+ 1575}"
                                                                       class="btn btn-block btn-default"
                                                                       data-toggle="modal">Изменить</a>


                                                                    <div id="myModal4${gym1.getIdGym() + 1575}"
                                                                         class="modal fade">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <!-- Заголовок модального окна -->
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close"
                                                                                            data-dismiss="modal"
                                                                                            aria-hidden="true">×
                                                                                    </button>
                                                                                    <h4 class="modal-title">Изменить
                                                                                        зал</h4>
                                                                                </div>
                                                                                <!-- Основное содержимое модального окна -->
                                                                                <div class="modal-body">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <div class="panel panel-default">
                                                                                                <div class="panel-heading">
                                                                                                    <h3 class="panel-title"
                                                                                                        align="center">
                                                                                                        Данные для
                                                                                                        изменения
                                                                                                        зала</h3>
                                                                                                </div>
                                                                                                <div class="panel-body">
                                                                                                    <form class="form-horizontal"
                                                                                                          role="form"
                                                                                                          action="admin/editGym"
                                                                                                          id="gym_edit1"
                                                                                                          method="post"
                                                                                                          accept-charset="windows1251">
                                                                                                        <input type="hidden"
                                                                                                               name="gymId"
                                                                                                               value="${gym1.getIdGym()}"/>
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-md-2 control-label">Название</label>
                                                                                                            <div class="col-md-10">
                                                                                                                <input type="text"
                                                                                                                       class="form-control"
                                                                                                                       placeholder="Название"
                                                                                                                       name="gym_name"
                                                                                                                       value="${gym1.getGym_name()}"/>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <input type="hidden"
                                                                                                               name="${_csrf.parameterName}"
                                                                                                               value="${_csrf.token}"/>

                                                                                                        <button type="submit"
                                                                                                                class="btn btn-purple">
                                                                                                            Применить
                                                                                                        </button>
                                                                                                    </form>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <div class="panel-body">
                                                        <a href="#myModal2" class="btn btn-primary"
                                                           data-toggle="modal">Добавить</a>
                                                        <!-- HTML-код модального окна-->
                                                        <div id="myModal2" class="modal fade">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <!-- Заголовок модального окна -->
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal"
                                                                                aria-hidden="true">
                                                                        </button>
                                                                        <h4 class="modal-title">Добавить зал</h4>
                                                                    </div>
                                                                    <!-- Основное содержимое модального окна -->
                                                                    <div class="modal-body">
                                                                        <div class="row">
                                                                            <div class="col-sm-12">
                                                                                <div class="panel panel-default">
                                                                                    <div class="panel-heading">
                                                                                        <h3 class="panel-title"
                                                                                            align="center">
                                                                                            Данные для добавления
                                                                                            зала</h3>
                                                                                    </div>
                                                                                    <div class="panel-body">
                                                                                        <form class="form-horizontal"
                                                                                              role="form"
                                                                                              action="admin/addGym"
                                                                                              id="gym_edit"
                                                                                              method="post"
                                                                                              accept-charset="windows1251">
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-2 control-label">Название</label>
                                                                                                <div class="col-md-10">
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           placeholder="Название"
                                                                                                           name="gym_name">
                                                                                                </div>
                                                                                            </div>
                                                                                            <input type="hidden"
                                                                                                   name="${_csrf.parameterName}"
                                                                                                   value="${_csrf.token}"/>

                                                                                            <button type="submit"
                                                                                                    class="btn btn-purple">
                                                                                                Применить
                                                                                            </button>
                                                                                        </form>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="tab-pane fade" id="users">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title" align="center">Таблица всех пользователей</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <table id="tuser_roles"
                                                           class="table table-striped table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>Логин</th>
                                                            <th>Роль</th>
                                                            <th>Действие</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${user_roles}" var="user_role">
                                                            <tr>
                                                                <td>${user_role.getUsername()}</td>
                                                                <td>${user_role.getRole()}</td>
                                                                <td>
                                                                    <a href="#myModal10${user_role.getUser_role_id()+754}"
                                                                       class="btn btn-block btn-danger"
                                                                       data-toggle="modal">Удалить</a>

                                                                    <div id="myModal10${user_role.getUser_role_id()+754}"
                                                                         class="modal fade">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <!-- Заголовок модального окна -->
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close"
                                                                                            data-dismiss="modal"
                                                                                            aria-hidden="true">×
                                                                                    </button>
                                                                                    <h4 class="modal-title">Вы точно
                                                                                        хотите удалить
                                                                                        роль ${user_role.getUsername()}  </h4>
                                                                                </div>
                                                                                <!-- Основное содержимое модального окна -->
                                                                                <div class="modal-body">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <div class="panel panel-default">
                                                                                                <div class="panel-heading">
                                                                                                    <h3 class="panel-title"
                                                                                                        align="center">
                                                                                                        Удалить</h3>
                                                                                                </div>
                                                                                                <div class="panel-body">
                                                                                                    <form class="form-horizontal"
                                                                                                          role="form">
                                                                                                        <a href=" <c:url value='/admin/deleteUserRole/${user_role.getUser_role_id()}'/> ">
                                                                                                            <button
                                                                                                                    type="button"
                                                                                                                    class="btn btn-block btn-danger">
                                                                                                                Удалить
                                                                                                            </button>
                                                                                                        </a>
                                                                                                    </form>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>



                                                                    <a href="#myModal7${user_role.getUser_role_id()+754}"
                                                                       class="btn btn-block btn-default"
                                                                       data-toggle="modal">Изменить</a>


                                                                    <div id="myModal7${user_role.getUser_role_id()+754}" class="modal fade">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <!-- Заголовок модального окна -->
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close"
                                                                                            data-dismiss="modal"
                                                                                            aria-hidden="true">×
                                                                                    </button>
                                                                                    <h4 class="modal-title">Изменить роль</h4>
                                                                                </div>
                                                                                <!-- Основное содержимое модального окна -->
                                                                                <div class="modal-body">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <div class="panel panel-default">
                                                                                                <div class="panel-heading">
                                                                                                    <h3 class="panel-title"
                                                                                                        align="center">
                                                                                                        Данные для изменения
                                                                                                        роли</h3>
                                                                                                </div>
                                                                                                <div class="panel-body">
                                                                                                    <form class="form-horizontal"
                                                                                                          role="form"
                                                                                                          action="admin/editRole"
                                                                                                          id="user_roles_edit1"
                                                                                                          method="post"
                                                                                                          accept-charset="windows1251">

                                                                                                        <input type="hidden"
                                                                                                               name="roleId"
                                                                                                               value="${user_role.getUser_role_id()}"/>
                                                                                                        <div class="form-group">
                                                                                                            <label class="col-sm-2 control-label">Для
                                                                                                                кого</label>
                                                                                                            <div class="col-sm-10">
                                                                                                                <select id="faculties1"
                                                                                                                        class="form-control"
                                                                                                                        name="username">
                                                                                                                    <c:forEach
                                                                                                                            items="${user_roles}"
                                                                                                                            var="user_role">
                                                                                                                        <option value="${user_role.getUsername()}"> ${user_role.getUsername()}</option>
                                                                                                                    </c:forEach>
                                                                                                                </select>
                                                                                                            </div>
                                                                                                        </div>

                                                                                                        <div class="form-group">
                                                                                                            <label class="col-md-2 control-label">Роль</label>
                                                                                                            <div class="col-md-10">
                                                                                                                <input type="text"
                                                                                                                       class="form-control"
                                                                                                                       placeholder="Роль"
                                                                                                                       name="role"
                                                                                                                       value="${user_role.getRole()}"/>
                                                                                                            </div>
                                                                                                        </div>

                                                                                                        <input type="hidden"
                                                                                                               name="${_csrf.parameterName}"
                                                                                                               value="${_csrf.token}"/>

                                                                                                        <button type="submit"
                                                                                                                class="btn btn-purple">
                                                                                                            Применить
                                                                                                        </button>
                                                                                                    </form>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                        </tbody>
                                                    </table>
                                                    <div class="panel-body">
                                                        <a href="#myModal3" class="btn btn-primary"
                                                           data-toggle="modal">Добавить</a>
                                                        <!-- HTML-код модального окна-->
                                                        <div id="myModal3" class="modal fade">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <!-- Заголовок модального окна -->
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal"
                                                                                aria-hidden="true">×
                                                                        </button>
                                                                        <h4 class="modal-title">Добавить роль</h4>
                                                                    </div>
                                                                    <!-- Основное содержимое модального окна -->
                                                                    <div class="modal-body">
                                                                        <div class="row">
                                                                            <div class="col-sm-12">
                                                                                <div class="panel panel-default">
                                                                                    <div class="panel-heading">
                                                                                        <h3 class="panel-title"
                                                                                            align="center">
                                                                                            Данные для добавления
                                                                                            новой роли</h3>
                                                                                    </div>
                                                                                    <div class="panel-body">
                                                                                        <form class="form-horizontal"
                                                                                              role="form"
                                                                                              action="admin/addRole"
                                                                                              id="user_roles_edit"
                                                                                              method="post"
                                                                                              accept-charset="windows1251">


                                                                                            <div class="form-group">
                                                                                                <label class="col-sm-2 control-label">Для
                                                                                                    кого</label>
                                                                                                <div class="col-sm-10">
                                                                                                    <select id="faculties"
                                                                                                            class="form-control"
                                                                                                            name="username">
                                                                                                        <c:forEach
                                                                                                                items="${user_roles}"
                                                                                                                var="user_role">
                                                                                                            <option value="${user_role.getUsername()}"> ${user_role.getUsername()}</option>
                                                                                                        </c:forEach>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="form-group">
                                                                                                <label class="col-md-2 control-label">Роль</label>
                                                                                                <div class="col-md-10">
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           placeholder="Роль"
                                                                                                           name="role">
                                                                                                </div>
                                                                                            </div>

                                                                                            <input type="hidden"
                                                                                                   name="${_csrf.parameterName}"
                                                                                                   value="${_csrf.token}"/>

                                                                                            <button type="submit"
                                                                                                    class="btn btn-purple">
                                                                                                Применить
                                                                                            </button>
                                                                                        </form>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#datatable').dataTable();
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#table').dataTable();
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#All_studenttable').dataTable();
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#All_requesttable').dataTable();
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#All_studenttable1').dataTable();
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#All_requesttable1').dataTable();
    });
</script>
</body>
</html>
