<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>

    <!-- Bootstrap CSS (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="css/style.css">

    <script>
        function clearFields() {
            document.getElementById("loginForm").reset();
        }

        window.onload = function () {
            const params = new URLSearchParams(window.location.search);
            if (params.get("error") === "true") {
                alert("You entered wrong credentials");
            }
        };

        function validateLogin() {
            const username = document.getElementsByName("username")[0].value.trim();
            const password = document.getElementsByName("password")[0].value.trim();

            if (username.length < 3) {
                alert("Username must be at least 3 characters.");
                return false;
            }

            if (password.length < 5) {
                alert("Password must be at least 5 characters.");
                return false;
            }

            return true;
        }

        function preventPaste(e) {
            e.preventDefault();
            alert("Pasting is disabled for security reasons.");
        }
    </script>
</head>
<body class="bg-light">

    <div class="container d-flex align-items-center justify-content-center vh-100">
        <div class="card shadow-lg p-4 rounded-4" style="width: 400px;">
            <h2 class="text-center mb-4 text-primary">Login</h2>

            <form id="loginForm" action="login" method="POST" onsubmit="return validateLogin()" autocomplete="off">
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" placeholder="Enter username" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Enter password" onpaste="preventPaste(event)" required>
                </div>

                <div class="d-grid gap-2">
                    <input type="submit" value="Login" class="btn btn-primary">
                    <button type="button" class="btn btn-secondary" onclick="clearFields()">Cancel</button>
                </div>
            </form>

            <div class="mt-4 text-center">
                <a href="registeration.jsp" class="text-decoration-none">New User? Register here</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
