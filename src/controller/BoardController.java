package controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import DAO.NoticeDAO;
import DAO.PhotoDAO;
import DTO.NoticeDTO;
import DTO.PhotoDTO;
import common.BoardPager;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	
	PrintWriter out;
	
	@RequestMapping("noticelist.do")
	public String noticelist(
			@RequestParam(value = "pg", required = false, defaultValue = "1") int page,
			@RequestParam(value = "f", required = false, defaultValue = "title") String field,
			@RequestParam(value = "q", required = false, defaultValue = "%%") String query,
			@RequestParam(value = "ps", required = false, defaultValue = "15") int pageSize,
			Model model) throws Exception{
		
		System.out.println("공지사항 리스트");
		
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		
		// 페이징
		int pagerSize = 15;// 한 번에 보여줄 페이지 번호 갯수
		String linkUrl = "noticelist.do";// 페이지 번호를 누르면 이동할 경로
		int noticeCount = noticeDAO.getnoticeCount(field, query);// 검색 결과에 따른 게시글 총
		
		int start = (page - 1) * pageSize;
		
		BoardPager pager = null;
		if (!query.equals("%%")) {// 검색값이 있을 경우
			pager = new BoardPager(noticeCount, page, pageSize, pagerSize, linkUrl, field, query);
		} else {// 검색 값이 없을 경우
			pager = new BoardPager(noticeCount, page, pageSize, pagerSize, linkUrl);
		}
		
		List<NoticeDTO> noticelist = noticeDAO.noticelist(start, field, query, pageSize);
		
		model.addAttribute("pager", pager);
		model.addAttribute("noticeCount", noticeCount);
		model.addAttribute("noticelist", noticelist);
		
		return "home.notice.noticelist";
	}
	
	@RequestMapping("noticedetail.do")
	public String noticedetail(int boardno, Model model)throws Exception{
		
		System.out.println("상세보기 페이지");
		
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		
		NoticeDTO noticeDTO = noticeDAO.noticedetail(boardno);
		noticeDAO.noticeCount(boardno);
		
		model.addAttribute("noticeDTO", noticeDTO);
		
		return "home.notice.noticedetail";
	}
	
	@RequestMapping(value="noticewritefram.do", method=RequestMethod.GET)
	public String noticewritefram()throws Exception{
		
		System.out.println("공지사항 글쓰기 폼");
		
		return "home.notice.noticewrite";
	}
	
	@RequestMapping(value = "noticewrite.do", method=RequestMethod.POST)
	public void noticedwrite (NoticeDTO noticeDTO, HttpServletResponse response) throws Exception{
		
		System.out.println("글 쓰기 성공");
		
		//경고문 띄우기 전 한글 처리
		response.setContentType("text/html;charset=UTF-8");
		out = response.getWriter();
				
		//들 등록 진행
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		int result = noticeDAO.noticeInsert(noticeDTO);
		
		if (result != 0) {
			System.out.println("자유게시판 글쓰기 완료");
			out.print(
					"<script type='text/javascript'>alert('글이 성공적으로 등록되었습니다.'); location.replace('noticelist.do?pg=1');</script>");
		} else {
			System.out.println("자유게시판 글쓰기 등록 실패");
			out.print(
					"<script type='text/javascript'>alert('글을 등록하는데 실패하였습니다.'); location.replace('noticelist.do?pg=1');</script>");
		}
		out.close();
	}
	
	@RequestMapping("photolist.do")
	public String photolist(
			@RequestParam(value = "pg", required = false, defaultValue = "1") int page,
			@RequestParam(value = "ps", required = false, defaultValue = "8") int pageSize,
			@RequestParam(value = "f", required = false, defaultValue = "boardno") String field, // 검색 카테고리
			@RequestParam(value = "q", required = false, defaultValue = "%%") String query,
			Model model)throws Exception{
		
		System.out.println("사진리스트");
		
		PhotoDAO photoDAO = sqlSession.getMapper(PhotoDAO.class);
		
		int pagerSize = 12;// 한 번에 보여줄 페이지 번호 갯수
		String linkUrl = "photolist.do";// 페이지번호를 누르면 이동할 경로
		int getphotoCount = photoDAO.getphotoCount();

		int start = (page - 1) * pageSize;
		
		BoardPager pager = null;
		
		pager = new BoardPager(getphotoCount, page, pageSize, pagerSize, linkUrl);
		
		List<PhotoDTO> list = photoDAO.photoList(start, field, query, pageSize);
		
		model.addAttribute("pager", pager);
		model.addAttribute("getphotoCount", getphotoCount);
		model.addAttribute("list", list);
		
		return "home.photo.photolist";
	}
	
	@RequestMapping("photodetail.do")
	public String photodetail(@RequestParam("bno") int boardno, //게시글번호
			HttpSession session, Model model) throws Exception {
		
		//로그
		System.out.println("게시판 상세");
		
		//게시판 정보 db에서 가져오기
		System.out.println("게시판 정보 가져오기");
		PhotoDAO photoDAO = sqlSession.getMapper(PhotoDAO.class);
		//조회수
		photoDAO.PhotoCount(boardno);
		//상세페이지 보이기
		PhotoDTO photoDTO = photoDAO.photodtaile(boardno);
		
		//클릭한 사람이 게시자가 아니면 조회수 증가
		//추후
		
		model.addAttribute("photoDTO", photoDTO);
		
		
		return "home.photo.photodetail";
	}
	
	
}
