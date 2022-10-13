package org.whynull.service;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.whynull.domain.BoardDTO;
import org.whynull.domain.Criteria;
import org.whynull.domain.WriteDTO;

import java.util.List;

public interface BoardService {
    void write(BoardDTO dto);
    BoardDTO read(Long boardNum, Long post_num);
    List<BoardDTO> getList(Criteria cri);
    int getTotal(Criteria cri);
    List<WriteDTO> getContentList(Long boardNum, Long post_num);
    void viewCount(Long post_num);
    List<String> getHeadList(Criteria cri);
}
