<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="style.css">
</head>
<body class="bg-light">

    <div class="container d-flex align-items-center justify-content-center vh-100">
        <div class="card shadow-lg p-5 rounded-4 text-center" style="max-width: 500px;">
            <h2 class="mb-4 text-success">Registration Successful</h2>
            <p class="fs-5">Thank You for Registering!</p>

            <hr>

            <h4 class="mt-3 mb-3">Your Login Credentials</h4>
            <p><strong>Username (Mobile No.):</strong><br> <%= session.getAttribute("username") %></p>
            <p><strong>Generated Password:</strong><br> <%= session.getAttribute("password") %></p>

            <div class="d-grid mt-4">
                <a href="login.jsp" class="btn btn-primary">Click Here to Login</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
