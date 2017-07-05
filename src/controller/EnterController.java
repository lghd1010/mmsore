package controller;

import java.io.PrintWriter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EnterController {

	@Autowired
	private SqlSession sqlSession;
	
	PrintWriter out;
	
	@RequestMapping("enterlist.do")
	public String enterlist(Model model)throws Exception{
		
		System.out.println("대회신청리스트 나와라");
		
		
		
		return "home.enter.enterlist";
	}
	
}
