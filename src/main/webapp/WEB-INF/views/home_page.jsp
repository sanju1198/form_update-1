<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Pattadar Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        .form-card {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 2px solid #007bff;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
            background-color: #f8f9fa;
        }
        .form-label {
            font-weight: bold;
        }
        .form-card {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 2px solid #175690;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
            background-color: #f8f9fa;
        }
        .form-label {
            font-weight: bold;
        }
        .hidden-field {
            display: none;
        }
        .text-danger {
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="form-card justify-content-center">
        <h2 class="text-center mb-4 fw-bold">Pattadar Form Input</h2>

        <form:form action="/form"
                   modelAttribute="formEntity"
                   method="post"
                   cssClass="needs-validation"
                   htmlEscape="true">

            <div class="mb-3 align-items-center">
                <!-- Land Owner -->
                <div class="col-md-6">
                    <label class="form-label">Land Owner</label>
                    <div class="d-flex align-items-center">
                        <form:input path="landOwner" cssClass="form-control me-2"/>
                        <c:if test="${not empty errors.landOwner}">
                            <div class="text-danger" style="white-space: nowrap;">${errors.landOwner}</div>
                        </c:if>
                    </div>
                </div>

                <!-- Father Name -->
                <div class="col-md-6">
                    <label class="form-label">Father Name</label>
                    <div class="d-flex align-items-center">
                        <form:input path="fatherName" cssClass="form-control me-2"/>
                        <c:if test="${not empty errors.fatherName}">
                            <div class="text-danger" style="white-space: nowrap;">${errors.fatherName}</div>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <!-- Aadhaar Number -->
                <div class="col-md-6">
                    <label class="form-label">Aadhaar Number</label>
                    <div class="d-flex align-items-center">
                        <form:input path="aadhaarNo" cssClass="form-control me-2"/>
                        <c:if test="${not empty errors.aadhaarNo}">
                            <div class="text-danger" style="white-space: nowrap;">${errors.aadhaarNo}</div>
                        </c:if>
                    </div>
                </div>

                <!-- Khata No -->
                <div class="col-md-6">
                    <label class="form-label">Khata No</label>
                    <div class="d-flex align-items-center">
                        <form:input path="khataNo" cssClass="form-control me-2"/>
                        <c:if test="${not empty errors.khataNo}">
                            <div class="text-danger" style="white-space: nowrap;">${errors.khataNo}</div>
                        </c:if>
                    </div>
                </div>
                <div class="col-md-6">
                    <label class="form-label">New Pattadar Book No</label>
                    <div class="d-flex align-items-center">
                        <form:input path="newPattadarBookNo" cssClass="form-control me-2"/>
                        <c:if test="${not empty errors.newPattadarBookNo}">
                            <div class="text-danger">${errors.newPattadarBookNo}</div>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <!-- New Pattadar Book -->
                <label class="form-label">Do you have a New Pattadar Book?</label><br/>
                <div class="form-check form-check-inline">
                    <form:radiobutton path="newPattadarBook" value="true" cssClass="form-check-input" id="newYes"/>
                    <label class="form-check-label" for="newYes">Yes</label>
                </div>
                <div class="form-check form-check-inline">
                    <form:radiobutton path="newPattadarBook" value="false" cssClass="form-check-input" id="newNo"/>
                    <label class="form-check-label" for="newNo">No</label>
                </div>


            </div>

            <div class="mb-3">
                <!-- Old Pattadar Book -->
                <label class="form-label">Do you have an Old Pattadar Book?</label><br/>
                <div class="form-check form-check-inline">
                    <form:radiobutton path="oldPattadarBook" value="true" cssClass="form-check-input" id="oldYes"/>
                    <label class="form-check-label" for="oldYes">Yes</label>
                </div>
                <div class="form-check form-check-inline">
                    <form:radiobutton path="oldPattadarBook" value="false" cssClass="form-check-input" id="oldNo"/>
                    <label class="form-check-label" for="oldNo">No</label>
                </div>
                <c:if test="${not empty errors.oldPattadarBook}">
                    <div class="text-danger" style="white-space: nowrap;">${errors.oldPattadarBook}</div>
                </c:if>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary px-4">Submit</button>
            </div>
        </form:form>



    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    (() => {
        'use strict';
        window.addEventListener('load', function () {
            const forms = document.getElementsByClassName('needs-validation');
            Array.prototype.forEach.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();


</script>
</body>
</html>
