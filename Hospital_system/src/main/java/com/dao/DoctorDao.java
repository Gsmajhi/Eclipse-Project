package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;


public class DoctorDao {
	private Connection conn;

	public DoctorDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addDoctor(Doctor d)
	{
		boolean f=false;
		
		try {
			String sql="INSERT INTO doctor (name, dob, qualif, specialist, email, mobno, passw) VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,d.getName());
			ps.setString(2, d.getDob());
			ps.setString(3,d.getQualif());
			ps.setString(4,d.getSpecialist());
			ps.setString(5,d.getEmail());
			ps.setString(6, d.getMobno());
			ps.setString(7, d.getPassw());
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	public List<Doctor> getAllDoctor()
	{
		List<Doctor> list=new ArrayList<Doctor>();
		Doctor d;
		try {
			String sql="select * from doctor";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				d=new Doctor();
				d.setId(rs.getInt(1));
				d.setName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualif(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassw(rs.getString(8));
				list.add(d);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public Doctor getDoctorById(int id)
	{
		Doctor d = null;
		
		try {
			String sql="select * from doctor where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				d=new Doctor();
				d.setId(rs.getInt(1));
				d.setName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualif(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassw(rs.getString(8));
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return d;
	}
	public boolean editDoctor(Doctor d)
	{
		boolean f=false;
		try {
			
			String sql="update doctor set name=?, dob=?, qualif=?, specialist=?, email=?, mobno=?, passw=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,d.getName());
			ps.setString(2, d.getDob());
			ps.setString(3,d.getQualif());
			ps.setString(4,d.getSpecialist());
			ps.setString(5,d.getEmail());
			ps.setString(6, d.getMobno());
			ps.setString(7, d.getPassw());
			ps.setInt(8, d.getId());
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}
	public boolean deleteDoctor(int id)
	{
		boolean f=false;
		try {
			String sql="delete from doctor where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public Doctor login(String email,String psw)
	{
		Doctor d=null;
		try {
			String sql="select * from doctor where email=? and passw=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,psw);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				d=new Doctor();
				d.setId(rs.getInt(1));
				d.setName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualif(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassw(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	public int countDoctor()
	{
		int i=0;
		try {
			String sql="select * from doctor";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 	i;
	}
	public int countAppointment()
	{
		int i=0;
		try {
			String sql="select * from Appointments";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	public int countUser()
	{
		int i=0;
		try {
			String sql="select * from user_dtls";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				i++;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
	}
	public int countSpecialist()
	{
		int i=0;
		try {
			String sql="select * from specialist";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				i++;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
	}
	public int countAppointmentbyDoctorid(int did)
	{
		int i=0;
		try {
			String sql="select * from Appointments where doctorId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, did);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				i++;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
}

}
