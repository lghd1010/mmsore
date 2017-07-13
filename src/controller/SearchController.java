package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
	
	@RequestMapping("adminmemberSearch.do")
	public String adminmemberSearch(@RequestParam("field") String field, @RequestParam("query") String query)throws Exception{
		String go = "";
		
		go = "redirect:adminmemberlist.do?f="+field+"&q="+ new String(query.getBytes("utf-8"), "iso-8859-1");
		
		return go;
	}

	@RequestMapping("round1passcheckSearch.do")
	public String round1passcheckSearch(
			@RequestParam("field") String field,
			@RequestParam("query") String query,
			@RequestParam("field2") String field2,
			@RequestParam("query2") String query2,
			@RequestParam("field3") String field3,
			@RequestParam("query3") String query3,
			@RequestParam("field4") String field4,
			@RequestParam("query4") String query4) throws Exception {// 자유게시판 검색
		// 로그 남기기
		System.out.println("자유 게시판 검색");

		// 경로 설정 변수 선언
		String go = "";

		// 검색 URI 설정
		go = "redirect:round1passcheck.do?f=" + field + "&q="+ new String(query.getBytes("utf-8"), "iso-8859-1") + 
				"&f2=" + field2 + "&q2=" +new String(query2.getBytes("utf-8"), "iso-8859-1") + 
				"&f3=" + field3 + "&q3=" +new String(query3.getBytes("utf-8"), "iso-8859-1") + 
				"&f4=" + field4 + "&q4=" +new String(query4.getBytes("utf-8"), "iso-8859-1");

		return go;
	}
	
	@RequestMapping("round2passcheckSearch.do")
	public String round2passcheckSearch(
			@RequestParam("field") String field,
			@RequestParam("query") String query,
			@RequestParam("field2") String field2,
			@RequestParam("query2") String query2,
			@RequestParam("field3") String field3,
			@RequestParam("query3") String query3,
			@RequestParam("field4") String field4,
			@RequestParam("query4") String query4) throws Exception {// 자유게시판 검색
		// 로그 남기기
		System.out.println("자유 게시판 검색");

		// 경로 설정 변수 선언
		String go = "";

		// 검색 URI 설정
		go = "redirect:round2passcheck.do?f=" + field + "&q="+ new String(query.getBytes("utf-8"), "iso-8859-1") + 
				"&f2=" + field2 + "&q2=" +new String(query2.getBytes("utf-8"), "iso-8859-1") + 
				"&f3=" + field3 + "&q3=" +new String(query3.getBytes("utf-8"), "iso-8859-1") + 
				"&f4=" + field4 + "&q4=" +new String(query4.getBytes("utf-8"), "iso-8859-1");

		return go;
	}
}
