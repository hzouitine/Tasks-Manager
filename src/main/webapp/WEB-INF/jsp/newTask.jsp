<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new task</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet" />

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
<div class="container mt-5">
    <form:form action="/" method="post">
        <form:hidden path="id" />
        <div class="form-group">
            <form:label path="name">Task name</form:label>
            <form:input type="text" cssClass="form-control" path="name" />
        </div>
        <div class="form-group">
            <form:label path="description">Description</form:label>
            <form:textarea path="description" cssClass="form-control" rows="3"></form:textarea>
        </div>
        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-2 pt-0">Finished</legend>
                <div class="col-sm-10">
                    <div class="form-check">
                        <form:radiobutton cssClass="form-check-input" path="finished" value="true" />
                        <form:label cssClass="form-check-label" path="finished">
                            YES
                        </form:label>
                    </div>
                    <div class="form-check">
                        <form:radiobutton cssClass="form-check-input" path="finished" value="false" />
                        <form:label cssClass="form-check-label" path="finished">
                            NO
                        </form:label>
                    </div>
                </div>
            </div>
        </fieldset>
        <button type="submit" cssClass="btn btn-primary">Create</button>
    </form:form>
</div>
</body>
</html>
