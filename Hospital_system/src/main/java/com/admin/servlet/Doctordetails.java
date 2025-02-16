package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBconnect;
import com.dao.DoctorDao;
import com.entity.Doctor;


public class Doctordetails extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DoctorDao dao=new DoctorDao(DBconnect.getConnection());
		Doctor d=new Doctor();
	}

}
