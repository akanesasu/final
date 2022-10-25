package org.whynull.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.whynull.domain.ReplyDTO;
import org.whynull.domain.ReplyPageDTO;
import org.whynull.domain.criteria.ReplyCriteria;
import org.whynull.mapper.BoardMapper;
import org.whynull.mapper.ReplyMapper;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService{
    private final ReplyMapper mapper;
    private final BoardMapper boardMapper;

    @Transactional
    @Override
    public int write(ReplyDTO dto) {
        log.info("Write Reply  : " + dto + " ====================== ");
        boardMapper.updateReplyCount(dto.getPostNum(), 1, dto.getBoardNum());
        return mapper.insert(dto);
    }

    @Override
    public ReplyDTO get(ReplyDTO dto) {
        log.info("Get Reply  : " + dto.getReplyNum() + " ====================== ");
        return mapper.read(dto);
    }

    @Override
    public int modify(ReplyDTO dto) {
        log.info("Modify Reply  : " + dto + " ====================== ");
        return mapper.modify(dto);
    }

    @Transactional
    @Override
    public int remove(ReplyDTO dto) {
        log.info("Remove Reply  : " + dto.getReplyNum() + " ====================== ");
        boardMapper.updateReplyCount(dto.getPostNum(), -1, dto.getBoardNum());
        return mapper.delete(dto);
    }

    @Override
    public List<ReplyDTO> getList(ReplyCriteria cri, ReplyDTO dto) {
        log.info("List of Reply  : " + dto.getPostNum() + " ====================== ");
        return mapper.getList(cri, dto);
    }

    @Override
    public ReplyPageDTO getListPage(ReplyCriteria cri, ReplyDTO dto) {
        log.info("List of Reply  : " + dto.getPostNum() + " ====================== ");
        return new ReplyPageDTO(mapper.getCountByPostNum(dto), mapper.getList(cri,dto));
    }
}
