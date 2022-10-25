package org.whynull.mapper;

import org.apache.ibatis.annotations.Param;
import org.whynull.domain.ReplyDTO;
import org.whynull.domain.criteria.ReplyCriteria;

import java.util.List;

public interface ReplyMapper {
    int insert(ReplyDTO dto);

    ReplyDTO read(ReplyDTO dto);

    int delete(ReplyDTO dto);

    int modify(ReplyDTO dto);

    List<ReplyDTO> getList(@Param("cri") ReplyCriteria cri, @Param("dto") ReplyDTO dto);

    int getCountByPostNum(ReplyDTO dto);
}
