package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.BoardDto;
import com.spring.dto.BoardReplyDto;

@Mapper
public interface BoardReplyDao {
	List<BoardReplyDto> selectReply(int postid);
	int insertReply(BoardReplyDto dto);
	int deleteReply(int replyid);
	
	int boardwrite(BoardDto dto);
	int boardupdate(BoardDto dto);
	BoardDto postnodto(int postid);
	int boarddelete(int postid);


}
