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

@WebServlet("/editAppointment")
public class EditAppointment extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId=Integer.parseInt(req.getParameter("uId"));
		int appId=Integer.parseInt(req.getParameter("appId"));
		String name=req.getParameter("name");
		String gender=req.getParameter("gender");
		String age=req.getParameter("age");
		String appodate=req.getParameter("appodate");
		String email=req.getParameter("email");
		String mobno=req.getParameter("mobno");
		String disease=req.getParameter("disease");
		int doctorId=Integer.parseInt(req.getParameter("doctorname"));
		String address=req.getParameter("address");
		
		
		AppointmentDao dao=new AppointmentDao(DBconnect.getConnection());
		Appointment ap=new Appointment(appId,userId,name,gender,age,appodate,email,mobno,disease,doctorId,address,"Pending");
		boolean b=dao.editAppointment(ap);
		
		HttpSession session=req.getSession();
		if(b)
		{
			session.setAttribute("succMsg","Updated Successfully");
			resp.sendRedirect("viewAppointment.jsp");
		}
		else {
			session.setAttribute("errMsg","Something wrong on server");;
			resp.sendRedirect("Appointment/editAppointment.jsp?id="+ap.getId());
		}
	}
	

}
