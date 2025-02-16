package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDao {
	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean bookAppointment(Appointment app)
	{
		boolean b=false;
		try {
			String sql="insert into Appointments (userId,name,gender,age,appodate,email,mobno,disease,doctorId,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, app.getUserId());
			ps.setString(2,app.getName());
			ps.setString(3, app.getGender());
			ps.setString(4,app.getAge());
			ps.setString(5,app.getAppodate());
			ps.setString(6,app.getEmail());
			ps.setString(7,app.getMobno());
			ps.setString(8, app.getDisease());
			ps.setInt(9, app.getDoctorId());
			ps.setString(10,app.getAddress());
			ps.setString(11,app.getStatus());
			
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				b=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public List<Appointment> viewAppointment(int id)
	{
		List<Appointment> list=new ArrayList<Appointment>();
		Appointment app=null;
		try {
			String sql="select * from Appointments where userId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				app=new Appointment();
				app.setId(rs.getInt("id"));
				app.setUserId(rs.getInt("userId"));
				app.setName(rs.getString("name"));
				app.setGender(rs.getString("gender"));
				app.setAge(rs.getString("age"));
				app.setAppodate(rs.getString("appodate"));
				app.setEmail(rs.getString("email"));
				app.setMobno(rs.getString("mobno"));
				app.setDisease(rs.getString("disease"));
				app.setDoctorId(rs.getInt("doctorId"));
				app.setAddress(rs.getString("address"));
				app.setStatus(rs.getString("status"));
				list.add(app);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public boolean editAppointment(Appointment ap)
	{
		boolean b=false;
		try {
			String sql="update Appointments set name=?,gender=?,age=?,appodate=?,email=?,mobno=?,disease=?,doctorId=?,address=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,ap.getName());
			ps.setString(2, ap.getGender());
			ps.setString(3, ap.getAge());
			ps.setString(4,ap.getAppodate());
			ps.setString(5,ap.getEmail());
			ps.setString(6,ap.getMobno());
			ps.setString(7,ap.getDisease());
			ps.setInt(8,ap.getDoctorId());
			ps.setString(9,ap.getAddress());
			ps.setInt(10,ap.getId());
			
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				b=true;
			}
		}catch(Exception e)
		{
			
		}
		return b;
	}
	public List<Appointment> getAllAppointmentsbyDoctorId(int doctorId)
	{
		List<Appointment> list=new ArrayList<Appointment>();
		Appointment app=null;
		try {
			String sql="select * from Appointments where doctorId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,doctorId);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				app=new Appointment();
				app.setId(rs.getInt(1));
				app.setUserId(rs.getInt(2));
				app.setName(rs.getString(3));
				app.setGender(rs.getString(4));
				app.setAge(rs.getString(5));
				app.setAppodate(rs.getString(6));
				app.setEmail(rs.getString(7));
				app.setMobno(rs.getString(8));
				app.setDisease(rs.getString(9));
				app.setDoctorId(rs.getInt(10));
				app.setAddress(rs.getString(11));
				app.setStatus(rs.getString(12));
				list.add(app);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public Appointment getAppointmentbyId(int id)
	{
		Appointment app=null;
			try {
				String sql="select * from Appointments where id=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1,id);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					app=new Appointment();
					app.setId(rs.getInt("id"));
					app.setUserId(rs.getInt("userId"));
					app.setName(rs.getString("name"));
					app.setGender(rs.getString("gender"));
					app.setAge(rs.getString("age"));
					app.setAppodate(rs.getString("appodate"));
					app.setEmail(rs.getString("email"));
					app.setMobno(rs.getString("mobno"));
					app.setDisease(rs.getString("disease"));
					app.setDoctorId(rs.getInt("doctorId"));
					app.setAddress(rs.getString("address"));
					app.setStatus(rs.getString("status"));
					
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
				
			
	return app;
	}
	public boolean approved(int id)
	{
		boolean b=false;
		try {
			String sql="update Appointments set status=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"approved");
			ps.setInt(2, id);
			int i=ps.executeUpdate();
			if(i==1)
			{
				b=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public List<Appointment> getAllAppointment()
	{
		List<Appointment> list=new ArrayList<Appointment>();
		Appointment app=null;
				try {
					String sql="select * from Appointments order by id desc";
					PreparedStatement ps=conn.prepareStatement(sql);
					ResultSet rs=ps.executeQuery();
					while(rs.next())
					{
						app=new Appointment();
						app.setId(rs.getInt("id"));
						app.setUserId(rs.getInt("userId"));
						app.setName(rs.getString("name"));
						app.setGender(rs.getString("gender"));
						app.setAge(rs.getString("age"));
						app.setAppodate(rs.getString("appodate"));
						app.setEmail(rs.getString("email"));
						app.setMobno(rs.getString("mobno"));
						app.setDisease(rs.getString("disease"));
						app.setDoctorId(rs.getInt("doctorId"));
						app.setAddress(rs.getString("address"));
						app.setStatus(rs.getString("status"));
						list.add(app);
					}
				}catch(Exception e)
				{
					e.printStackTrace();
				}
				return list;
	}

}
