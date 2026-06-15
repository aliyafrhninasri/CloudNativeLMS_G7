<%-- 
    Document   : register
    Created on : 2 Jun 2026, 7:27:45 pm
    Author     : Group 7 CSE3443 (25/26)
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal - CloudLMS</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#"><i class="fa-solid fa-graduation-cap me-2"></i>CloudLMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                </ul>
                <div class="d-flex align-items-center">
                    <a href="login.jsp" class="btn btn-outline-light btn-sm me-2">Portal Login</a>
                    <span class="badge bg-success text-white px-2 py-1"><i class="fa-solid fa-circle text-white me-1" style="font-size: 8px;"></i> Portal Live</span>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-5 mb-5">
        
        <% 
            String status = request.getParameter("status");
            if("success".equals(status)) { 
        %>
            <div class="alert alert-success alert-dismissible fade show shadow-sm border-start border-success border-4" role="alert">
                <i class="fa-solid fa-circle-check me-2"></i>
                <strong>🎉 Registration Successful!</strong> Your student profile has been created. Please check your inbox for the next steps.
            </div>
        <% 
            } 
            if("failed".equals(status)) { 
        %>
            <div class="alert alert-danger shadow-sm border-start border-danger border-4" role="alert">
                <i class="fa-solid fa-triangle-exclamation me-2"></i>
                <strong>Registration Failed!</strong> An error occurred. Please verify your details and try again.
            </div>
        <% } %>

        <div class="row g-4 align-items-center mt-4">
            
            <div class="col-lg-6">
                <h1 class="display-4 fw-bold text-dark mb-3">CloudLMS</h1>
                <p class="lead text-muted">
                    Welcome to the central Learning Management System. Please use the form to create your student account and access your academic portal.
                </p>
            </div>

            <div class="col-lg-6">
                <div class="card shadow border-0 rounded-4">
                    <div class="card-header bg-primary text-white p-4 rounded-top-4">
                        <h4 class="mb-1 fw-bold"><i class="fa-solid fa-user-plus me-2"></i>Create Student Account</h4>
                        <p class="mb-0 text-white-50 small">Provide your personal details to establish your new academic profile.</p>
                    </div>
                    <div class="card-body p-4">
                        
                        <form action="RegisterController" method="POST">
                            <div class="mb-3">
                                <label class="form-label fw-semibold text-secondary">Full Name</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light text-muted"><i class="fa-solid fa-user"></i></span>
                                    <input type="text" name="name" class="form-control" placeholder="" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold text-secondary">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light text-muted"><i class="fa-solid fa-envelope"></i></span>
                                    <input type="email" name="email" class="form-control" placeholder="" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold text-secondary">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light text-muted"><i class="fa-solid fa-lock"></i></span>
                                    <input type="password" name="password" class="form-control" placeholder="" required>
                                </div>
                            </div>
                            <div class="form-check mb-4">
                                <input class="form-check-input" type="checkbox" id="terms" required checked>
                                <label class="form-check-label small text-muted" for="terms">
                                    I confirm that all provided registration information is true and accurate.
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary w-100 py-2 fw-bold shadow-sm">
                                <i class="fa-solid fa-arrow-right-to-bracket me-2"></i>Submit Registration
                            </button>
                        </form>

                    </div>
                    <div class="card-footer bg-light text-center p-3 rounded-bottom-4">
                        <small class="text-muted">Already have an account? <a href="login.jsp" class="text-decoration-none fw-semibold">Login Here</a></small>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <footer class="bg-dark text-white-50 py-3 mt-auto fixed-bottom border-top border-secondary">
        <div class="container text-center">
            <small>&copy; 2026 CloudLMS G7. All Rights Reserved. Student Learning Management System.</small>
        </div>
    </footer>

</body>
</html>