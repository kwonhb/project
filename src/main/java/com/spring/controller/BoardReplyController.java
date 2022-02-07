package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.BoardReplyDto;
import com.spring.service.BoardReplyService;

@Controller
public class BoardReplyController {
	@Autowired
	BoardReplyService service;
	
	@GetMapping("/reply/insert")
	@ResponseBody
	public String insertReply(BoardReplyDto dto){
		int i = service.insertReply(dto);
		return i+"";
	}
	
	@GetMapping("/reply/delete/{replyid}")
	@ResponseBody
	public String deleteReply(int replyid) {
		int i = service.deleteReply(replyid);
		return i+"";
	}
}
