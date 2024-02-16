<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            width: 100%;
            background-color: #e0f7fa; 
        }

        .form-container {
            background-color: #f8bbd0; 
            padding: 20px;
            border-radius: 10px;
            width: 400px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .btn-primary {
            font-weight: bold;
            padding: 10px;
            background-color: #4caf50; 
        }

        .header-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .event-link {
            color: #1a237e; 
            text-decoration: none;
        }
    </style>
</head>
<body>

    <div class="container center-container">
        <div class="row justify-content-center">
            <div class="col-md-6 form-container">
                <div class="header-container">
                    <h2 style="color: #1a237e;">Event Booking</h2>
                    <h3>Theme: <%= request.getParameter("themeName") %></h3>
                    <h3>Theme Cost: &#8377 <%= request.getParameter("themeCost") %></h3>
                    <p><a class="event-link" href="Home.jsp">Back to Home</a></p>
                </div>
                <form action="processBooking" method="post">
                    <div class="form-group">
                        <label for="customerName">Customer Name:</label>
                        <input type="text" class="form-control" id="customerName" name="customerName" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="mobile">Mobile:</label>
                        <input type="text" class="form-control" id="mobile" name="mobile" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" class="form-control" id="address" name="address" required>
                    </div>
                    <div class="form-group">
                        <label for="city">City:</label>
                        <input type="text" class="form-control" id="city" name="city" required>
                    </div>
                    <div class="form-group">
                        <label for="pincode">Pincode:</label>
                        <input type="text" class="form-control" id="pincode" name="pincode" required>
                    </div>
                    <input type="hidden" name="themeName" value="${param.themeName}">
                    <input type="hidden" name="themeCost" value="${param.themeCost}">
                    
                    <button type="submit" class="btn btn-primary">Confirm Booking</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>

 