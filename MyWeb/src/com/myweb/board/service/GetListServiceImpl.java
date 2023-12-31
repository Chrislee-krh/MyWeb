package com.myweb.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;
import com.myweb.util.Criteria;
import com.myweb.util.PageVO;

public class GetListServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		// DAO객체 생성
//		BoardDAO dao = BoardDAO.getInstance();
//		List<BoardVO> list = dao.getList(); //목록 조회 결과를 list형태로
//		
//		// DB로 부터 받은 데이터를 저장(request에 강제 저장)
//		request.setAttribute("list", list);
		
		// 페이징 처리
		// DAO객체 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		//Criteria 객체
		Criteria cri = new Criteria();
		
		//페이지 값을 받아 처리하는 동작
//		System.out.println("페이지번호: "+request.getParameter("pageNum"));
		if(request.getParameter("pageNum")!= null) {
			String pageNum = request.getParameter("pageNum");
			cri.setPageNum(Integer.parseInt(pageNum));
		}
		
		List<BoardVO> list = dao.getList(cri);
		
		request.setAttribute("list", list);		
		
		// 화면에 보여질 페이지 버튼 계산 처리
		// 1. 총 게시글 수
		int total = dao.getTotal();
		PageVO vo = new PageVO(total, cri);
		
		request.setAttribute("pageVO", vo);
	}

}
