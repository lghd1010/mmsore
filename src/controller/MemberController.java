package controller;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import DTO.BranchDTO;
import DTO.EduinfoDTO;
import DAO.BranchDAO;
import DAO.EduinfoDAO;
import DAO.MemberDAO;
import DTO.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private SqlSession sqlSession;
	
	PrintWriter out;
	
	@RequestMapping(value="joinform.do", method=RequestMethod.GET)
	public String joinform(Model model)throws Exception{
		
		System.out.println("회원가입 화면");
		
		BranchDAO branchDAO = sqlSession.getMapper(BranchDAO.class);
		EduinfoDAO eduinfoDAO = sqlSession.getMapper(EduinfoDAO.class);
		
		List<BranchDTO> branchDTO = branchDAO.memberbranchlist();
		List<EduinfoDTO> eduinfoDTO = eduinfoDAO.membereduinfolist();
		
		model.addAttribute("eduinfoDTO", eduinfoDTO);
		model.addAttribute("branchDTO", branchDTO);
		
		return "join.join";
	}
	
	@RequestMapping(value = "joinAutoCompleteAjax.do", method = RequestMethod.POST)
	public ModelAndView getTableUserAjax(
			@RequestParam("m_cname") String m_cname)
			throws Exception {
		System.out.println("joinAutoCompleteAjax");
		ModelAndView mav = new ModelAndView();

		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		List<EduinfoDTO> e_nameList = memberDAO.getMcnameAjax("%" + m_cname + "%");
		String jsonObject = "";
		if (e_nameList.size() > 0) {
			for (int i = 0; i < e_nameList.size(); i++) {
				if (i != 0) {
					jsonObject += ",";
				}
				jsonObject += ""+ URLEncoder.encode(e_nameList.get(i).getE_name(), "UTF-8") + "";
			}
		}
		if ("".equals(jsonObject)) {
			mav.addObject("jsonObject", "empty");
		} else {
			mav.addObject("jsonObject", jsonObject);
		}
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public void join(MemberDTO memberDTO, HttpServletResponse response)throws Exception{
		System.out.println("회원가입 실행");
		
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		
		int result = memberDAO.memberinsert(memberDTO);
		
		if(result != 0){
			System.out.println("회원가입 완료");
			out.print(
					"<script type='text/javascript'>alert('축하드립니다. 회원가입이 완료 되었습니다. 회원가입 축하글을 메일로 전송했습니다!!'); location.replace('main.do');</script>");
		} else {
			System.out.println("회원가입 실패");
			out.print(
					"<script type='text/javascript'>alert('회원 가입을  실패하였습니다.'); location.replace('main.do');</script>");
		}
		out.close();
		
	}
	
	
	

}
