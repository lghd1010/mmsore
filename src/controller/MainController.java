package controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import DAO.NoticeDAO;
import DTO.NoticeDTO;

@Controller
public class MainController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("index.do")
	public String index(Model model) throws Exception {
		System.out.println("나와라 메인페이지여 ");
		
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		List<NoticeDTO> hnoticelist = noticeDAO.hnoticelist();
		
		model.addAttribute("hnoticelist", hnoticelist);
		
		return "main.index";
	}
	
	@RequestMapping("mmso.do")
	public String mmso(Model model)throws Exception{
		System.out.println("mmso란?");
		
		return "home.mmso.mmso";
	}
	
	@RequestMapping("introduction.do")
	public String introduction(Model model)throws Exception{
		System.out.println("소개?");
		
		return "home.mmso.introduction";
	}
	
	@RequestMapping("effect.do")
	public String effect(Model model)throws Exception{
		System.out.println("효과");
		
		return "home.mmso.effect";
	}
	
	@RequestMapping("goal.do")
	public String goal(Model model)throws Exception{
		System.out.println("목표");
		
		return "home.mmso.goal";
	}
	
	@RequestMapping("map.do")
	public String map(Model model)throws Exception{
		System.out.println("지도");
		
		return "home.mmso.map";
	}
	
	@RequestMapping("refereewinner.do")
	public String refereewinner(Model model)throws Exception{
		System.out.println("심판우수");
		
		return "home.mmso.refereewinner";
	}
	
	@RequestMapping("winnerK.do")
	public String winnerK(Model model)throws Exception{
		System.out.println("우승자");
		
		return "home.mmso.winnerK";
	}
}
