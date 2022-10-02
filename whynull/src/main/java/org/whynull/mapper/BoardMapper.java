package org.whynull.mapper;

import org.whynull.domain.BoardDTO;
import org.whynull.domain.Criteria;

import java.util.List;

public interface BoardMapper {
    public List<BoardDTO> getList(Criteria cri);

    public void insertSelectKey(BoardDTO board);

    public BoardDTO read(Long bno);

    public int getTotal(Criteria cri);
}
