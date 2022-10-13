package org.whynull.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.whynull.domain.BoardDTO;
import org.whynull.domain.Criteria;

import java.util.List;

public interface BoardMapper {
    List<BoardDTO> getList(Criteria cri);
    void write(BoardDTO dto);
    BoardDTO read(@Param("boardNum") Long boardNum, @Param("post_num") Long postNum);
    int getTotal(Criteria cri);
    void viewCount(Long post_num);
}
