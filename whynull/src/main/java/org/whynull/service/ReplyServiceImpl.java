package org.whynull.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.whynull.domain.ReplyDTO;
import org.whynull.domain.criteria.Criteria;
import org.whynull.mapper.ReplyMapper;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService{
    private final ReplyMapper mapper;

    @Override
    public int write(ReplyDTO dto) {
        log.info("Modify Reply  : " + dto + " ====================== ");
        return mapper.insert(dto);
    }

    @Override
    public ReplyDTO get(Long replyNum) {
        log.info("Get Reply  : " + replyNum + " ====================== ");
        return mapper.read(replyNum);
    }

    @Override
    public int modify(ReplyDTO dto) {
        log.info("Modify Reply  : " + dto + " ====================== ");
        return mapper.update(dto);
    }

    @Override
    public int remove(Long replyNum) {
        log.info("Remove Reply  : " + replyNum + " ====================== ");
        return mapper.delete(replyNum);
    }

    @Override
    public List<ReplyDTO> getList(Criteria cri, Long postNum) {
        log.info("List of Reply  : " + postNum + " ====================== ");
        return mapper.getList(cri, postNum);
    }
}
