<%-- 
    Document   : login
    Created on : 15 Jun 2026, 10:06:36 am
    Author     : Group 7 CSE3443 (25/26)
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Login - CloudLMS</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="register.jsp"><i class="fa-solid fa-graduation-cap me-2"></i>CloudLMS</a>
            <div class="d-flex align-items-center">
                <a href="register.jsp" class="btn btn-outline-light btn-sm">Create Account</a>
            </div>
        </div>
    </nav>

    <div class="container mt-5 pt-3">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card shadow border-0 rounded-4">
                    <div class="card-header bg-dark text-white p-4 rounded-top-4 text-center">
                        <h4 class="mb-1 fw-bold"><i class="fa-solid fa-lock me-2"></i>Student Portal Login</h4>
                        <p class="mb-0 text-white-50 small">Sign in to access your learning dashboard</p>
                    </div>
                    <div class="card-body p-4">
                        
                        <form action="dashboard.jsp" method="GET">
                            <div class="mb-3">
                                <label class="form-label fw-semibold text-secondary">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light text-muted"><i class="fa-solid fa-envelope"></i></span>
                                    <input type="email" class="form-control" placeholder="" required>
                                </div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label fw-semibold text-secondary">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light text-muted"><i class="fa-solid fa-lock"></i></span>
                                    <input type="password" class="form-control" placeholder="" required>
                                </div>
                                <div class="text-end mt-2">
                                    <a href="#" class="text-decoration-none small text-muted">Forgot Password?</a>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-dark w-100 py-2 fw-bold shadow-sm">
                                <i class="fa-solid fa-arrow-right-to-bracket me-2"></i>Log In
                            </button>
                        </form>

                    </div>
                    <div class="card-footer bg-light text-center p-3 rounded-bottom-4">
                        <small class="text-muted">New student? <a href="register.jsp" class="text-decoration-none fw-semibold">Register Here</a></small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white-50 py-3 mt-5 fixed-bottom border-top border-secondary">
        <div class="container text-center">
            <small>&copy; 2026 CloudLMS G7. All Rights Reserved.</small>
        </div>
    </footer>

</body>
</html>