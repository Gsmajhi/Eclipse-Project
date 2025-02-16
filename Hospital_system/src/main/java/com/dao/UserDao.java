package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean userReg(User u)
	{
		boolean f=false;
		try {
			String sql="insert into user_dtls(name,email,password) values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,u.getName());
			ps.setString(2,u.getEmail());
			ps.setString(3,u.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	public User login(String em,String psw)
	{
		User u=null;
		try {
			String sql="select * from user_dtls where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,em);
			ps.setNString(2, psw);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getNString(4));
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return u;
	}
	public boolean changePassword(String pass,int userId)
	{
		boolean b=false;
		try {
			String sql="update user_dtls set password=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, pass);
			ps.setInt(2, userId);
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				b=true;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return b;
	}
	public String getPassword(int userId)
	{
		String s=null;
		try {
			String sql="select password from user_dtls where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				s=rs.getString("password");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return s;
	}
}
