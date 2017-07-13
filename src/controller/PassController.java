package controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import DAO.EduinfoDAO;
import DAO.PassDAO;
import DTO.EduinfoDTO;
import DTO.EnterDTO;

@Controller
public class PassController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("round1pass.do")
	public String round1pass(Model model)throws Exception{
		
		System.out.println("본선진출 페이지야 나와라");
		
		EduinfoDAO eduinfoDAO = sqlSession.getMapper(EduinfoDAO.class);
		List<EduinfoDTO> eduinfoDTO = eduinfoDAO.membereduinfolist();
		
		model.addAttribute("eduinfoDTO", eduinfoDTO);
		return "home.mmso.1roundpass";
	}
	
	@RequestMapping("round1passcheck.do")
	public String round1passcheck(@RequestParam(value="f", required = false, defaultValue = "ent_name") String field,
			@RequestParam(value="q", required = false, defaultValue = "%%") String query,
			@RequestParam(value="f2", required = false, defaultValue = "ent_enter") String field2,
			@RequestParam(value="q2", required = false, defaultValue = "%%") String query2,
			@RequestParam(value="f3", required = false, defaultValue = "ent_birthday") String field3,
			@RequestParam(value="q3", required = false, defaultValue = "%%") String query3,
			@RequestParam(value="f4", required = false, defaultValue = "ent_cname") String field4,
			@RequestParam(value="q4", required = false, defaultValue = "%%") String query4,
			Model model)throws Exception{
		
		System.out.println("본선진출 페이지야 나와라");
		
		PassDAO passDAO = sqlSession.getMapper(PassDAO.class);
		
		/*EntertestDTO entertestDTO = entertestDAO.round1passcheck(name, birthday, enter, cname);*/
		List<EnterDTO> entertestDTO = passDAO.round1passcheck(field, query, field2, query2, field3, query3, field4, query4);
		
		
		model.addAttribute("entertestDTO", entertestDTO);
		
		
		return "home.mmso.1roundpassck";
	}
	
	@RequestMapping("round2pass.do")
	public String round2pass(Model model)throws Exception{
		
		System.out.println("본선점수확인페이지");
		
		EduinfoDAO eduinfoDAO = sqlSession.getMapper(EduinfoDAO.class);
		List<EduinfoDTO> eduinfoDTO = eduinfoDAO.membereduinfolist();
		
		model.addAttribute("eduinfoDTO", eduinfoDTO);
		return "home.mmso.2roundpass";
	}
	
	@RequestMapping("round2passcheck.do")
	public String round2passcheck(@RequestParam(value="f", required = false, defaultValue = "ent_name") String field,
			@RequestParam(value="q", required = false, defaultValue = "%%") String query,
			@RequestParam(value="f2", required = false, defaultValue = "ent_enter") String field2,
			@RequestParam(value="q2", required = false, defaultValue = "%%") String query2,
			@RequestParam(value="f3", required = false, defaultValue = "ent_birthday") String field3,
			@RequestParam(value="q3", required = false, defaultValue = "%%") String query3,
			@RequestParam(value="f4", required = false, defaultValue = "ent_cname") String field4,
			@RequestParam(value="q4", required = false, defaultValue = "%%") String query4,
			Model model)throws Exception{
		
		System.out.println("본선진출 페이지야 나와라");
		
		PassDAO passDAO = sqlSession.getMapper(PassDAO.class);
		
		/*EntertestDTO entertestDTO = entertestDAO.round1passcheck(name, birthday, enter, cname);*/
		List<EnterDTO> entertestDTO = passDAO.round2passcheck(field, query, field2, query2, field3, query3, field4, query4);
		List<EnterDTO> round3DTO = passDAO.round3result(field, query, field2, query2, field3, query3, field4, query4);
		
		
		model.addAttribute("entertestDTO", entertestDTO);
		model.addAttribute("round3DTO", round3DTO);
		
		
		return "home.mmso.2roundpassck";
	}
}
