package controller;

import java.io.PrintWriter;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import DAO.AddDAO;
import DAO.BranchDAO;
import DAO.EnterDAO;
import DAO.MemberDAO;
import DAO.RoundDAO;
import DTO.AddDTO;
import DTO.BranchDTO;
import DTO.EnterDTO;
import DTO.MemberDTO;
import DTO.Round1DTO;
import DTO.Round2DTO;
import DTO.Round3DTO;
import common.BoardPager;

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
	public String admin1roundlist(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("관리자 예선전 인원확인");
		
		EnterDAO enterDAO = sqlSession.getMapper(EnterDAO.class);
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int enterCount = enterDAO.getenterCount(mcn_no, ent_enter);// 검색 결과에 따른 게시글 총
		
		
		List<EnterDTO> enterDTO = enterDAO.admin1roundlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("enterCount", enterCount);
		model.addAttribute("enterDTO", enterDTO);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);

		return "admin.adminroundlist.admin1roundlist";
	}
	
	@RequestMapping("admin1roundactive.do")
	public String admin1roundactive(EnterDTO enterDTO, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("예선전취소");
		
		EnterDAO enterDAO = sqlSession.getMapper(EnterDAO.class);
		int result = enterDAO.acmin1roundactive(enterDTO);
		
		if(result == 1){
			System.out.println("완료");
		}else{
			System.out.println("실패");
		}
		return "redirect:admin1roundlist.do?mcn_no="+mcn_no+"&ent_enter="+ent_enter;
	}
	
	@RequestMapping("admin2roundlist.do")
	public String admin2roundlist(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("본선관리");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int enterCount2 = roundDAO.getenterCount2(mcn_no, ent_enter);// 검색 결과에 따른 게시글 총
		
		List<EnterDTO> enterDTO2 = roundDAO.admin2roundlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("enterCount2", enterCount2);
		model.addAttribute("enterDTO2", enterDTO2);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);
		
		return "admin.adminroundlist.admin2roundlist";
	}
	
	@RequestMapping("admin3roundlist.do")
	public String admin3roundlist(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("결승참가자 리스트");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int enterCount3 = roundDAO.getenterCount3(mcn_no, ent_enter);// 검색 결과에 따른 게시글 총
		
		
		List<EnterDTO> enterDTO3 = roundDAO.admin3roundlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("enterCount3", enterCount3);
		model.addAttribute("enterDTO3", enterDTO3);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);
		
		return "admin.adminroundlist.admin3roundlist";
	}
	
	@RequestMapping(value="admin1roundpointlist.do")
	public String admin1roundpointlist(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("점수창아 나와라");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		List<Round1DTO> round1DTO = roundDAO.round1pointlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("round1DTO", round1DTO);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);
		return "admin.adminroundpoint.admin1roundpointlist";
	}
	
	@RequestMapping(value="admin1roundpointlistck.do")
	public String admin1roundpointlist(Round1DTO round1DTO, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("본선 올라가기");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int result = roundDAO.admin1roundpointlistck(round1DTO);
		
		if(result == 1){
			System.out.println("본선가기완료");
		}else{
			System.out.println("실패");
		}
		
		return "redirect:admin1roundpointlist.do?mcn_no="+mcn_no+"&ent_enter="+ent_enter;
	}
	
	@RequestMapping(value="admin1roundpointupdate.do", method=RequestMethod.GET)
	public String admin1roundpointupdate(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("예선점수 수정화면");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		List<Round1DTO> round1DTO = roundDAO.round1pointlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("round1DTO", round1DTO);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);
		
		return "admin.adminroundpoint.admin1roundpointupdate";
	}
	
	@RequestMapping(value="admin1roundpointupdates.do", method=RequestMethod.POST)
	public String admin1roundpointupdates(Round1DTO round1DTO, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("예선점수 수정하기");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int result = roundDAO.admin1roundpointupdates(round1DTO);
		
		if(result == 1){
			System.out.println("예선점수 수정완료");
		}else{
			System.out.println("예선점수 수정실패");
		}
		
		return "redirect:admin1roundpointupdate.do?mcn_no="+mcn_no+"&ent_enter="+ent_enter;
	}
	
	@RequestMapping(value="admin1roundpointins.do", method=RequestMethod.GET)
	public String admin1roundpointins(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("예선점 점수 입력하는 화면나와");
		
		EnterDAO enterDAO = sqlSession.getMapper(EnterDAO.class);
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int enterCount = enterDAO.getenterCount(mcn_no, ent_enter);// 검색 결과에 따른 게시글 총
		
		
		List<EnterDTO> enterDTO = enterDAO.admin1roundlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("enterCount", enterCount);
		model.addAttribute("enterDTO", enterDTO);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);
		
		
		return "admin.adminroundpoint.admin1roundpointins";
	}
	
	@RequestMapping(value="adminround1pointinsert2.do", method=RequestMethod.POST)
	public String adminround1pointinsert2(Round1DTO round1DTO, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("등록");
		
		EnterDAO enterDAO = sqlSession.getMapper(EnterDAO.class);
		
		int result = enterDAO.round1pointinsert2(round1DTO);
		
		
		if(result != 0){
			System.out.println("인서트");
		}else{
			System.out.println("실패");
		}
				
		return "redirect:admin1roundpointins.do?mcn_no="+mcn_no+"&ent_enter="+ent_enter;
	}
	
	
	@RequestMapping("admin2roundpointlist.do")
	public String admin2roundpointlist(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("점수창아 나와라");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		List<Round2DTO> round2DTO = roundDAO.round2pointlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("round2DTO", round2DTO);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);
		
		return "admin.adminroundpoint.admin2roundpointlist";
	}
	
	@RequestMapping("adminaddlsit.do")
	public String adminaddlist(Model model, int mcn_no)throws Exception{
		
		System.out.println("대회 리스트창");
		
		AddDAO addDAO = sqlSession.getMapper(AddDAO.class);
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		List<AddDTO> addDTO	= addDAO.adminaddlist(mcn_no);
		List<EnterDTO> competition = roundDAO.competition();
		
		model.addAttribute("addDTO", addDTO);
		model.addAttribute("competition",competition);
		
		return "admin.adminadd.adminaddlist";
	}
	
	@RequestMapping(value="adminaddins.do", method=RequestMethod.GET)
	public String adminaddins(Model model, int mcn_no)throws Exception{
		
		System.out.println("등록하는곳");

		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		BranchDAO branchDAO = sqlSession.getMapper(BranchDAO.class);
		
		List<EnterDTO> competition = roundDAO.competition();
		List<BranchDTO> branchDTO = branchDAO.memberbranchlist();
		
		
		model.addAttribute("competition",competition);
		model.addAttribute("branchDTO",branchDTO);
		
		return "admin.adminadd.adminaddins";
	}
	
	@RequestMapping(value="adminaddinsert.do", method=RequestMethod.POST)
	public String adminaddinsert(AddDTO addDTO, int mcn_no)throws Exception{
		
		System.out.println("대회등록");
		
		AddDAO addDAO = sqlSession.getMapper(AddDAO.class);
		
		int result = addDAO.adminaddinsert(addDTO);
		
		if(result != 0){
			System.out.println("대회 등록완료");
		}else{
			System.out.println("대회 등록 실패");
		}
		
		return "redirect:adminaddlist.do?mcn_no="+mcn_no;
	}
	
	@RequestMapping("adminadddetaile.do")
	public String adminadddetaile(Model model, int ma_idx)throws Exception{
		
		System.out.println("상세보기");
		
		AddDAO addDAO = sqlSession.getMapper(AddDAO.class);
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		BranchDAO branchDAO = sqlSession.getMapper(BranchDAO.class);
		
		AddDTO addDTO = addDAO.adminadddetaile(ma_idx);
		List<EnterDTO> competition = roundDAO.competition();
		List<BranchDTO> branchDTO = branchDAO.memberbranchlist();
		
		model.addAttribute("addDTO", addDTO);
		model.addAttribute("competition", competition);
		model.addAttribute("branchDTO", branchDTO);
		
		return "admin.adminadd.adminadddetaile";
	}
	
	@RequestMapping("adminaddupdate.do")
	public String adminaddupdate(AddDTO addDTO, int ma_idx)throws Exception{
		
		System.out.println("업데이트 실행");
		
		AddDAO addDAO = sqlSession.getMapper(AddDAO.class);
		
		int result = addDAO.adminaddupdate(addDTO);
		
		if(result != 0){
			System.out.println("업데이트 완료");
		}else{
			System.out.println("업데이트 실패");
		}
		
		return "redirect:adminadddetaile.do?ma_idx="+ma_idx;
	}
	
	@RequestMapping("admincompnolist.do")
	public String admincompnolist(Model model)throws Exception{
		
		System.out.println("대회 리스트창");
		
		AddDAO addDAO = sqlSession.getMapper(AddDAO.class);
		
		List<AddDTO> addDTO	= addDAO.admincompnolist();
		
		model.addAttribute("addDTO", addDTO);
		
		return "admin.adminadd.admincompnolist";
	}
	
	@RequestMapping(value="admincompnoinsert.do", method=RequestMethod.POST)
	public String admincompnoinsert(AddDTO addDTO)throws Exception{
		
		System.out.println("횟차 등록하자");
		
		AddDAO addDAO = sqlSession.getMapper(AddDAO.class);
		
		int result = addDAO.admincompnoinsert(addDTO);
		
		if(result != 0){
			System.out.println("등록완료");
		}else{
			System.out.println("등록실패");
		}
		
		return "redirect:admincompnolist.do";
	}
	
	@RequestMapping(value="admin2roundpointupdate.do", method=RequestMethod.GET)
	public String admin2roundpointupdate(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("예선점수 수정화면");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		List<Round2DTO> round2DTO = roundDAO.round2pointlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("round2DTO", round2DTO);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);		
		
		return "admin.adminroundpoint.admin2roundpointupdate";
	}
	
	@RequestMapping("admin2roundpointupdatee.do")
	public String admin2roundpointupdatee(Round2DTO round2DTO, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("본선점수 수정하기");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int result = roundDAO.admin2roundpointupdatee(round2DTO);
				
		if(result == 1){
			System.out.println("수정완료");
		}else{
			System.out.println("수정실패");
		}
		
		return "redirect:admin2roundpointupdate.do?mcn_no="+mcn_no+"&ent_enter="+ent_enter;
	}
	
	@RequestMapping(value="admin2roundpointins.do", method=RequestMethod.GET)
	public String admin2roundpointins(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("예선점 점수 입력하는 화면나와");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int enterCount2 = roundDAO.getenterCount2(mcn_no, ent_enter);// 검색 결과에 따른 게시글 총
		
		List<EnterDTO> enterDTO2 = roundDAO.admin2roundlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("enterCount2", enterCount2);
		model.addAttribute("enterDTO2", enterDTO2);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);
		
		
		return "admin.adminroundpoint.admin2roundpointins";
	}
	
	@RequestMapping(value="admin2roundpointinsrt.do", method=RequestMethod.POST)
	public String admin2roundpointinsert(Round2DTO round2DTO, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("본선점수 입력");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int result = roundDAO.admin2roundpointinsert(round2DTO);
		
		if(result != 0){
			System.out.println("등록완료");
		}else{
			System.out.println("등록실패");
		}
		
		return "redirect:admin2roundpointins.do?mcn_no="+mcn_no+"&ent_enter="+ent_enter;
	}
	
	@RequestMapping("admin2roundck.do")
	public String admin2roundck (Round2DTO round2DTO, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("결승체크하기");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int result = roundDAO.admin2roundck(round2DTO);
		
		if(result == 1){
			System.out.println("결승체크완료");
		}else{
			System.out.println("실패");
		}
		
		return "redirect:admin2roundpointlist.do?mcn_no="+mcn_no+"&ent_enter="+ent_enter;
	}
	
	@RequestMapping("admin3roundpointlist.do")
	public String admin3roundpointlist(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("결승 리스트 나와라");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		List<Round3DTO> round3DTO = roundDAO.round3pointlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("round3DTO", round3DTO);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);
		
		return "admin.adminroundpoint.admin3roundpointlist";
	}
	
	@RequestMapping(value="admin3roundpointins.do", method=RequestMethod.GET)
	public String admin3roundpointins(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("결승 점수 입력창");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		
		List<EnterDTO> enterDTO3 = roundDAO.admin3roundlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("enterDTO3", enterDTO3);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);
		
		return "admin.adminroundpoint.admin3roundpointins";
	}
	
	@RequestMapping(value="admin3roundpointinsert", method=RequestMethod.POST)
	public String admin3roundpointinsert(Round3DTO round3DTO, int mcn_no, int ent_enter) throws Exception{
		
		System.out.println("점수 등록");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int result = roundDAO.admin3roundpointinsert(round3DTO);
		
		if(result != 0){
			System.out.println("등록완료");
		}else{
			System.out.println("ㄴㄴ");
		}
		
		return "redirect:admin3roundpointins.do?mcn_no="+mcn_no+"&ent_enter="+ent_enter;
	}
	
	@RequestMapping("admin3roundpointupdate.do")
	public String admin3roundpointupdate(Model model, int mcn_no, int ent_enter)throws Exception{
		
		System.out.println("경승점수 수정");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		List<Round3DTO> round3DTO = roundDAO.round3pointlist(mcn_no, ent_enter);
		List<EnterDTO> competition = roundDAO.competition();
		List<EnterDTO> enterfield = roundDAO.enterfield();
		
		model.addAttribute("round3DTO", round3DTO);
		model.addAttribute("competition",competition);
		model.addAttribute("enterfield",enterfield);	
		
		return "admin.adminroundpoint.admin3roundpointupdate";
	}
	
	@RequestMapping("admin3roundpointupdatee.do")
	public String admin3roundpointupdatee(Round3DTO round3DTO, int mcn_no, int ent_enter)throws Exception{
	
		System.out.println("결승점수 수정실행");
		
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		int result = roundDAO.admin3roundpointupdate(round3DTO);
		
		if(result ==  1){
			System.out.println("점수 수정실행");
		}else{
			System.out.println("점수 수정 실패");
		}
		
		return "redirect:admin3roundpointupdate.do?mcn_no="+mcn_no+"&ent_enter="+ent_enter;
	}
	
}

