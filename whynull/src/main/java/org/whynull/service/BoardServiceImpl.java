package org.whynull.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.whynull.domain.BoardDTO;
import org.whynull.domain.criteria.Criteria;
import org.whynull.domain.criteria.HeadListCriteria;
import org.whynull.domain.criteria.MainCriteria;
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
    public BoardDTO read(Long boardNum, Long post_num) {
        log.info("Get the article ==============================");
        return mapper.read(boardNum, post_num);
    }

    @Override
    public List<BoardDTO> getList(Criteria cri) {
        log.info("Get board list // Criteria : " + cri);
        return mapper.getList(cri);
    }
    @Override
    public List<BoardDTO> getMainList1(MainCriteria cri) {
        log.info("Get Main board list 1 // Criteria : " + cri);
        return mapper.getMainList1(cri);
    }
    @Override
    public List<BoardDTO> getMainList2(MainCriteria cri) {
        log.info("Get Main board list 2 // Criteria : " + cri);
        return mapper.getMainList2(cri);
    }
    @Override
    public List<BoardDTO> getMainList3(MainCriteria cri) {
        log.info("Get Main board list 3 // Criteria : " + cri);
        return mapper.getMainList3(cri);
    }
    @Override
    public List<BoardDTO> getMainList4(MainCriteria cri) {
        log.info("Get Main board list 4 // Criteria : " + cri);
        return mapper.getMainList4(cri);
    }

    @Override
    public int getTotal(Criteria cri) {
        return mapper.getTotal(cri);
    }

    @Override
    public List<WriteDTO> getContentList(Long boardNum, Long post_num) {
        log.info("getContentList by post_num : " + post_num);
        return writeMapper.findByPostNum(boardNum, post_num);
    }

    @Override
    public void viewCount(Long boardNum, Long post_num) {
        mapper.viewCount(boardNum, post_num);
    }

    @Override
    public List<String> getHeadList(Criteria cri) {
        if(cri.getBoardNum() == 1) {
            cri.insertHeadFree();
            return cri.getHeadFree();
        } else if(cri.getBoardNum() == 2) {
            cri.insertHeadInfo();
            return cri.getHeadInfo();
        } else if(cri.getBoardNum() == 3) {
            cri.insertHeadPr();
            return cri.getHeadPr();
        } else if(cri.getBoardNum() == 4) {
            cri.insertHeadCode();
            return cri.getHeadCode();
        }

        return null;
    }

    @Override
    public List<String> getWriteHeadList(HeadListCriteria cri) {
        if(cri.getBoardNum() == 1) {
            cri.insertHeadFree();
            return cri.getHeadFree();
        } else if(cri.getBoardNum() == 2) {
            cri.insertHeadInfo();
            return cri.getHeadInfo();
        } else if(cri.getBoardNum() == 3) {
            cri.insertHeadPr();
            return cri.getHeadPr();
        } else if(cri.getBoardNum() == 4) {
            cri.insertHeadCode();
            return cri.getHeadCode();
        }

        return null;
    }
}
