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
    private Long boardNum;

    private String type;
    private String keyword;

    private String head;
    private List<String> headFree = new ArrayList<>();
    private List<String> headInfo = new ArrayList<>();
    private List<String> headPr = new ArrayList<>();
    private List<String> headCode = new ArrayList<>();

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

    public void insertHeadFree() {
        headFree.add("전체");
        headFree.add("일반");
        headFree.add("질문");
        headFree.add("IT");
    }
    public void insertHeadInfo() {
        headInfo.add("전체");
        headInfo.add("소식통");
        headInfo.add("팁");
        headInfo.add("리뷰/후기");
    }
    public void insertHeadPr() {
        headPr.add("전체");
        headPr.add("스터디");
        headPr.add("프로젝트");
        headPr.add("기타");
    }
    public void insertHeadCode() {
        headCode.add("전체");
        headCode.add("백엔드");
        headCode.add("프론트엔드");
        headCode.add("기타");
    }

}



