package com.admin.servlet;

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
@WebServlet("/updateDoctor")
public class EditDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String dob=req.getParameter("dob");
		String qualif=req.getParameter("qualificatin");
		String spec=req.getParameter("spec");
		String email=req.getParameter("email");
		String mobno=req.getParameter("mobno");
		String pass=req.getParameter("password");
		int id=Integer.parseInt(req.getParameter("id"));
		
		DoctorDao dao=new DoctorDao(DBconnect.getConnection());
		Doctor d=new Doctor(id,name,dob,qualif,spec,email,mobno,pass);
		boolean b=dao.editDoctor(d);
		HttpSession session=req.getSession();
		if(b)
		{
			session.setAttribute("succMsg","Edited successfully");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
		else {
			session.setAttribute("errorMsg","something wrong");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
	}
	

}
