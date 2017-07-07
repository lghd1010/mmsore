package controller;

import java.io.PrintWriter;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.BoardPager;
import DAO.EnterDAO;
import DAO.MemberDAO;
import DAO.RoundDAO;
import DTO.EnterDTO;
import DTO.MemberDTO;
import DTO.Round1DTO;

@Controller
public class AdminController {

	@Autowired
	private SqlSession sqlSession;
	
	PrintWriter out;
	
	@RequestMapping("adminmemberlist.do")
	public String adminmemberlist(
			@RequestParam(value = "pg", required = false, defaultValue = "1") int page,
			@RequestParam(value = "f", required = false, defaultValue = "name") String field,
			@RequestParam(value = "q", required = false, defaultValue = "%%") String query,
			@RequestParam(value = "ps", required = false, defaultValue = "15") int pageSize,
			Model model)throws Exception{
		
		System.out.println("관리자페이지 회원리스트");
		
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		
		int pagerSize = 15;// 한 번에 보여줄 페이지 번호 갯수
		String linkUrl = "adminmemberlist.do";// 페이지 번호를 누르면 이동할 경로
		int memberCount = memberDAO.getmemberCount(field, query);// 검색 결과에 따른 게시글 총
		
		int start = (page - 1) * pageSize;
		
		BoardPager pager = null;
		if (!query.equals("%%")) {// 검색값이 있을 경우
			pager = new BoardPager(memberCount, page, pageSize, pagerSize, linkUrl, field, query);
		} else {// 검색 값이 없을 경우
			pager = new BoardPager(memberCount, page, pageSize, pagerSize, linkUrl);
		}
		
		List<MemberDTO> memberlist = memberDAO.adminmemberlist(start, field, query, pageSize);
		
		model.addAttribute("pager", pager);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("memberlist", memberlist);
		
		return "admin.adminmember.adminmemberlist";
	}
	
	@RequestMapping("admin1roundlist.do")
	public String admin1roundlist(
			@RequestParam(value = "pg", required = false, defaultValue = "1") int page,
			@RequestParam(value = "f", required = false, defaultValue = "ent_name") String field,
			@RequestParam(value = "q", required = false, defaultValue = "%%") String query,
			@RequestParam(value = "ps", required = false, defaultValue = "15") int pageSize,
			int mcn_no,
			Model model)throws Exception{
		
		System.out.println("관리자 예선전 인원확인");
		
		EnterDAO enterDAO = sqlSession.getMapper(EnterDAO.class);
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int pagerSize = 15;// 한 번에 보여줄 페이지 번호 갯수
		String linkUrl = "admin1roundlist.do";// 페이지 번호를 누르면 이동할 경로
		int enterCount = enterDAO.getenterCount(field, query, mcn_no);// 검색 결과에 따른 게시글 총
		
		int start = (page - 1) * pageSize;
		
		BoardPager pager = null;
		if (!query.equals("%%")) {// 검색값이 있을 경우
			pager = new BoardPager(enterCount, page, pageSize, pagerSize, linkUrl, field, query);
		} else {// 검색 값이 없을 경우
			pager = new BoardPager(enterCount, page, pageSize, pagerSize, linkUrl);
		}
		
		List<EnterDTO> enterDTO = enterDAO.admin1roundlist(start, field, query, pageSize, mcn_no);
		List<EnterDTO> competition = roundDAO.competition();
		
		model.addAttribute("pager", pager);
		model.addAttribute("enterCount", enterCount);
		model.addAttribute("enterDTO", enterDTO);
		model.addAttribute("competition",competition);
		model.addAttribute("competition_size",competition.size());

		return "admin.adminroundlist.admin1roundlist";
	}
	
	@RequestMapping("admin2roundlist.do")
	public String admin2roundlist(
			@RequestParam(value = "pg", required = false, defaultValue = "1") int page,
			@RequestParam(value = "f", required = false, defaultValue = "m1_name") String field,
			@RequestParam(value = "q", required = false, defaultValue = "%%") String query,
			@RequestParam(value = "ps", required = false, defaultValue = "15") int pageSize,
			int mcn_no,
			Model model)throws Exception{
		
		System.out.println("본선관리");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		

		int pagerSize = 15;// 한 번에 보여줄 페이지 번호 갯수
		String linkUrl = "admin2roundlist.do";// 페이지 번호를 누르면 이동할 경로
		int enterCount2 = roundDAO.getenterCount2(field, query, mcn_no);// 검색 결과에 따른 게시글 총
		
		int start = (page - 1) * pageSize;
		
		BoardPager pager = null;
		if (!query.equals("%%")) {// 검색값이 있을 경우
			pager = new BoardPager(enterCount2, page, pageSize, pagerSize, linkUrl, field, query);
		} else {// 검색 값이 없을 경우
			pager = new BoardPager(enterCount2, page, pageSize, pagerSize, linkUrl);
		}
		
		List<EnterDTO> enterDTO2 = roundDAO.admin2roundlist(start, field, query, pageSize, mcn_no);
		List<EnterDTO> competition = roundDAO.competition();
		
		model.addAttribute("pager", pager);
		model.addAttribute("enterCount2", enterCount2);
		model.addAttribute("enterDTO2", enterDTO2);
		model.addAttribute("competition",competition);
		
		return "admin.adminroundlist.admin2roundlist";
	}
	
	@RequestMapping("admin3roundlist.do")
	public String admin3roundlist(
			@RequestParam(value = "pg", required = false, defaultValue = "1") int page,
			@RequestParam(value = "f", required = false, defaultValue = "m2_name") String field,
			@RequestParam(value = "q", required = false, defaultValue = "%%") String query,
			@RequestParam(value = "ps", required = false, defaultValue = "15") int pageSize,
			int mcn_no,
			Model model)throws Exception{
		
		System.out.println("결승참가자 리스트");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int pagerSize = 15;// 한 번에 보여줄 페이지 번호 갯수
		String linkUrl = "admin3roundlist.do";// 페이지 번호를 누르면 이동할 경로
		int enterCount3 = roundDAO.getenterCount3(field, query, mcn_no);// 검색 결과에 따른 게시글 총
		
		int start = (page - 1) * pageSize;
		
		BoardPager pager = null;
		if (!query.equals("%%")) {// 검색값이 있을 경우
			pager = new BoardPager(enterCount3, page, pageSize, pagerSize, linkUrl, field, query);
		} else {// 검색 값이 없을 경우
			pager = new BoardPager(enterCount3, page, pageSize, pagerSize, linkUrl);
		}
		
		List<EnterDTO> enterDTO3 = roundDAO.admin3roundlist(start, field, query, pageSize, mcn_no);
		List<EnterDTO> competition = roundDAO.competition();
		
		model.addAttribute("pager", pager);
		model.addAttribute("enterCount3", enterCount3);
		model.addAttribute("enterDTO3", enterDTO3);
		model.addAttribute("competition",competition);
		
		return "admin.adminroundlist.admin3roundlist";
	}
	
	@RequestMapping("admin1roundpointlist.do")
	public String admin1roundpointlist(Model model, int mcn_no)throws Exception{
		
		System.out.println("점수창아 나와라");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		List<Round1DTO> round1DTO = roundDAO.round1pointlist(mcn_no);
		List<EnterDTO> competition = roundDAO.competition();
		
		model.addAttribute("round1DTO", round1DTO);
		model.addAttribute("competition",competition);
		return "admin.adminroundpoint.admin1roundpointlist";
	}
}
