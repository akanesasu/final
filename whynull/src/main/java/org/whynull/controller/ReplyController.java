package org.whynull.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.whynull.domain.ReplyDTO;
import org.whynull.service.ReplyService;

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
}
