<%-- 
    Document   : dashboard
    Created on : 15 Jun 2026, 10:09:08 am
    Author     : Group 7 CSE3443 (25/26)
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard | CloudLMS</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f4f7fe; color: #333; }
        .sidebar { height: 100vh; background: #fff; border-right: 1px solid #eef0f7; padding: 30px; position: fixed; width: 260px; z-index: 100; }
        .main-content { margin-left: 260px; padding: 40px; }
        .nav-link { color: #8b95b7; font-weight: 500; margin-bottom: 10px; border-radius: 12px; padding: 12px; transition: 0.3s; }
        .nav-link:hover { background: #f8f9fa; color: #4361ee; }
        .nav-link.active { background: #4361ee; color: #fff; box-shadow: 0 10px 20px rgba(67, 97, 238, 0.15); }
        .welcome-card { background: linear-gradient(135deg, #4361ee, #3f37c9); color: white; border-radius: 24px; padding: 35px; border: none; box-shadow: 0 10px 25px rgba(67, 97, 238, 0.15); }
        .content-card { border: none; border-radius: 20px; background: #fff; box-shadow: 0 5px 20px rgba(0,0,0,0.02); padding: 25px; margin-bottom: 25px; }
        .course-strip { background: #f8f9fa; border-radius: 16px; padding: 15px; transition: 0.3s; border: 1px solid transparent; }
        .course-strip:hover { border-color: #4361ee; background: #fff; transform: translateY(-2px); box-shadow: 0 5px 15px rgba(0,0,0,0.05); }
        .icon-box { width: 48px; height: 48px; border-radius: 14px; display: flex; align-items: center; justify-content: center; font-size: 20px; }
        .deadline-badge { font-size: 11px; padding: 5px 10px; border-radius: 8px; font-weight: 600; }
        .schedule-item { border-left: 4px solid #4361ee; padding-left: 15px; margin-bottom: 20px; }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="d-flex align-items-center mb-5">
            <span class="bg-primary text-white p-2 rounded-3 me-2 shadow-sm"><i class="fa-solid fa-cloud-bolt"></i></span>
            <h4 class="fw-bold mb-0 text-dark">CloudLMS</h4>
        </div>
        <nav class="nav flex-column">
            <a class="nav-link active" href="#"><i class="fa-solid fa-house-chimney me-2"></i> Overview</a>
            <a class="nav-link" href="#"><i class="fa-solid fa-book-open me-2"></i> My Courses</a>
            <a class="nav-link" href="#"><i class="fa-solid fa-calendar-check me-2"></i> Schedule</a>
            <a class="nav-link" href="#"><i class="fa-solid fa-chart-simple me-2"></i> Grades</a>
            <a class="nav-link" href="#"><i class="fa-solid fa-bullhorn me-2"></i> Announcements</a>
            <a class="nav-link mt-5 text-danger" href="login.jsp"><i class="fa-solid fa-right-from-bracket me-2"></i> Logout</a>
        </nav>
    </div>

    <div class="main-content">
        
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h3 class="fw-bold text-dark mb-0">Dashboard Overview</h3>
                <small class="text-muted">Academic Session 2026/2027</small>
            </div>
            <div class="d-flex align-items-center bg-white p-2 rounded-pill shadow-sm border px-3">
                <i class="fa-solid fa-circle-user text-primary fs-4 me-2"></i>
                <span class="fw-semibold small text-secondary me-2">
                    <%= (session.getAttribute("userName") != null) ? session.getAttribute("userName") : "Guest Student" %>
                </span>
                <span class="badge bg-success rounded-pill">Student</span>
            </div>
        </div>

        <div class="card welcome-card mb-4">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <span class="badge bg-white bg-opacity-25 text-white mb-2 px-3 py-2 rounded-pill">Semester 4 Progress</span>
                    <h1 class="fw-bold mb-2">
                        Welcome back, <%= (session.getAttribute("userName") != null) ? session.getAttribute("userName") : "Student" %>! 👋
                    </h1>
                    <p class="mb-0 opacity-75">Your portal integration is fully sync'd. You have 2 assignments due this week. Let's finish strong!</p>
                </div>
                <div class="col-lg-4 text-lg-end mt-3 mt-lg-0">
                    <div class="bg-white bg-opacity-10 p-3 rounded-4 d-inline-block text-start w-100">
                        <div class="d-flex justify-content-between small mb-1"><span>Overall Term GPA</span><span class="fw-bold">3.85</span></div>
                        <div class="progress bg-white bg-opacity-25" style="height: 6px;"><div class="progress-bar bg-white" style="width: 88%"></div></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            
            <div class="col-xl-8">
                
                <div class="content-card">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold mb-0 text-dark">Enrolled Courses</h5>
                        <a href="#" class="text-primary text-decoration-none small fw-semibold">View All</a>
                    </div>
                    
                    <div class="d-flex flex-column gap-3">
                        <div class="course-strip d-md-flex align-items-center justify-content-between text-center text-md-start">
                            <div class="d-md-flex align-items-center mb-3 mb-md-0">
                                <div class="icon-box bg-primary-subtle text-primary mx-auto me-md-3"><i class="fa-solid fa-code"></i></div>
                                <div>
                                    <h6 class="fw-bold mb-0">Advanced Web Applications</h6>
                                    <small class="text-muted">CSE3443 &bull; Core Computing Component</small>
                                </div>
                            </div>
                            <div class="w-md-25 my-2 my-md-0 mx-md-4">
                                <div class="d-flex justify-content-between small mb-1"><span>Progress</span><span class="fw-bold">75%</span></div>
                                <div class="progress" style="height: 6px;"><div class="progress-bar bg-primary" style="width: 75%"></div></div>
                            </div>
                            <button class="btn btn-sm btn-outline-primary rounded-pill px-3">Continue</button>
                        </div>

                        <div class="course-strip d-md-flex align-items-center justify-content-between text-center text-md-start">
                            <div class="d-md-flex align-items-center mb-3 mb-md-0">
                                <div class="icon-box bg-success-subtle text-success mx-auto me-md-3"><i class="fa-solid fa-database"></i></div>
                                <div>
                                    <h6 class="fw-bold mb-0">Database Management Architecture</h6>
                                    <small class="text-muted">CSE3312 &bull; Enterprise Systems</small>
                                </div>
                            </div>
                            <div class="w-md-25 my-2 my-md-0 mx-md-4">
                                <div class="d-flex justify-content-between small mb-1"><span>Progress</span><span class="fw-bold">40%</span></div>
                                <div class="progress" style="height: 6px;"><div class="progress-bar bg-success" style="width: 40%"></div></div>
                            </div>
                            <button class="btn btn-sm btn-outline-success rounded-pill px-3">Continue</button>
                        </div>
                    </div>
                </div>

                <div class="content-card">
                    <h5 class="fw-bold mb-4 text-dark">Upcoming Tasks & Deadlines</h5>
                    
                    <div class="table-responsive">
                        <table class="table table-borderless align-middle mb-0">
                            <thead>
                                <tr class="text-muted small border-bottom" style="font-size: 12px;">
                                    <th class="pb-3">ASSIGNMENT TASK</th>
                                    <th class="pb-3">COURSE UNIT</th>
                                    <th class="pb-3">DUE DATE</th>
                                    <th class="pb-3 text-end">STATUS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="border-bottom">
                                    <td class="py-3 fw-semibold text-dark">Deliverable 3: Prototype Build</td>
                                    <td class="text-muted small">Advanced Web Apps</td>
                                    <td><span class="badge bg-danger-subtle text-danger deadline-badge"><i class="fa-regular fa-clock me-1"></i>Tonight, 11:59 PM</span></td>
                                    <td class="text-end"><a href="#" class="btn btn-sm btn-light font-medium rounded-pill px-3 py-1 text-primary small" style="font-size: 12px;">Submit &rarr;</a></td>
                                </tr>
                                <tr class="border-bottom">
                                    <td class="py-3 fw-semibold text-dark">Lab Exercise 4: SQL Normalization</td>
                                    <td class="text-muted small">Database Architectures</td>
                                    <td><span class="badge bg-warning-subtle text-warning deadline-badge"><i class="fa-regular fa-clock me-1"></i>In 3 days</span></td>
                                    <td class="text-end"><a href="#" class="btn btn-sm btn-light font-medium rounded-pill px-3 py-1 text-primary small" style="font-size: 12px;">Submit &rarr;</a></td>
                                </tr>
                                <tr>
                                    <td class="py-3 fw-semibold text-dark text-opacity-50">Quiz 1: Architecture Patterns</td>
                                    <td class="text-muted small text-opacity-50">Advanced Web Apps</td>
                                    <td class="text-muted small opacity-50">Completed</td>
                                    <td class="text-end"><span class="badge bg-success-subtle text-success rounded-pill px-3 py-1 small" style="font-size: 11px;"><i class="fa-solid fa-check me-1"></i>Graded</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

            <div class="col-xl-4">
                
                <div class="content-card">
                    <h5 class="fw-bold mb-4 text-dark">Today's Schedule</h5>
                    
                    <div class="schedule-item">
                        <div class="d-flex justify-content-between align-items-baseline mb-1">
                            <h6 class="fw-bold mb-0">CSE3443 Lecture S1</h6>
                            <span class="text-primary small fw-semibold">09:00 AM</span>
                        </div>
                        <p class="text-muted small mb-0"><i class="fa-solid fa-location-dot me-1"></i>IBH 12 &bull; Dr. Mohamad Nor</p>
                    </div>

                    <div class="schedule-item" style="border-left-color: #2ec4b6;">
                        <div class="d-flex justify-content-between align-items-baseline mb-1">
                            <h6 class="fw-bold mb-0">CSE3312 Lab Session</h6>
                            <span class="text-success small fw-semibold">02:30 PM</span>
                        </div>
                        <p class="text-muted small mb-0"><i class="fa-solid fa-location-dot me-1"></i>Makmal Komputer 4</p>
                    </div>
                </div>

                <div class="content-card">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold mb-0 text-dark">Campus News</h5>
                        <i class="fa-solid fa-bell text-muted"></i>
                    </div>
                    
                    <div class="mb-3 pb-3 border-bottom">
                        <span class="badge bg-danger mb-2" style="font-size: 9px;">IMPORTANT</span>
                        <h6 class="fw-bold mb-1" style="font-size: 14px;">Maintenance Notice: System Database Server</h6>
                        <p class="text-muted small mb-0" style="font-size: 12px;">The centralized registration clusters will undergo a performance patch scaling tonight at 12:00 AM...</p>
                    </div>

                    <div>
                        <span class="badge bg-secondary mb-2" style="font-size: 9px;">GENERAL</span>
                        <h6 class="fw-bold mb-1" style="font-size: 14px;">FSKM Dean's List Ceremony Update</h6>
                        <p class="text-muted small mb-0" style="font-size: 12px;">Invitations for the formal student achievement presentation have been distributed to qualified profiles.</p>
                    </div>
                </div>

            </div>

        </div>
    </div>
</body>
</html>