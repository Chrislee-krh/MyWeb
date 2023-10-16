package com.myweb.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.JdbcUtil;

public class BoardDAO {

	// 디자인 패턴: Singleton 패턴
	private DataSource ds;
	// 1. 스스로 객체를 멤버변수 선언
	private static BoardDAO instance = new BoardDAO();
	
	// 2. 외부에서 객체 생성할 수 없게 private 설정
	private BoardDAO() {
		//커넥션 풀에서 DB연결 객체 정보 불러온다
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		
		} catch (Exception e) {
			System.out.println("커넥션 풀링 에러");
		}
	}
	// 3. getter
	public static BoardDAO getInstance() {
		return instance;
	}	
	
	// 중복 코드 멤버 변수로 선언
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public void regist(String writer, String title, String content) {
		
		String sql = "insert into board(writer, title, content)"
				+ "values(?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
	}
	
	// DAO 동작 메서드(CRUD)
	
	
	
	
	
}
