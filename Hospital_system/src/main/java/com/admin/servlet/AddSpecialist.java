package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBconnect;
import com.dao.SpecialistDao;
@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specname=req.getParameter("specname");
		SpecialistDao dao=new SpecialistDao(DBconnect.getConnection());
		boolean f =dao.addSpecialist(specname);
		HttpSession session=req.getSession();
		if(f)
		{
			session.setAttribute("succMsg", "Specialist added");
			resp.sendRedirect("admin/index.jsp");
		}
		else {
			session.setAttribute("errorMsg","something wrong");
					resp.sendRedirect("admin/index.jsp");
		}
	}
	

}
