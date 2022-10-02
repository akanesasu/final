package org.whynull.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.whynull.domain.BoardDTO;
import org.whynull.domain.Criteria;
import org.whynull.mapper.BoardMapper;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardMapper mapper;

    @Transactional
    @Override
    public void write(BoardDTO dto) {
        log.info("Write new article : " + dto);
        mapper.insertSelectKey(dto);
    }

    @Override
    public BoardDTO read(Long bno) {
        log.info("Get the article ==============================");
        return mapper.read(bno);
    }

    @Override
    public List<BoardDTO> getList(Criteria cri) {
        log.info("Get board list // Criteria : " + cri);
        return mapper.getList(cri);
    }

    @Override
    public int getTotal(Criteria cri) {
        return mapper.getTotal(cri);
    }
}
