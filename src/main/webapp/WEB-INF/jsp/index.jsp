<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="static/css/bootstrap.min.css" rel="stylesheet" />
    <title>Task Manager</title>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light py-0" id="nv">
    <a class="navbar-brand pl-5" href="/">
        <span class="pl-3 font-italic">TASKMANAGER</span></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fa fa-bars" style="color : white"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav ml-auto mr-5">
            <a class="nav-item nav-link mx-4 active" href="/">Tasks<span class="sr-only">(current)</span></a>
            <a class="nav-item nav-link mx-4 " href="/task">New Task</a>
        </div>
    </div>
</nav>
<div class="container">
<table class="table table-striped">
    <thead>
    <tr>

        <th scope="col">Name</th>
        <th scope="col">Description</th>
        <th scope="col">Date created</th>
        <th scope="col">Finished</th>
        <th scope="col"></th>
        <th scope="col"></th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${ tasks }" var="task" >
        <tr>
            <td>${ task.name}</td>
            <td>${task.description}</td>
            <td><fmt:formatDate type = "date"
                                value = "${ task.dateCreated}" /></td>
            <td>${ task.finished ? "YES" : "NOT YET" }</td>

            <c:url value="task" var="newTask">
                <c:param name="id"   value="${task.id}" />
                <c:param name="name"    value="${task.name}" />
                <c:param name="description" value="${task.description}" />
                <c:param name="finished"    value="${task.finished}" />
            </c:url>
            <td><a href="<c:out value="${ newTask }"></c:out>"><button type="button" class="btn btn-primary btn-sm">Edit</button>
            </a></td>

            <td><a href="/delete?id=${task.id}"><button type="button" class="btn btn-danger btn-sm">Delete</button>
            </a></td>

        </tr>
    </c:forEach>

    </tbody>
</table>
</div>
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js " integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb " crossorigin="anonymous "></script>
<script src="static/js/bootstrap.min.js"></script>

</body>
</html>