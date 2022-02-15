package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.BoardDto;
import com.spring.dto.BoardReplyDto;
import com.spring.service.BoardReplyService;

@Controller
public class BoardReplyController {
	@Autowired
	BoardReplyService service;
	
	@GetMapping("/board/write")
	public String boardwrite() {
		return "board/write";
	}
	
	@PostMapping("/board/boardwrite")
	public String boardwrite(BoardDto dto) {
		service.boardwrite(dto);
		return "redirect:/board/list";
	}
	
	@GetMapping("/board/content")
	public String content() {
		return "board/content";
	}
	
	@RequestMapping("board/content/{postno}")
	public String boardcontent(@PathVariable int postno, BoardDto dto, Model m) {
		service.readcount(postno);

		List<BoardReplyDto> rdto = service.selectReply(postno);
		
		dto = service.postnodto(postno);

		m.addAttribute("rdto",rdto);
		m.addAttribute("dto", dto);
		return "board/content";
	}
	
	@RequestMapping("/board/update/{postno}")
	public String boardupdate(@PathVariable int postno, BoardDto dto, Model m) {
		dto = service.postnodto(postno);
		m.addAttribute("dto", dto);
		service.boardupdate(dto);
		return "/board/update";
	}
	
	@GetMapping("/board/delete")
	public String boarddelete(int postid) {
		int i = service.boarddelete(postid);
		return i+"";
	}
	
	@GetMapping("/reply/insert")
	@ResponseBody
	public String insertReply(BoardReplyDto dto){
		int i = service.insertReply(dto);
		return i+"";
	}
	
	@GetMapping("/reply/delete/{replyid}")
	@ResponseBody
	public String deleteReply(@PathVariable int replyid) {
		int i = service.deleteReply(replyid);
		return i+"";
	}
	
}
