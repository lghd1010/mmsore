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
	
	@RequestMapping(value="joinform.do", method=RequestMethod.POST)
	public String join(MemberDTO memberDTO, HttpServletResponse response)throws Exception{
		System.out.println("회원가입 실행");
		
		//경고문 띄우기 한글
		response.setContentType("text/html;charset=UTF-8");
		out = response.getWriter();
		String go = "";
		
		System.out.println(memberDTO.toString());
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		
		
		//DB에 정보가 없다면 회원 등록
		if(memberDAO.getMember(memberDTO)==null){
			int row = memberDAO.memberinsert(memberDTO);
			System.out.println(row);
			out.print("<script type='text/javascript'>alert('회원가입 성공');location.replace('index.do');</script>");
			go="redirect:index.do";
		}else{
			out.print("<script type='text/javascript'>alert('이미 존재하는 아이디입니다.');location.replace('joinform.do');</script>");
			go="join.join";
		}
		out.close();
		return go;
		
	}
	
	
	

}
