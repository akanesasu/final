package org.whynull.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
public class Criteria {
    private int rn;
    private int pageNum;
    private int amount;

    private String type;
    private String keyword;

    private String head;
    private Long boardNum;

    public Criteria(int pageNum, Long boardNum) {
        this.pageNum = pageNum;
        this.boardNum = boardNum;
        this.amount = 10;
    }

    public String[] getHeadArr() {
        return head == null ? new String[] {} : new String[] {head};
    }
    public String[] getBoardNumArr() {
        return boardNum == null ? new String[] {} : new String[] {Long.toString(boardNum)};
    }
}



