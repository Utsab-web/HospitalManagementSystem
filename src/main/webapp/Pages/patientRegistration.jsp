<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/17/2026
  Time: 11:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Patient Registration</title>

    <link rel="stylesheet" href="../css/Style.css">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial, Helvetica, sans-serif;
        }

        body{
            background:#EAFBF5;
            padding:40px;
        }

        .container{
            max-width:1100px;
            margin:auto;
        }

        h1{
            color:#0B5E4B;
            margin-bottom:25px;
        }

        .card{
            background:white;
            border-radius:15px;
            box-shadow:0 8px 20px rgba(0,0,0,.12);
            padding:30px;
        }

        .grid{
            display:grid;
            grid-template-columns:1fr 1fr;
            gap:25px;
        }

        h3{
            color:#0B5E4B;
            margin-bottom:15px;
        }

        .form-group{
            margin-bottom:15px;
        }

        label{
            display:block;
            margin-bottom:6px;
            font-weight:bold;
        }

        input,
        select,
        textarea{
            width:100%;
            padding:12px;
            border:1px solid #ccc;
            border-radius:8px;
            font-size:15px;
        }

        textarea{
            resize:none;
        }

        .btn{
            margin-top:30px;
            text-align:center;
        }

        button{
            background:#12B76A;
            color:white;
            border:none;
            padding:14px 45px;
            border-radius:8px;
            font-size:18px;
            cursor:pointer;
        }

        button:hover{
            background:#0F9B5C;
        }

        @media(max-width:800px){

            .grid{
                grid-template-columns:1fr;
            }

        }

    </style>

</head>

<body>

<div class="container">

    <h1>New Patient Registration</h1>

    <div class="card">

        <form onsubmit="return registerPatient(event)">

            <div class="grid">

                <div>

                    <h3>Personal Information</h3>

                    <div class="form-group">
                        <label>First Name</label>
                        <input type="text">
                    </div>

                    <div class="form-group">
                        <label>Last Name</label>
                        <input type="text">
                    </div>

                    <div class="form-group">
                        <label>Date of Birth</label>
                        <input type="date">
                    </div>

                    <div class="form-group">
                        <label>Gender</label>

                        <select>
                            <option>Select Gender</option>
                            <option>Male</option>
                            <option>Female</option>
                            <option>Other</option>
                        </select>

                    </div>

                    <div class="form-group">
                        <label>Blood Group</label>

                        <select>
                            <option>Select Blood Group</option>
                            <option>A+</option>
                            <option>A-</option>
                            <option>B+</option>
                            <option>B-</option>
                            <option>AB+</option>
                            <option>AB-</option>
                            <option>O+</option>
                            <option>O-</option>
                        </select>

                    </div>

                </div>

                <div>

                    <h3>Contact & Account</h3>

                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="text">
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <input type="email">
                    </div>

                    <div class="form-group">
                        <label>Address</label>
                        <textarea rows="3"></textarea>
                    </div>

                    <div class="form-group">
                        <label>Emergency Contact Number</label>
                        <input type="text">
                    </div>

                    <div class="form-group">
                        <label>Username</label>
                        <input type="text">
                    </div>

                    <div class="form-group">
                        <label>Password</label>
                        <input type="password">
                    </div>

                </div>

            </div>

            <div class="btn">
                <button type="submit">Register</button>
            </div>

        </form>

    </div>

</div>

<script>

    function registerPatient(event) {

        event.preventDefault();

        alert("Registration Successful!\n\nRedirecting to Patient Login...");

        setTimeout(function () {
            window.location.href = "login.jsp?role=patient";
        }, 1500);

        return false;
    }

</script>

</body>
</html>
