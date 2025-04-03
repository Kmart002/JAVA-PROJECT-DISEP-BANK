package com.disep.disepbank.contoller;

import com.disep.disepbank.model.User;
import com.disep.disepbank.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;

@Controller
@RequestMapping("/f")
public class AdminController
{
    @Autowired
    private AdminService adminService;
    
    @PostMapping("/fundaccount")
    public String fundAccount(@RequestParam("amount") double amount, @RequestParam("accountNo") String accountNo,
                              HttpServletRequest req, HttpServletResponse resp)
    {
        boolean b = adminService.fundAccount(amount, accountNo);
        
        if (b)
        {
            req.setAttribute("message", "Account Funded Successfully");
            try
            {
                req.getRequestDispatcher("/f/admindashboard.jsp").forward(req,resp);
            }
            catch (ServletException e)
            {

            }
            catch (IOException e)
            {
                throw new RuntimeException(e);
            }
            return "redirect:/f/admindashboard.jsp";
        }
        else
        {
            req.setAttribute("errorMessage", "Account Funding not successful");
            return "fundaccount";
        }
    }
    
    @PostMapping("/updateuser")
    public String updateUser(@RequestParam String email, HttpServletRequest req, HttpServletResponse resp)
    {
        User user = adminService.updateUserDetails((User) req.getAttribute("user"), email);
        return "userdashboard";
    }
    
}
