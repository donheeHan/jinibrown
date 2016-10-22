package jiniShop.qna.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import jiniShop.qna.service.QnaService;
import jiniShop.vo.Login_ViewVO;
import jiniShop.vo.QnaVO;
import jiniShop.vo.QnaViewVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	@RequestMapping("qnaList")
	public String qnaList(HttpSession session, Model model){
		String url = "";
		String id="";
		Login_ViewVO loginUser = (Login_ViewVO) session.getAttribute("loginUser");
		if(loginUser != null){
			url="/qna/qnaList";
			id = loginUser.getId();
		}else{
			url="/main";
		}
		
		List<QnaViewVO> qnaList = qnaService.getQnaList(id);
		
		model.addAttribute("qnaList", qnaList);
		
		return url;
	}
	
	@RequestMapping("qnaWriteForm")
	public String qnaWriteForm(){
		String url="/qna/qnaWrite";
		
		return url;
	}
	
	@RequestMapping("qnaWrite")
	public String qnaWrite(QnaVO qnaVO){
		String url="redirect:/qnaList";
		
		qnaService.insertQna(qnaVO);
		
		return url;
	}
	
	@RequestMapping("qnaDetail")
	public String qnaDetail(@RequestParam("q_no")String q_no, Model model){
		String url="/qna/qnaDetail";
		
		QnaViewVO qnaInfo = qnaService.getQnaDetail(q_no);
		
		model.addAttribute("qnaInfo", qnaInfo);
		
		return url;
	}
	
	@RequestMapping("qnaDel")
	public String qnaDel(@RequestParam("q_no")String q_no){
		String url="redirect:/qnaList";
		
		qnaService.deleteQna(q_no);
		
		return url;
	}
}
