package org.whynull.service;

import org.whynull.domain.BoardDTO;
import org.whynull.domain.Criteria;

import java.util.List;

public interface BoardService {
    public void write(BoardDTO dto);
    public BoardDTO read(Long bno);
    public List<BoardDTO> getList(Criteria cri);
    public int getTotal(Criteria cri);
}
