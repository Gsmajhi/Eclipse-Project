package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		try {
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			HttpSession session=req.getSession();  
			if(email.equals("admin@gmail.com") && password.equals("password"))
			{
				session.setAttribute("adminObj", new User());
				res.sendRedirect("admin/index.jsp");
			}
			else {
//				res.sendRedirect("failed.jsp");
				session.setAttribute("errmsg","Invalid details");
				res.sendRedirect("admin_login.jsp");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
