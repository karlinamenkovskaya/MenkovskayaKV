<%--
  Created by IntelliJ IDEA.
  User: BigPc
  Date: 14.10.2017
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<html>
<head>
    <title>Страница тренера</title>
    <jsp:include page="/jsp/blocks/header1.jsp"/>
    <script>
        function fillForm() {
            $.ajax({
                url: 'coachs/get/${id}',
                dataType: 'json',
                success: function (data) {
                    $('#user_avatar').attr("src", "images/" + data.imageUrl);
                    $('#user_name').html(data.first_name + " " + data.last_name);
                    $('#phone_number').text(data.phone_number);
                    $('input[name=fname]').val(data.first_name);
                    $('input[name=lname]').val(data.last_name);
                }
            });
            $('#coach_edit').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data) {
                        $('#user_avatar').attr("src", "images/" + data.imageUrl);
                        $('#user_name').html(data.first_name + " " + data.last_name);
                        //that's a trick to avoid requests to a faculty table for a name (that'll mean either additional
                        // request from here, or returing something else than student from controller)
                        // we will do such request to fill our select below
                        //(not implemented yet)
                        $('#success').css('display', 'block');
                    } else {
                        $('#error').css('display', 'block');
                    }
                }
            });

            $('#tcalculation1').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false
            });
        }
    </script>
</head>
<body onload="fillForm()">
<aside class="left-panel">
    <img src="https://cdn.pixabay.com/photo/2015/10/30/12/24/teacher-1014055_1280.jpg" width="150"
         height="150" class="image_centre">
    <h5  align="center">${email}</h5>
    <h5  align="center">Статус: Тренер</h5>
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

        <div class="wraper container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title" align="center">Личные данные</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal"  id="coach_edit"
                                  action="/coachs/edit/${id}?${_csrf.parameterName}=${_csrf.token}"
                                  method="post" role="form">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Имя</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" placeholder="Имя" name="first_name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Фамилия</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" placeholder="Фамилия" name="last_name">
                                    </div>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}"
                                       value="${_csrf.token}"/>

                                <button type="submit" class="btn btn-purple">
                                    Применить
                                </button>

                            </form>
                        </div>
                        <!-- panel-body -->
                    </div>
                    <!-- panel -->
                </div>
                <!-- col -->
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title" align="center">Расписание</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <table id="tcalculation1" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Название</th>
                                            <th>Зал</th>
                                            <th>Дни проведения</th>
                                            <th>Месяц</th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <c:forEach items="${timetable}" var="time">
                                            <tr>
                                                <td>${time.getDescription()}</td>
                                                <td>${gyms.stream().filter(gym -> gym.getIdGym()==time.getIdGym()).findFirst().get().getGym_name()}</td>
                                                <td>${time.getDay1()} - ${time.getDay2()}</td>
                                                <td>${time.getMonth()}</td>
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

        <!-- Page Content Ends -->

        <!-- Footer -->
        <footer class="footer">
            2020 © Admina By Menkovskaya
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
