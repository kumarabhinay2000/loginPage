<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="style.css">

    <script>
        function validateForm() {
            const mobile = document.forms["regForm"]["contact"].value.trim();
            const email = document.forms["regForm"]["email"].value.trim();

            // Validate mobile number (exactly 10 digits)
            const mobilePattern = /^[0-9]{10}$/;
            if (!mobilePattern.test(mobile)) {
                alert("Mobile number must be exactly 10 digits.");
                return false;
            }

            // Validate email to end with '@gmail.com'
            const emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
            if (!emailPattern.test(email)) {
                alert("Email must be a valid Gmail address (example@gmail.com).");
                return false;
            }

            return true;
        }
    </script>
</head>
<body class="bg-light">

    <div class="container d-flex align-items-center justify-content-center vh-100">
        <div class="card shadow-lg p-4 rounded-4" style="width: 450px;">
            <h2 class="text-center mb-4 text-success">Registration Form</h2>

            <form name="regForm" action="register" method="post" onsubmit="return validateForm()">
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" placeholder="Enter your name" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Father's Name</label>
                    <input type="text" name="fname" class="form-control" placeholder="Enter father's name" required>
                </div>

                <div class="mb-3">
                    <label class="form-label d-block">Gender</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" value="Male" required>
                        <label class="form-check-label">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" value="Female" required>
                        <label class="form-check-label">Female</label>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Contact No.</label>
                    <input type="text" name="contact" class="form-control" placeholder="Enter 10-digit mobile number" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email ID</label>
                    <input type="email" name="email" class="form-control" placeholder="Enter your Gmail address" required>
                </div>

                <div class="d-grid gap-2">
                    <input type="submit" value="Submit" class="btn btn-success">
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
