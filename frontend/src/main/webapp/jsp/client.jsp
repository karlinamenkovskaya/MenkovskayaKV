<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<html>
<head>
    <title>Страница клиента</title>
    <jsp:include page="/jsp/blocks/header1.jsp"/>

    <script src="resources/js/libs/jquery.form-validator.min.js"></script>

    <script>
        function fillForm() {
            $.ajax({
                url: 'clients/get/${id}',
                dataType: 'json',
                success: function (data) {
                    $('#user_avatar').attr("src", "images/1.png");
                    $('#user_name').html(data.first_name + " " + data.last_name);
                    $('#phone_number').text(data.phone_number);
                    $('#email').text(data.email);
                    $('input[name=fname]').val(data.first_name);
                    $('input[name=lname]').val(data.last_name);
                    $('input[name=phone_number]').val(data.phone_number);
                    $('input[name=email]').val(data.email);
                }
            });
            $('#client_edit').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#user_avatar').attr("src", "images/" + data.imageUrl);
                        $('#user_name').html(data.first_name + " " + data.last_name);
                        $('#email').text(data.email);
                        $('#success').css('display', 'block');
                    } else {
                        $('#error').css('display', 'block');
                    }
                }
            });
            $('#tinformation').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false
            });
            $('#tcalculation1').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false
            });
            $.validate({
                lang: 'ru'
            });

        }

        function addCalc(id) {
            $.ajax({
                url: "/calculation/addCalculation/" + id + '?${_csrf.parameterName}=${_csrf.token}',
                method: "post",
                success: function (data) {
                    $('#idSubscription').text(data.idSubscription);
                }
            })
        }

        function deleteCalculation(id) {
            $.ajax({
                url: "/calculation/deleteCalculation/" + id + '?${_csrf.parameterName}=${_csrf.token}',
                method: "post",
                success: function (data) {
                    $('#idSubscription').text(data.idSubscription);
                }
            })
        }
    </script>
</head>
<body body onload="fillForm()" class="hold-transition login-page">
<aside class="left-panel">
    <img src="resources/img/user.png" width="150"
         height="150" class="image_centre">
    <h5 id="email" align="center">${email}</h5>
    <h5 align="center">Статус: Клиент</h5>
    <h5 id="user_name" align="center">${name}</h5>
    <div class="form-group text-right">
        <div class="col-xs-17" align="center">
            <a href="/logout">
                <button class="btn btn-primary w-md">Выйти</button>
            </a>
        </div>
    </div>
</aside>
<!--Main Content -->
<section class="content">

    <!-- Page Content -->
    <div class="panel-body">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs">
            <li class="active"><a href="#home" data-toggle="tab" aria-expanded="false">Главная</a>
            </li>
            <li class=""><a href="#profile" data-toggle="tab" aria-expandeds="false">Расписание</a>
            <li class=""><a href="#contacts" data-toggle="tab" aria-expanded="false">Контакты</a>
            <li class=""><a href="#personal" data-toggle="tab" aria-expanded="false">Личные данные</a>
        </ul>
        <div class="tab-content ">
            <div class="tab-pane fade active in" id="home">
                <section id="featured">
                <div id="main-slider" class="slider">
                    <ul class="slides">
                        <li>
                            <img src="resources/img/banner.png" width="100%"/>
                        </li>
                    </ul>
                </div>
                <!-- end slider -->

</section>
<div class="content_white" align="center">
    <h2>Добро пожаловать в портал музыкальной студии "Аккорд"!</h2>
    <p> Мы современная музыкальная студия в самом центре города. Ждем вас, чтобы показать высший класс преподвания музыки!</p>
</div>
<div class="featured_content">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-3 feature_grid1"> <img src="resources/img/1.png" width="50px">
                <h3><a href="#">Уроки музыки</a></h3>
                <p>В нашей студии преподается игра более чем на 20 самых востребованных музыкальных инструментах.</p>
            </div>
            <div class="col-md-3 feature_grid1"> <img src="resources/img/2.png" width="50px">
                <h3><a href="#">Звукозапись</a></h3>
                <p>Аренда студии, заппись вокала, запись музыкальных инструментов.</p>
            </div>
            <div class="col-md-3 feature_grid1"> <img src="resources/img/3.png" width="50px">
                <h3><a href="#">Вокал</a></h3>
                <p>Индивидуальные и групповые уроки для начинающих, любителей и профессионалов</p>
            </div>
            <div class="col-md-3 feature_grid1"> <img src="resources/img/4.png" width="50px">
                <h3><a href="#">Хор</a></h3>
                <p>Станьте участниками профессионального хора и выступайте по всей стране.</p>
            </div>
        </div>
    </div>
</div>

<section id="content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- Heading and para -->
                <div class="block-heading-two">
                    <h3><span>Почему мы?</span></h3>
                </div>
                <p>
                    Музыкальная школа предлагает обучение музыке для детей и взрослых. Ваш возраст и музыкальная подготовка не имеет значения. Курс занятий подбирается индивидуально, после проверки Ваших музыкальных способностей.
                    Школа предлагает гибкую систему оплаты уроков музыки и самые оптимальные цены. Регулярно организовывает концерты и показательные выступления, предоставляя возможность ученикам выступить на сцене, а также сотрудничаем со студиями звукозаписи и СМИ.</p>
        </div>
    </div>
    </div>
