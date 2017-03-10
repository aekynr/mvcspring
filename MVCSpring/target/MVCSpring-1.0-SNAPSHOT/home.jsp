<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html; ISO-8859-1" language="java" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery-browser-plugin.js"></script>
    <script src="js/jquery.maskedinput.min.js"></script>
    <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>

    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#newUser">New User</button>

<div class="table-responsive">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>username</th>
            <th>firstname</th>
            <th>lastname</th>
            <th>phonenumber</th>
            <th></th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${listUser}" var="user">
            <tr>
                <td>${user.getId()}</td>
                <td>${user.getUsername()}</td>
                <td>${user.getFirstName()}</td>
                <td>${user.getLastName()}</td>
                <td>${user.getPhoneNumber()}</td>
                <td><a href="#" class="confirm-delete" data-id="${user.getId()}">Delete</a> | <a href="#" class="updateUser" data-id="${user.getId()}" >Update</a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<!-- Modal -->
<div id="newUser" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">New User</h4>
            </div>

            <spring:url value="/save" var="saveUrl"/>
            <form:form action="${saveUrl}" modelAttribute="userForm" method="Post">
                <div class="modal-body">
                    <form:input path="username" placeholder="user name"></form:input><br>
                    <form:input path="firstName" placeholder="first name" required="required"></form:input><br>
                    <form:input path="lastName" placeholder="last name" rrequired="required"></form:input><br>
                    <form:input path="phoneNumber" id="phoneNumber" placeholder="(5XX) XXX-XXXX"></form:input><br>
                    <div class="g-recaptcha" data-sitekey="6Ld-tAkTAAAAAGPB_a9nLra297ISh1pAaV4aGWAp"></div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Save</button>
                </div>
            </form:form>
        </div>

    </div>
</div>

<!-- Modal -->
<div id="updateUser" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Update User</h4>
            </div>
            <spring:url value="/save" var="saveUrl"/>
            <form:form action="${saveUrl}" modelAttribute="userForm" method="Post">
                <div class="modal-body">
                    <input type="hidden" name="id" id="id" value=""/><br>
                    <input type="text" name="username" id="username" value="" placeholder="username"/><br>
                    <input type="text" name="firstName" id="firstName" value="" placeholder="first name" required/><br>
                    <input type="text" name="lastName" id="lastName" value="" placeholder="last name" required/><br>
                    <input type="text" name="phoneNumber" value="" id="phoneNumberUpdate" placeholder="(5XX) XXX-XXXX"/><br>
                </div>
                <div class="modal-footer">
                    <button type="submit">Save</button>
                </div>
            </form:form>
        </div>

    </div>
</div>

<div id="confirm" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Delete User</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure?</p>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-primary" id="btnYes">Delete</button>
                <button type="button" data-dismiss="modal" class="btn">Cancel</button>
            </div>
        </div>

    </div>
</div>


<script src="js/custom.js"></script>


</body>
</html>