package org.whynull.service;

import org.whynull.domain.BoardDTO;
import org.whynull.domain.criteria.Criteria;
import org.whynull.domain.criteria.HeadListCriteria;
import org.whynull.domain.criteria.MainCriteria;
import org.whynull.domain.WriteDTO;

import java.util.List;

public interface BoardService {
    void write(BoardDTO dto);
    BoardDTO read(Long boardNum, Long post_num);
    List<BoardDTO> getList(Criteria cri);
    int getTotal(Criteria cri);
    List<WriteDTO> getContentList(Long boardNum, Long post_num);
    void viewCount(Long boardNum, Long post_num);
    List<String> getHeadList(Criteria cri);
    List<String> getWriteHeadList(HeadListCriteria cri);
    List<BoardDTO> getMainList1(MainCriteria cri);
    List<BoardDTO> getMainList2(MainCriteria cri);
    List<BoardDTO> getMainList3(MainCriteria cri);
    List<BoardDTO> getMainList4(MainCriteria cri);
}
