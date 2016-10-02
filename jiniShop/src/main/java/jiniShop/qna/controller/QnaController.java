package jiniShop.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {

	@RequestMapping("qnaList")
	public String qnaList(){
		String url = "/qna/qnaList";
		
		return url;
	}
}
