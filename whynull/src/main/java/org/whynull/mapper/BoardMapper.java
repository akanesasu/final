package org.whynull.mapper;

import org.apache.ibatis.annotations.Param;
import org.whynull.domain.BoardDTO;
import org.whynull.domain.Criteria;

import java.util.List;

public interface BoardMapper {
    List<BoardDTO> getList(Criteria cri);
    void write(BoardDTO board);
    BoardDTO read(@Param("board_num") Long board_num, @Param("post_num") Long post_num);
    int getTotal(Criteria cri);
    void viewCount(Long post_num);
}
