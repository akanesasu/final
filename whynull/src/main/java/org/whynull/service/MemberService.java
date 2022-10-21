package org.whynull.service;

import org.whynull.domain.AuthDTO;
import org.whynull.domain.MemberDTO;

public interface MemberService {
    void signIn(MemberDTO dto, AuthDTO authDTO);
}
