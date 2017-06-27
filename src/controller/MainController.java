package controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("index.do")
	public String index(HttpSession session, Model model) throws Exception {
		System.out.println("나와라 메인페이지여 ");
		
		return "main.index";
	}
	
	@RequestMapping("mmso.do")
	public String mmso(Model model)throws Exception{
		System.out.println("mmso란?");
		
		return "home.mmso.mmso";
	}
}
