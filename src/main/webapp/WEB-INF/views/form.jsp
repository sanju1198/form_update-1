<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pattadar Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --sidebar-color: #1E293B;
            --navbar-color: #334155;
            --background-color: #F1F5F9;
            --hover-color: #CBD5E1;
            --text-color: #1E293B;
        }

        body {
            background-color: var(--background-color);
            color: var(--text-color);
            padding-top: 56px;
            font-family: 'Segoe UI', sans-serif;
        }

        .navbar {
            background-color: var(--navbar-color);
        }

        .navbar .navbar-brand,
        .navbar .navbar-text {
            color: white;
        }

        .sidebar {
            position: fixed;
            top: 56px;
            left: 0;
            width: 220px;
            height: calc(100vh - 56px);
            background-color: var(--sidebar-color);
            padding: 1rem;
            overflow-y: auto;
        }

        .sidebar .nav-link {
            color: white;
            padding: 0.5rem 0.75rem;
            border-radius: 0.375rem;
            transition: background-color 0.2s ease;
        }

        .sidebar .nav-link:hover {
            background-color: var(--hover-color);
            color: var(--text-color);
        }

        .content {
            margin-left: 220px;
            padding: 2rem;
        }

        .form-label {
            font-weight: bold;
        }

        .text-danger {
            font-size: 0.875rem;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar fixed-top shadow-sm">
    <div class="container-fluid">
        <span class="navbar-brand">Bhu Bharathi</span>
        <div class="d-flex ms-auto">
            <span class="navbar-text">Profile</span>
        </div>
    </div>
</nav>

<!-- Sidebar -->
<div class="sidebar">
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link active" href="#">Dashboard</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Pattadar Form</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Settings</a>
        </li>
    </ul>
</div>

<!-- Main Content -->
<div class="content">
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <!-- New Form Button -->
    <div class="mb-3 text-end">
        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#formModal">New Form</button>
    </div>

    <!-- TODO: Add your table here -->
    <!-- Table of records -->
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>#</th>
            <th>Land Owner</th>
            <th>Father Name</th>
            <th>Aadhaar</th>
            <th>New Book</th>
            <th>New Book No</th>
            <th>Old Book</th>
            <th>Khata No</th>
            <th>Actions</th> <!-- Add a column for actions -->
        </tr>
        </thead>
        <tbody>
        <c:forEach var="entry" items="${entries}" varStatus="i">
            <tr>
                <td>${i.index + 1}</td>
                <td>${entry.landOwner}</td>
                <td>${entry.fatherName}</td>
                <td>${entry.aadhaarNo}</td>
                <td>${entry.newPattadarBook}</td>
                <td>${entry.newPattadarBookNo}</td>
                <td>${entry.oldPattadarBook}</td>
                <td>${entry.khataNo}</td>

                <!-- Update button (Post) -->
                <td>
                    <!-- Open the update form in a modal (or redirect to an edit page) -->
                    <!-- Edit button -->
                    <a href="javascript:void(0);" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#formModal"
                       onclick="populateForm(${entry.id})">Edit</a>


                    <!-- Delete button -->
                    <a href="/forms/delete/${entry.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this entry?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Modal -->
    <div class="modal fade" id="formModal" tabindex="-1" aria-labelledby="formModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="formModalLabel">New Pattadar Form</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form:form action="/forms/save" modelAttribute="formEntity" method="post">
                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Land Owner</label>
                                <form:input path="landOwner" cssClass="form-control"/>
                                <c:if test="${not empty errors.landOwner}">
                                    <div class="text-danger">${errors.landOwner}</div>
                                </c:if>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Father Name</label>
                                <form:input path="fatherName" cssClass="form-control"/>
                                <c:if test="${not empty errors.fatherName}">
                                    <div class="text-danger">${errors.fatherName}</div>
                                </c:if>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Aadhaar Number</label>
                                <form:input path="aadhaarNo" cssClass="form-control"/>
                                <c:if test="${not empty errors.aadhaarNo}">
                                    <div class="text-danger">${errors.aadhaarNo}</div>
                                </c:if>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Khata No</label>
                                <form:input path="khataNo" cssClass="form-control"/>
                                <c:if test="${not empty errors.khataNo}">
                                    <div class="text-danger">${errors.khataNo}</div>
                                </c:if>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">New Pattadar Book No</label>
                                <form:input path="newPattadarBookNo" cssClass="form-control"/>
                                <c:if test="${not empty errors.newPattadarBookNo}">
                                    <div class="text-danger">${errors.newPattadarBookNo}</div>
                                </c:if>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Do you have a New Pattadar Book?</label><br/>
                            <div class="form-check form-check-inline">
                                <form:radiobutton path="newPattadarBook" value="true" class="form-check-input" id="newYes" />
                                <label class="form-check-label" for="newYes">Yes</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <form:radiobutton path="newPattadarBook" value="false" class="form-check-input" id="newNo" />
                                <label class="form-check-label" for="newNo">No</label>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Do you have an Old Pattadar Book?</label><br/>
                            <div class="form-check form-check-inline">
                                <form:radiobutton path="oldPattadarBook" value="true" class="form-check-input" id="oldYes" />
                                <label class="form-check-label" for="oldYes">Yes</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <form:radiobutton path="oldPattadarBook" value="false" class="form-check-input" id="oldNo" />
                                <label class="form-check-label" for="oldNo">No</label>
                            </div>
                        </div>


                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary px-4">Submit</button>
                        </div>


                    </form:form>
                </div>
            </div>
        </div>
    </div>


</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function populateForm(id) {
        // Fetch form data by ID
        fetch('/forms/' + id)
            .then(response => response.json())
            .then(data => {
                // Populate modal fields with the fetched data
                document.querySelector('[name="landOwner"]').value = data.landOwner;
                document.querySelector('[name="fatherName"]').value = data.fatherName;
                document.querySelector('[name="aadhaarNo"]').value = data.aadhaarNo;
                document.querySelector('[name="khataNo"]').value = data.khataNo;
                document.querySelector('[name="newPattadarBookNo"]').value = data.newPattadarBookNo;

                // Set the ID for the form update
                document.querySelector('[name="id"]').value = data.id;

                // Set the radio buttons based on the current values
                document.querySelector('[name="newPattadarBook"][value="' + data.newPattadarBook + '"]').checked = true;
                document.querySelector('[name="oldPattadarBook"][value="' + data.oldPattadarBook + '"]').checked = true;
            })
            .catch(error => console.error('Error:', error));
    }
</script>

</body>
</html>
