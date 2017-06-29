package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DAO.MemberDAO;
import DTO.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private SqlSession sqlSession;
	
	PrintWriter out;
	
	@RequestMapping(value="joinform.do", method=RequestMethod.GET)
	public String joinform()throws Exception{
		
		System.out.println("회원가입 화면");
		
		return "";
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
