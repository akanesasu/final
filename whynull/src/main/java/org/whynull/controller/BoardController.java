package org.whynull.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.whynull.domain.BoardDTO;
import org.whynull.domain.ReplyDTO;
import org.whynull.domain.criteria.Criteria;
import org.whynull.domain.WriteDTO;
import org.whynull.domain.PageDTO;
import org.whynull.domain.criteria.HeadListCriteria;
import org.whynull.domain.criteria.ReplyCriteria;
import org.whynull.service.BoardService;
import org.whynull.service.ReplyService;

import java.util.List;

@Controller
@Log4j2
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {
    private final BoardService service;

    @GetMapping("/list")
    public void list(Criteria cri, Model model) {
        log.info("list // Criteria : " + cri);
        model.addAttribute("headList", service.getHeadList(cri));
        model.addAttribute("list", service.getList(cri));
        int total = service.getTotal(cri);
        model.addAttribute("page", new PageDTO(cri, total));
    }

    @GetMapping("/write")
    public void write(HeadListCriteria cri, Model model) {
        model.addAttribute("headList", service.getWriteHeadList(cri));
    }

    @PostMapping("/write")
    public String write(BoardDTO dto, RedirectAttributes rttr) {
        log.info("write : " + dto);
        service.write(dto);
        rttr.addFlashAttribute("result", dto.getPost_num());
        return "redirect:/board/list?boardNum=" + dto.getBoardNum() + "&pageNum=1";
    }

    @GetMapping("/read")
    public void read(@RequestParam("boardNum") Long board_num, @RequestParam("postNum") Long post_num, Model model) {
        log.info("/read");
        service.viewCount(board_num, post_num);
        model.addAttribute("read", service.read(board_num, post_num));
    }

    @GetMapping("/edit")
    public void edit(@RequestParam("boardNum") Long board_num, @RequestParam("postNum") Long post_num, HeadListCriteria cri, Model model) {
        log.info("/edit");
        model.addAttribute("read", service.read(board_num, post_num));
        model.addAttribute("headList", service.getWriteHeadList(cri));
    }

    @PostMapping("/edit")
    @PreAuthorize("principal.username == #mem_id")
    public String edit(BoardDTO dto, RedirectAttributes rttr) {
        log.info("edit : " + dto);
        if (service.edit(dto)) {
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/board/read?boardNum=" + dto.getBoardNum() + "&postNum=" + dto.getPost_num();
    }

    @PostMapping("/delete")
    @PreAuthorize("principal.username == #mem_id")
    public String delete(BoardDTO dto, RedirectAttributes rttr) {
        log.info("delete : " + dto.getPost_num());
        if (service.delete(dto)) {
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:/board/list?boardNum=" + dto.getBoardNum() + "&pageNum=1";
    }

    @GetMapping(value="/getContentList", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<WriteDTO>> getContentList(Long board_num, Long post_num) {
        log.info("getContentList : " + post_num);
        return new ResponseEntity<>(service.getContentList(board_num, post_num), HttpStatus.OK);
    }
}
