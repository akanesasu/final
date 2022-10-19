package org.whynull.security.domain;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.whynull.domain.MemberDTO;

import java.util.Collection;
import java.util.stream.Collectors;

@Getter
public class WhynullUser extends User {
    public static final long serialVersionUID = 1L;
    private MemberDTO member;

    public WhynullUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    public WhynullUser(MemberDTO dto) {
        super(dto.getUserId(), dto.getUserPw(), dto.getAuthList().stream().map(auth
                -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
        this.member = dto;
    }
}
