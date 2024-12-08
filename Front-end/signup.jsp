<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background: black;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: black; /* Default text color set to black */
        }
        .signup-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
        }
        .signup-container h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
            color: #ffcc00; /* Yellow color for heading */
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: black; /* Black label text */
        }
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            color: black; /* Black input text */
        }
        .btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background-color: #ffcc00; /* Yellow button */
            color: black; /* Black button text */
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #e6b800; /* Darker yellow on hover */
        }
        .link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }
        .link a {
            color: #ffcc00; /* Yellow link color */
            text-decoration: none;
        }
        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h1>Signup</h1>
        <form method="post" action="addCustomer">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn">Signup</button>
        </form>
        <div class="link">
            <p>Already have an account? <a href="login.jsp">Login</a></p>
        </div>
    </div>
</body>
</html>
