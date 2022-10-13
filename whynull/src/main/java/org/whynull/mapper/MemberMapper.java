package org.whynull.mapper;

import org.whynull.domain.MemberDTO;

public interface MemberMapper {
    MemberDTO read(String userId);
}
