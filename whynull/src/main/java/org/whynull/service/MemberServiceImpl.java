package org.whynull.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.whynull.domain.AuthDTO;
import org.whynull.domain.MemberDTO;
import org.whynull.mapper.MemberMapper;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    private final MemberMapper mapper;
    private final BCryptPasswordEncoder encoder;

    @Transactional
    @Override
    public void signIn(MemberDTO dto, AuthDTO authDTO) {
        log.info("Sign In : " + dto);
        String encodedPw = encoder.encode(dto.getUserPw());
        dto.setUserPw(encodedPw);
        mapper.signIn(dto);
        mapper.signInAuth(authDTO);
    }
}
