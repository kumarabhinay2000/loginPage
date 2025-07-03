<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="style.css">
</head>
<body class="bg-light">

    <div class="container d-flex align-items-center justify-content-center vh-100">
        <div class="card text-center shadow-lg p-5 rounded-4" style="max-width: 500px;">
            
            <div class="mb-4">
                <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="#dc3545" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
                  <path d="M8.982 1.566a1.13 1.13 0 0 0-1.964 0L.165 13.233c-.457.778.091 1.767.982 1.767h13.707c.89 0 1.438-.99.982-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                </svg>
            </div>

            <h2 class="mb-3 text-danger">Oops! Something went wrong.</h2>
            <p class="fs-5">This is the error page. Please try again later or go back to the home page.</p>

            <div class="d-grid gap-2 mt-4">
                <a href="login.jsp" class="btn btn-primary">Go to Home</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
