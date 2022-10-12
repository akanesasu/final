package org.whynull.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.whynull.domain.BoardDTO;
import org.whynull.domain.Criteria;
import org.whynull.domain.WriteDTO;
import org.whynull.mapper.BoardMapper;
import org.whynull.mapper.WriteMapper;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardMapper mapper;
    private final WriteMapper writeMapper;

    @Transactional
    @Override
    public void write(BoardDTO dto) {
        log.info("Write new article : " + dto);
        mapper.write(dto);
    }

    @Override
    public BoardDTO read(Long board_num, Long post_num) {
        log.info("Get the article ==============================");
        return mapper.read(board_num, post_num);
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

    @Override
    public List<WriteDTO> getContentList(Long board_num, Long post_num) {
        log.info("getContentList by post_num : " + post_num);
        return writeMapper.findByPostNum(board_num, post_num);
    }

    @Override
    public void viewCount(Long post_num) {
        mapper.viewCount(post_num);
    }
}
