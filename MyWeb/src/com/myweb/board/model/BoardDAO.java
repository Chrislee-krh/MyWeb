package com.myweb.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.Criteria;
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
	
	// 게시물 목록 조회 메서드
//	public List<BoardVO> getList(){
//		List<BoardVO> list = new ArrayList<>();
//		String sql = "select * from board order by num desc";
//		
//		try {
//			conn = ds.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			// BoardVO에 레코드 정보를 저장하고, 이를 list에 넣는다
//			// rs에 query결과가 있다.
//			
//			while(rs.next()) {
//				BoardVO vo = new BoardVO();
//				vo.setNum(rs.getInt("num"));
//				vo.setWriter(rs.getString("writer"));
//				vo.setTitle(rs.getNString("title"));
//				vo.setContent(rs.getNString("content"));
//				vo.setRegdate(rs.getTimestamp("regdate"));
//				vo.setHit(rs.getInt("hit"));
//				
//				list.add(vo);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JdbcUtil.close(conn, pstmt, rs);
//		}
//		
//		return list;
//	}
	
	// 페이징 처리 - 게시물 목록 조회 메서드
	public List<BoardVO> getList(Criteria cri){
		List<BoardVO> list = new ArrayList<>();
		String sql = "select * from board order by num desc limit ?, ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getPageStart()); // 시작 번호
			pstmt.setInt(2, cri.getCount()); // 페이지당 게시물 수
			rs = pstmt.executeQuery();
			
			// BoardVO에 레코드 정보를 저장하고, 이를 list에 넣는다
			// rs에 query결과가 있다.
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));
				vo.setTitle(rs.getNString("title"));
				vo.setContent(rs.getNString("content"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setHit(rs.getInt("hit"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	// 총 게시물 수를 반환하는 메서드
	public int getTotal() {
		int result = 0;
		String sql = "select count(*) as total from board";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("total");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	
	//content 정보 불러오는 메서드
	public BoardVO getContent(String num) {
		BoardVO vo = null;
		String sql = "select * from board where num = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int num1 = rs.getInt("num");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				String filename = rs.getString("filename");
				String filerealname = rs.getString("filerealname");
				vo = new BoardVO(num1, writer, title, content, regdate, hit, filename, filerealname);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}

		return vo;
	}
	
	public BoardVO getFile(String num) {
		BoardVO vo = null;
		String sql = "select * from file where filenum = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int num1 = rs.getInt("num");
				String filename = rs.getString("filename");
				String filerealname = rs.getString("filerealname");
				vo = new BoardVO(num1,filename, filerealname);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}

		return vo;
	}
	
	public void update(String num, String title, String content) {
		
		String sql = "update board set title =?, content=? where num= ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
    public void updateFile(String num,  String filename, String filerealname ) {

        String sql= "update file set filename=?, filerealname=? where filenum =?";
        
        try {
           conn =ds.getConnection();
           pstmt=conn.prepareStatement(sql);
           pstmt.setString(1, filename);
           pstmt.setString(2, filerealname);
           pstmt.setString(3, num);
           pstmt.executeUpdate();
        } catch (Exception e) {
           e.printStackTrace();
        }finally {
           JdbcUtil.close(conn, pstmt, rs);
        }
        
     }
	
	public void delete(String num) {
		String sql = "delete from board where num = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	public void upHit(String num) {
		String sql = "update board set hit = hit+1 where num = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	// DAO 동작 메서드(CRUD)
	
	
	
	
	
}
