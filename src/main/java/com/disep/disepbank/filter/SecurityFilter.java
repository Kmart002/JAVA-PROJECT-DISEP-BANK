package com.disep.disepbank.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

// @WebFilter()
public class SecurityFilter implements Filter
{
    public void init(FilterConfig filterConfig)
    {
    
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        /*HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        HttpSession session = httpRequest.getSession();
        
        if(session==null)
        {
            request.setAttribute("message", "Please login to continue");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            //response.sendRedirect("login.jsp");
        }
        else
        {
            Object username = session.getAttribute("username");
            if(username==null || username.toString().equals(""))
            {
                httpRequest.setAttribute("message", "Please login to continue");
                
                // httpResponse.sendRedirect("/login.jsp");
                request.getRequestDispatcher("/login.jsp").forward(httpRequest, httpResponse);
                
                
            }
        }
        
        System.out.println("Filter applied in Spring!");
        chain.doFilter(httpRequest, httpResponse);*/
        chain.doFilter(request, response);
        
    }
    
    @Override
    public void destroy()
    {
        Filter.super.destroy();
    }
}
