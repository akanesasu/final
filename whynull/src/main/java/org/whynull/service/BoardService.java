package org.whynull.service;

import org.whynull.domain.BoardDTO;
import org.whynull.domain.Criteria;
import org.whynull.domain.WriteDTO;

import java.util.List;

public interface BoardService {
    void write(BoardDTO dto);
    BoardDTO read(Long board_num, Long post_num);
    List<BoardDTO> getList(Criteria cri);
    int getTotal(Criteria cri);
    List<WriteDTO> getContentList(Long board_num, Long post_num);
    void viewCount(Long post_num);
}
