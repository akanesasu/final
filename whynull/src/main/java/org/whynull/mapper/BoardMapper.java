package org.whynull.mapper;

import org.apache.ibatis.annotations.Param;
import org.whynull.domain.BoardDTO;
import org.whynull.domain.criteria.Criteria;
import org.whynull.domain.criteria.MainCriteria;

import java.util.List;

public interface BoardMapper {
    List<BoardDTO> getList(Criteria cri);
    void write(BoardDTO dto);
    BoardDTO read(@Param("boardNum") Long boardNum, @Param("post_num") Long postNum);
    int getTotal(Criteria cri);
    void viewCount(@Param("boardNum") Long boardNum, @Param("post_num") Long postNum);
    List<BoardDTO> getMainList1(MainCriteria cri);
    List<BoardDTO> getMainList2(MainCriteria cri);
    List<BoardDTO> getMainList3(MainCriteria cri);
    List<BoardDTO> getMainList4(MainCriteria cri);
}
