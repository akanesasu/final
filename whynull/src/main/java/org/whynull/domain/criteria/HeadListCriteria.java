package org.whynull.domain.criteria;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class HeadListCriteria {
    private Long boardNum;

    private String head;
    private List<String> headFree = new ArrayList<>();
    private List<String> headInfo = new ArrayList<>();
    private List<String> headPr = new ArrayList<>();
    private List<String> headCode = new ArrayList<>();

    public HeadListCriteria(Long boardNum) {
        this.boardNum = boardNum;
    }

    public void insertHeadFree() {
        headFree.add("일반");
        headFree.add("질문");
        headFree.add("IT");
    }
    public void insertHeadInfo() {
        headInfo.add("소식통");
        headInfo.add("팁");
        headInfo.add("리뷰/후기");
    }
    public void insertHeadPr() {
        headPr.add("스터디");
        headPr.add("프로젝트");
        headPr.add("기타");
    }
    public void insertHeadCode() {
        headCode.add("백엔드");
        headCode.add("프론트엔드");
        headCode.add("기타");
    }
}
