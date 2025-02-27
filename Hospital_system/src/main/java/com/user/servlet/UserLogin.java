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

@WebServlet("/userlogin")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String pass=req.getParameter("password");
		HttpSession session=req.getSession();
		UserDao dao=new UserDao(DBconnect.getConnection());
		User user=dao.login(email,pass);
		if(user!=null)
		{
			session.setAttribute("userObj",user);
			resp.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("errorMsg","Invalid details");
			resp.sendRedirect("user.jsp");
		}
	}
		
}
