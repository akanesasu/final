package org.whynull.domain.criteria;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainCriteria {
    private int pageNum;
    private int amount;
    private Long boardNum;

    public MainCriteria(Long boardNum) {
        this.pageNum = 1;
        this.boardNum = boardNum;
        this.amount = 5;
    }
}
