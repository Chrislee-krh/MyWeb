package com.myweb.user.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.JdbcUtil;

public class UserDAO {
	
	/*
	 * DAO는 singleton 방식으로 작성(여러 개 생성되지 않게 하기 위해서-메모리과부하)
	 */
	private static UserDAO instance = new UserDAO();
	
	private Context ct;
	private DataSource ds;
	
	
	private UserDAO() {
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//		} catch (Exception e) {
//			System.out.println("드라이버 로드 에러");
//		}
		try {
			ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	// 중복 변수 및 객체를 작성(멤버 변수로)
	private String url = "jdbc:mysql://localhost:3306/test?serverTimezone=Asia/Seoul";
	private String user = "mytest";
	private String pw = "mytest";
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//ID 검증 method
	public int idConfirm(String id) {
		int result = 0;
		String sql = "select * from users where id = ?";
		try {
//			conn= DriverManager.getConnection(url, user, pw);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			
			if(rs.next()) result = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return result;
	}
	
	//회원 가입 메서드
	public int join(UserVO vo) {
		int result = 0;
			String sql = "insert into users (id,pw,name,email,address) "
						+"values(?,?,?,?,?)";
			try {
//				conn = DriverManager.getConnection(url,user,pw);
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getId());
				pstmt.setString(2, vo.getPw());
				pstmt.setString(3, vo.getName());
				pstmt.setString(4, vo.getEmail());
				pstmt.setString(5, vo.getAddress());
				
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}
			
		
		return result;
	}
	
	//로그인 메서드
	public int login(String id, String pw) {
		String sql = "select * from users where id = ? and pw = ?";
		int result = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}else {
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return result;
	}
	
	//로그인 성공 시 회원 정보를 얻어오는 작업
	public UserVO getUserInfo(String id) {
		UserVO vo = null;
		String sql = "select * from users where id = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String id1 = rs.getString("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String address = rs.getString("address");
				Timestamp regdate = rs.getTimestamp("regdate");
				
				vo = new UserVO(id1, null, name, email, address, regdate);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	public int changePassword(String id, String pw) {
		int result = 0;
		String sql = "update users set pw = ? where id = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		
		return result;
	}
	
	public int update(UserVO vo) {
		int result = 0;
		String sql = "update users set name = ?, email = ?, address =? where id = ?";

		try {
			conn = ds.getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(4, vo.getId());
			System.out.println("메서드: "+ vo.getId());
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getAddress());
			System.out.println("메서드: "+ vo.getName());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int delete(String id) {
		int result = 0;
		String sql = "delete from users where id = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
	
}
