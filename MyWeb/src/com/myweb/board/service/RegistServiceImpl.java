package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class RegistServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// form에서 전달된 값을 처리
		String num = request.getParameter("filenum");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String filename  = request.getParameter("filename");
		String filerealname = request.getParameter("filerealname");
		
//		System.out.println(writer + title + content);
		
		// DAO객체를 생성
		// DAO객체에 등록 메서드 regist메서드를 호출
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.regist(writer, title, content);
		dao.updateFile(num, filename, null);
	}

	
}
