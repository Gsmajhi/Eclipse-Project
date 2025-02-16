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

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		DoctorDao dao=new DoctorDao(DBconnect.getConnection());
		boolean b=dao.deleteDoctor(id);
		HttpSession session=req.getSession();
		if(b)
		{
			session.setAttribute("succMsg","Deleted Successfully");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
		else {
			session.setAttribute("errMsg","Something Wrong");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
	}
	

}
