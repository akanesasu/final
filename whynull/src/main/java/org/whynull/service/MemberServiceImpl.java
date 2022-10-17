package org.whynull.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.whynull.domain.MemberDTO;
import org.whynull.mapper.MemberMapper;

@Service
@Log4j2
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    private final MemberMapper mapper;

    @Transactional
    @Override
    public void signIn(MemberDTO dto) {
        log.info("Sign In : " + dto);
        mapper.signIn(dto);
    }
}
