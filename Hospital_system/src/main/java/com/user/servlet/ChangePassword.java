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
@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String oldpass=req.getParameter("oldpass");
		String newpass=req.getParameter("newpass");
		int userId=Integer.parseInt(req.getParameter("uId"));
		UserDao dao=new UserDao(DBconnect.getConnection());
		String password=dao.getPassword(userId);
		HttpSession session=req.getSession();
		if(password.equals(oldpass))
		{
			boolean b=dao.changePassword(newpass, userId);
			if(b)
			{
				session.setAttribute("succMsg","Password Changed");
				resp.sendRedirect("index.jsp");
			}
			else {
				session.setAttribute("errMsg","something went wrong");
				resp.sendRedirect("changepass.jsp");
			}
		}
		else {
			session.setAttribute("errorMsg","Old password not mached");
			resp.sendRedirect("changepass.jsp");
		}
	}
	
	
}
