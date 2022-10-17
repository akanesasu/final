package org.whynull.security;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.whynull.domain.MemberDTO;
import org.whynull.mapper.MemberMapper;
import org.whynull.security.domain.CustomUser;

@RequiredArgsConstructor
@Log4j2
public class whynullUserDetailsService implements UserDetailsService {
    private final MemberMapper mapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.warn("Load user by username : " + username);
        MemberDTO dto = mapper.login(username);
        log.warn("queried by membermapper : " + dto);
        return dto == null ? null : new CustomUser(dto);
    }
}
