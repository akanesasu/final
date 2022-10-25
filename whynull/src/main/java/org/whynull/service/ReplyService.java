package org.whynull.service;

import org.whynull.domain.ReplyDTO;
import org.whynull.domain.ReplyPageDTO;
import org.whynull.domain.criteria.ReplyCriteria;

import java.util.List;

public interface ReplyService {
    int write(ReplyDTO dto);

    ReplyDTO get(ReplyDTO dto);

    int modify(ReplyDTO dto);

    int remove(ReplyDTO dto);

    List<ReplyDTO> getList(ReplyCriteria cri, ReplyDTO dto);

    ReplyPageDTO getListPage(ReplyCriteria cri, ReplyDTO dto);
}
