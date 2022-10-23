package org.whynull.domain.criteria;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyCriteria {
    private int pageNum;
    private int amount;

    public ReplyCriteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
}
