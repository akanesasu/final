package org.whynull.mapper;

import org.whynull.domain.MemberDTO;

public interface MemberMapper {
    MemberDTO login(String userId);
    void signIn(MemberDTO dto);
}
