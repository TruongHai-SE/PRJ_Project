<%-- 
    Document   : mistake
    Created on : 25-Jun-2025, 00:11:13
    Author     : xuann
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>“Oops! Something went wrong</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
        }

        .video-bg {
            position: fixed;
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        .content {
            position: relative;
            z-index: 1;
            color: white;
            text-align: center;
            margin-top: 20%;
            font-size: 2rem;
        }
        a{
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>

    <!-- Video nền -->
    <video class="video-bg" autoplay muted loop>
        <source src="videos/Oops.mp4" type="video/mp4">
        Trình duyệt không hỗ trợ video.
    </video>

    <!-- Nội dung -->
    <div class="content">
        <h1>“Oops! Something went wrong!</h1>
        <a href="index.jsp">Home</a>
    </div>

</body>
</html>
