package com.myweb.board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class ContentServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String num = request.getParameter("num");
		BoardDAO dao = BoardDAO.getInstance();
		// 3. 쿠키는 서버 전송될때 request객체에 담겨 돌아옴. 쿠키 검사
		Cookie[] arr = request.getCookies();
		
		boolean bool = true;
		for(Cookie c : arr) {
			if(c.getName().equals("hitNum"+num)) {
				bool = false;
				break;
			}
		}
		if(bool) dao.upHit(num); // true라면 읽은 적 없어서, 카운트 올림
		
		// 1. 조회수 업데이트
//		dao.upHit(num);
		BoardVO vo = dao.getContent(num);

		request.setAttribute("vo", vo);

		// 2. 중복 증가 방지를 위한 쿠키 생성
		Cookie hitCoo = new Cookie("hitNum"+num, num ); //num은 게시글 번호
		hitCoo.setMaxAge(60);
		response.addCookie(hitCoo);
		
		/*
		 * 1. DAO에 getContent(num) 메서드를 생성하고, 호출
		 * 2. getContent() 메서드에서는 num을 가지고, 게시글의 정보를 조회(select)
		 * 		그리고, vo에 그 정보를 담아 반환
		 * 3. 메서드 리턴 타입은 BoardVO
		 * 4. 화면 전송을 위해서 리턴 타입의 값을 vo라는 이름으로 강제 저장
		 */
	}
}
