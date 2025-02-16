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
@WebServlet("/addDoctor")
public class AddDocotor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("name");
			String dob=req.getParameter("dob");
			String qualif=req.getParameter("qualificatin");
			String spec=req.getParameter("spec");
			String email=req.getParameter("email");
			String mobno=req.getParameter("mobno");
			String pass=req.getParameter("password");
			DoctorDao dao=new DoctorDao(DBconnect.getConnection());
			Doctor d=new Doctor(name,dob,qualif,spec,email,mobno,pass);
			HttpSession session=req.getSession();
			boolean b=dao.addDoctor(d);
			if(b)
			{
				session.setAttribute("succMsg","Added Successfully");
				resp.sendRedirect("admin/doctor.jsp");
			}
			else {
				session.setAttribute("errorMsg","Something is wrong on server");
				resp.sendRedirect("admin/doctor.jsp");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}
