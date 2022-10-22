package org.whynull.mapper;

import org.apache.ibatis.annotations.Param;
import org.whynull.domain.ReplyDTO;
import org.whynull.domain.criteria.Criteria;

import java.util.List;

public interface ReplyMapper {
    int insert(ReplyDTO dto);

    ReplyDTO read(Long boardNum);

    int delete(Long boardNum);

    int update(ReplyDTO dto);

    List<ReplyDTO> getList(@Param("cri") Criteria cri, @Param("boardNum") Long boardNum);
}
