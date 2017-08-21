package com.gms.web.dao;

import java.sql.*;
import java.util.*;
import com.gms.web.constant.*;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.factory.DatabaseFactory;

public class MemberDAOImpl implements MemberDAO{
	Connection conn;
	StudentBean stu = null;

	public static MemberDAOImpl getInstance() {return new MemberDAOImpl();}
	private MemberDAOImpl(){conn =null;}
	
	@Override
	public String insert(Map<?,?> map) {
		String rs ="";
		MemberBean member=(MemberBean)map.get("member");
		@SuppressWarnings("unchecked")
		List<MajorBean> list=(List<MajorBean>)map.get("major");
		PreparedStatement pstmt=null;

		try {
			conn = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(SQL.MEMBER_INSERT);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getSsn());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getProfile());
			System.out.println("** MEMBER_INSERT :"+SQL.MEMBER_INSERT);
			pstmt.executeUpdate();
			for(int i=0;i<list.size();i++){
				pstmt = conn.prepareStatement(SQL.INSERT_MAJOR);
				pstmt.setString(1, list.get(i).getMajorId());
				pstmt.setString(2, list.get(i).getTitle());
				pstmt.setString(3, list.get(i).getSubjId());
				pstmt.setString(4, list.get(i).getId());
				rs = String.valueOf(pstmt.executeUpdate());
				System.out.println("***"+SQL.INSERT_MAJOR);
				System.out.println("*****"+rs);
			}
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(conn != null){
				try{
					conn.rollback();
				}catch(SQLException ex){
					e.printStackTrace();
				}
			}
		}
		try {
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public List<?> selectAll(Object o) {
		List<StudentBean> list = new ArrayList<>();
		int[] arr =(int[])o;
		try {
			conn = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL.STUDENT_LIST);
			pstmt.setString(1, String.valueOf(arr[0]));
			pstmt.setString(2, String.valueOf(arr[1]));
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()){
				stu = new StudentBean();
				stu.setNum(rs.getString(DB.NUM));
				stu.setId(rs.getString(DB.ID));
				stu.setSsn(rs.getString(DB.MEMBER_SSN));
				stu.setName(rs.getString(DB.MEMBER_NAME));
				stu.setPhone(rs.getString(DB.MEMBER_PHONE));
				stu.setEmail(rs.getString(DB.MEMBER_EMAIL));
				stu.setTitle(rs.getString(DB.TITLE));
				stu.setRegdate(rs.getString(DB.MEMBER_REGDATE));
				list.add(stu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String countMembers() {
		String result="";
		try {
			ResultSet rs = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.COUNT_STUDENT).executeQuery();
			if(rs.next()){
				result = rs.getString("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public MemberBean selectById(String id) {
		MemberBean member = null;
		try {
			PreparedStatement pstmt =DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_FINDBYID);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				member = new MemberBean();
				member.setId(rs.getString(DB.MEMBER_ID));
				member.setPw(rs.getString(DB.MEMBER_PW));
				member.setSsn(rs.getString(DB.MEMBER_SSN));
				member.setName(rs.getString(DB.MEMBER_NAME));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	@Override
	public List<MemberBean> selectByName(String name) {
		MemberBean member =null;
		List<MemberBean> list = new ArrayList<>();
		try {
			PreparedStatement pstmt =DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_FINDBYNAME);
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				member.setId(rs.getString(DB.MEMBER_ID));
				member.setPw(rs.getString(DB.MEMBER_PW));
				member.setSsn(rs.getString(DB.MEMBER_SSN));
				member.setName(rs.getString(DB.MEMBER_NAME));
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String update(MemberBean bean) {
		String rs = "";
		try {
			PreparedStatement pstmt =DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_UPDATE);
			pstmt.setString(1, bean.getPw());
			pstmt.setString(1, bean.getId());
			rs = String.valueOf(pstmt.executeQuery());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public String delete(String id) {
		String rs = "";
		try {
			PreparedStatement pstmt =DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_DELETE);
			pstmt.setString(1, id);
			pstmt.setString(1, id);
			rs = String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}


}
