package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBconnect;
import com.dao.UserDao;
import com.entity.User;
@WebServlet("/user_register")
public class UserRegister extends HttpServlet{
		protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
			try {
				String name=req.getParameter("name");
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				User u=new User(name,email,password);
				UserDao dao=new UserDao(DBconnect.getConnection());
				boolean f=dao.userReg(u);
				HttpSession session=req.getSession();
				if(f)
				{
					session.setAttribute("sucmsg","Registered successfully");
					res.sendRedirect("signup.jsp");
					//System.out.println("Data insert successfully");
				}
				else {
					session.setAttribute("fmsg","Failed to register");
					res.sendRedirect("signup.jsp");
					//System.out.println("something wrong on server");
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
}
