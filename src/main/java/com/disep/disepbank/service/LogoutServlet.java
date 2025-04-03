package com.disep.disepbank.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/f/logout")
public class LogoutServlet extends HttpServlet
{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.getSession().setAttribute("currentUser", null);
        req.getSession().setAttribute("username", null);
        req.setAttribute("message", "Thank you for banking with us. See you soon");
        req.getRequestDispatcher("/login.jsp").forward(req, resp);

    }

}
