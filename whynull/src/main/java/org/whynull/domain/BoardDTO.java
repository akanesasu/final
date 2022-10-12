package org.whynull.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class BoardDTO {
    private Long post_num;
    private Long board_num;
    private String subject_content;
    private Date writing_date;
    private String mem_id;
    private Long post_view_count;
    private String post_title;
    private String post_content;

    private List<WriteDTO> filesList;
}
