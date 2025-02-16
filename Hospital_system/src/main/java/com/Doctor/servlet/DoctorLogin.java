package com.Doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBconnect;
import com.dao.DoctorDao;
import com.entity.Doctor;
@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String psw=req.getParameter("password");
		DoctorDao dao=new DoctorDao(DBconnect.getConnection());
		Doctor d=dao.login(email, psw);
		HttpSession session=req.getSession();
		if(d!=null)
		{
			session.setAttribute("doctorObj",d);
			resp.sendRedirect("doctor/index.jsp");
		}
		else {
			session.setAttribute("errMsg","invalid details");
			resp.sendRedirect("doctor_login.jsp");
		}
	}
	

}
