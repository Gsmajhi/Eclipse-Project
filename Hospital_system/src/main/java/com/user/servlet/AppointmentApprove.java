package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBconnect;
import com.dao.AppointmentDao;

@WebServlet("/approveAppointment")
public class AppointmentApprove extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		AppointmentDao dao=new AppointmentDao(DBconnect.getConnection());
		
		boolean b=dao.approved(id);
		HttpSession session=req.getSession();
		if(b)
		{
			resp.sendRedirect("doctor/patients.jsp");
		}
		else {
			session.setAttribute("succMsg","something went wrong");
			resp.sendRedirect("doctor/patients.jsp");
		}
	}
	

}
