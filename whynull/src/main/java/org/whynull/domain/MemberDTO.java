package org.whynull.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class MemberDTO {
    private String userId;
    private String userPw;
    private String userName;
    private boolean enabled;
    private Date regDate;
    private List<AuthDTO> authList;
}
