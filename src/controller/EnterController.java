package controller;

import java.io.PrintWriter;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import DAO.AddDAO;
import DAO.EnterDAO;
import DAO.RoundDAO;
import DTO.AddDTO;
import DTO.EnterDTO;

@Controller
public class EnterController {

	@Autowired
	private SqlSession sqlSession;
	
	PrintWriter out;
	
	@RequestMapping("enterlist.do")
	public String enterlist(Model model, int mcn_no)throws Exception{
		
		System.out.println("대회신청리스트 나와라");
		
		EnterDAO enterDAO = sqlSession.getMapper(EnterDAO.class);
		AddDAO addDAO = sqlSession.getMapper(AddDAO.class);
		RoundDAO roundDAO = sqlSession.getMapper(RoundDAO.class);
		
		List<EnterDTO> enterlist = enterDAO.enterlist();
		List<EnterDTO> competition = roundDAO.competition();
		List<AddDTO> addDTO	= addDAO.adminaddlist(mcn_no);
		
		model.addAttribute("enterlist", enterlist);
		model.addAttribute("addDTO", addDTO);
		model.addAttribute("competition",competition);
		
		return "home.enter.enterlist";
	}
	
}
