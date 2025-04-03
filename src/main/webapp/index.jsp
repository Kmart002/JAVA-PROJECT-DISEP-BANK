<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <style>
        .bgImage {
            background-image: url("https://i.pinimg.com/736x/16/2a/3a/162a3af8ce7c77ad58f3db146807d866.jpg");
            background-size: auto 100%;
            background-position: center left;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body class="flex flex-col h-screen">
<%@ include file="header.html"%>
<div class="flex flex-1 bgImage items-center justify-end sm:pr-10">
<div class="flex flex-col lg:flex-row space-y-3 lg:space-y-0 lg:space-x-3 py-1">
    <button class="p-2 lg:p-3 w-20 lg:w-52 border border-blue-600 rounded-xl shadow-2xl bg-blue-600 text-base lg:text-2xl font-bold text-white cursor-pointer hover:text-blue-600 hover:bg-white hover:scale-110 transition-all duration-200" onclick="location.href='/signup.jsp'">Sign Up</button>
    <button class="p-2 lg:p-3 w-20 lg:w-52 border border-blue-600 rounded-xl shadow-2xl bg-blue-600 text-lg lg:text-2xl font-bold text-white cursor-pointer hover:text-blue-600 hover:bg-white hover:scale-110 transition-all duration-200" onclick="location.href='/login.jsp'">Login</button>
</div>
</div>
<%--<a href="hello-servlet">Hello Servlet</a>--%>
<%@ include file="/footer.html"%>
</body>
</html>
