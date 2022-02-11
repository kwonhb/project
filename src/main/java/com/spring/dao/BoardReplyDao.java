package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.BoardDto;
import com.spring.dto.BoardReplyDto;

@Mapper
public interface BoardReplyDao {
	//게시판 crud
	BoardDto postnodto(int postid);
	int boardwrite(BoardDto dto);
	int boardupdate(BoardDto dto);
	int boarddelete(int postid);
	//댓글 crud
	List<BoardReplyDto> selectReply(int postid);
	int insertReply(BoardReplyDto dto);
	int readcount(int postno); 
	int deleteReply(int replyid);
	
}