</section>
            </div>
            <div class="tab-pane fade" id="contacts">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title" align="center">Контакты разработчика</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" id="card_view"
                                  role="form">
                                <div class="form-group" align="center">
                                    <label>Меньковская Каролина Валерьевна </label>
                                </div>
                                <div class="form-group" align="center">
                                    <label>Компания: </label>
                                    <label>ООО "Техартгруп"</label>
                                </div>
                                <div class="form-group" align="center">
                                    <label>Телефон: </label>
                                    <label>+375447642733</label>
                                </div>
                                <div class="form-group" align="center">
                                    <label>Электронная почта: </label>
                                    <label>karolinamenkovskaya@gmail.com</label>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title" align="center">Пожалуйста, заполните все поля</h3>
                        </div>

                        <div class="box-header with-border">
                            <h3 class="box-title" align="center">Возник вопрос?Свяжитесь с нами через форму обратной связи!</h3>
                        </div>

                        <div id="success1" class="alert alert-success alert-dismissible" style="display: none">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <h4> Ваш завпрос отправлен!</h4>
                        </div>

                        <div id="error1" class="alert alert-danger alert-dismissible" style="display: none">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <h4><i class="icon fa fa-ban"></i> Ошибка!</h4>
                        </div>

                        <div class="panel-body">
                            <form class="form-horizontal" id="сщтефсе_ащкь"
                                  action="/clients/contact"
                                  method="post"
                                  role="form">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Имя</label>
                                    <div class="col-md-10">
                                        <input data-validation="length letternumeric" data-validation-length="2-45"
                                               type="text" class="form-control" placeholder="Имя"
                                               name="first_name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Фамилия</label>
                                    <div class="col-md-10">
                                        <input data-validation="length letternumeric" data-validation-length="2-45"
                                               type="text" class="form-control" placeholder="Фамилия"
                                               name="last_name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Номер телефона</label>
                                    <div class="col-md-10">
                                        <input data-validation="length number" data-validation-length="7"
                                               data-validation-error-msg="Телефон должен быть семизначным числом"
                                               type="text" class="form-control" placeholder="Телефон"
                                               name="phone_number">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Ваш вопрос</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" required="" name="quastion"
                                               placeholder="Введите ваш вопрос">
                                    </div>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}"
                                       value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-purple">
                                    Отправить
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="tab-pane fade" id="personal">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title" align="center">Мои записи</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="tcalculation1" class="table table-striped table-bordered">

                                            <thead>
                                            <tr>
                                                <th>Название</th>
                                                <th>Стоимость</th>
                                                <th>Студия</th>
                                                <th>Дни проведения</th>
                                                <th>Месяц</th>
                                                <th>Отписаться</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${calculations}" var="cul">
                                                <tr>
                                                    <td>${cul.getDescription()}</td>
                                                    <td>${cul.getValue()}</td>
                                                    <td>${gyms.stream().filter(gym -> gym.getIdGym()==cul.getIdGym()).findFirst().get().getGym_name()}</td>
                                                    <td>${cul.getDay1()} - ${cul.getDay2()}</td>
                                                    <td>${cul.getMonth()}</td>
                                                    <td>
                                                        <a href="#myModal${cul.getidSubscription()}"
                                                           class="btn btn-block btn-danger"
                                                           data-toggle="modal">Удалить</a>
                                                        <!-- HTML-код модального окна-->
                                                        <div id="myModal${cul.getidSubscription()}" class="modal fade">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <!-- Заголовок модального окна -->
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal"
                                                                                aria-hidden="true">×
                                                                        </button>
                                                                        <h4 class="modal-title">Вы точно
                                                                            хотите отписаться от абонемента
                                                                                ${cul.getDescription()}</h4>
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
                                                                                            <a href=" <c:url value='/calculation/deleteCalculation1/${id}/${cul.getidSubscription()}'/> ">
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
                    <div class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title" align="center">Личные данные</h3>
                            </div>
                            <div id="success" class="alert alert-success alert-dismissible" style="display: none">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <h4> Изменения приняты!</h4>
                            </div>

                            <div id="error" class="alert alert-danger alert-dismissible" style="display: none">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <h4><i class="icon fa fa-ban"></i> Ошибка!</h4>
                            </div>

                            <div class="panel-body">
                                <form class="form-horizontal" id="client_edit"
                                      action="/clients/edit/${id}?${_csrf.parameterName}=${_csrf.token}"
                                      method="post"
                                      role="form">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Имя</label>
                                        <div class="col-md-10">
                                            <input data-validation="length letternumeric" data-validation-length="2-45"
                                                   type="text" class="form-control" placeholder="Имя"
                                                   name="first_name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Фамилия</label>
                                        <div class="col-md-10">
                                            <input data-validation="length letternumeric" data-validation-length="2-45"
                                                   type="text" class="form-control" placeholder="Фамилия"
                                                   name="last_name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Номер телефона</label>
                                        <div class="col-md-10">
                                            <input data-validation="length number" data-validation-length="7"
                                                   data-validation-error-msg="Телефон должен быть семизначным числом"
                                                   type="text" class="form-control" placeholder="Телефон"
                                                   name="phone_number">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Email</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" type="email" required="" name="email"
                                                   placeholder="Email">
                                        </div>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}"
                                           value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-purple">
                                        Применить
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="profile">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title" align="center">Услуги центра</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="tinformation" class="table table-striped table-bordered">
                                            <thead>
                                            <tr>
                                                <th>Название</th>
                                                <th>Стоимость</th>
                                                <th>Студия</th>
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
                                                        <a href=" <c:url value='/client'/> ">
                                                            <button class="btn btn-primary w-md"
                                                                    onclick="addCalc(${sub.getidSubscription()})">
                                                                Записаться
                                                            </button>
                                                        </a>
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

            </div>

        </div>
    </div>


    <!-- Page Content Ends -->

    <!-- Footer -->
    <footer class="footer">
        2021 © Admina By Menkovskaya
    </footer>
    <!-- End Footer -->

</section>
<script type="text/javascript">
    $(document).ready(function () {
        $('#datatable').dataTable();
    });
</script>

</body>
</html>
