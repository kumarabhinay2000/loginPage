<%@ page contentType="text/html" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="style.css">
</head>
<body class="bg-light">

    <div class="container d-flex align-items-center justify-content-center vh-100">
        <div class="card shadow-lg p-5 rounded-4 text-center" style="max-width: 500px;">
            <h1 class="text-primary mb-4">Welcome!</h1>

            <h3 class="mb-3">Hello, <strong><%= session.getAttribute("name") %></strong></h3>
            <p class="fs-5">You have successfully logged in.</p>

            <div class="d-grid gap-2 mt-4">
                <a href="index.html" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
