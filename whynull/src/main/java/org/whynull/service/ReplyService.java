package org.whynull.service;

import org.whynull.domain.ReplyDTO;
import org.whynull.domain.criteria.Criteria;

import java.util.List;

public interface ReplyService {
    int write(ReplyDTO dto);

    ReplyDTO get(Long replyNum);

    int modify(ReplyDTO dto);

    int remove(Long replyNum);

    List<ReplyDTO> getList(Criteria cri, Long postNum);
}
