package org.whynull.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ReplyDTO {
    private Long replyNum;
    private Long postNum;
    private Long boardNum;

    private String reply;
    private String replyer;
    private Date replyDate;
}
