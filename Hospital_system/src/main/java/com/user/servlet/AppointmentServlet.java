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
import com.entity.Appointment;

 
@WebServlet("/bookAppointment")
public class AppointmentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userid=Integer.parseInt(req.getParameter("userId"));
		String name=req.getParameter("name");
		String gender=req.getParameter("gender");
		String age=req.getParameter("age");
		String appodate=req.getParameter("appodate");
		String email=req.getParameter("email");
		String mobno=req.getParameter("mobno");
		String disease=req.getParameter("disease");
		int doctorId=Integer.parseInt(req.getParameter("docname"));
		String addr=req.getParameter("address");
		
		Appointment app=new Appointment(userid,name,gender,age,appodate,email,mobno,disease,doctorId,addr,"Pending");
		AppointmentDao dao=new AppointmentDao(DBconnect.getConnection());
		boolean b=dao.bookAppointment(app);
		HttpSession session=req.getSession();
		if(b) {
			session.setAttribute("succMsg", "Appointment Booked");
			resp.sendRedirect("appointment.jsp");
		}
		else {
			session.setAttribute("errMsg","something wrong on server");
			resp.sendRedirect("appointment.jsp");
		}
	}
	
	
}
