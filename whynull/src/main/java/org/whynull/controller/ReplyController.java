package org.whynull.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.whynull.domain.ReplyDTO;
import org.whynull.domain.ReplyPageDTO;
import org.whynull.domain.criteria.Criteria;
import org.whynull.domain.criteria.ReplyCriteria;
import org.whynull.service.ReplyService;

import java.util.List;

@RestController
@RequestMapping("/reply/*")
@Log4j2
@RequiredArgsConstructor
public class ReplyController {
    private final ReplyService service;

    @PostMapping(value="/new", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity<String> create(@RequestBody ReplyDTO dto) {
        log.info("ReplyDTO : " + dto);
        int insertCount = service.write(dto);
        log.info("Reply insert count : " + insertCount);
        return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping(value = "/pages/{boardNum}/{postNum}/{pageNum}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ReplyPageDTO> getList(
            @PathVariable("boardNum") Long boardNum,
            @PathVariable("pageNum") int pageNum,
            @PathVariable("postNum") Long postNum,
            ReplyDTO dto) {
        log.info("Get List =================================== ");
        ReplyCriteria cri = new ReplyCriteria(pageNum);
        log.info(cri);
        dto.setBoardNum(boardNum);
        dto.setPostNum(postNum);
        return new ResponseEntity<>(service.getListPage(cri, dto), HttpStatus.OK);
    }

    @GetMapping(value = "/{boardNum}/{postNum}/{replyNum}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ReplyDTO> read(
            @PathVariable("boardNum") String boardNum,
            @PathVariable("postNum") String postNum,
            @PathVariable("replyNum") Long replyNum,
            ReplyDTO dto) {
        log.info("Read Reply : " + replyNum);
        dto.setReplyNum(replyNum);
        dto.setPostNum(Long.parseLong(postNum));
        dto.setBoardNum(Long.parseLong(boardNum));
        return new ResponseEntity<>(service.get(dto), HttpStatus.OK);
    }

    @DeleteMapping(value="/{boardNum}/{postNum}/{replyNum}", produces = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity<String> remove(
            @PathVariable("boardNum") String boardNum,
            @PathVariable("postNum") String postNum,
            @PathVariable("replyNum") Long replyNum,
            ReplyDTO dto) {
        log.info("Remove Reply : " + replyNum);
        dto.setReplyNum(replyNum);
        dto.setPostNum(Long.parseLong(postNum));
        dto.setBoardNum(Long.parseLong(boardNum));
        return service.remove(dto) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @PostMapping(value = "/{boardNum}/{postNum}/{replyNum}", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity<String> modify(
            @RequestBody ReplyDTO dto,
            @PathVariable("boardNum") String boardNum,
            @PathVariable("postNum") String postNum,
            @PathVariable("replyNum") Long replyNum) {
        log.info("replyNum : " + replyNum);
        dto.setReplyNum(replyNum);
        dto.setPostNum(Long.parseLong(postNum));
        dto.setBoardNum(Long.parseLong(boardNum));
        log.info("Modify Reply : " + dto);
        return service.modify(dto) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }


}
