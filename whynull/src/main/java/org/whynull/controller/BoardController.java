package org.whynull.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.whynull.domain.BoardDTO;
import org.whynull.domain.Criteria;
import org.whynull.domain.PageDTO;
import org.whynull.service.BoardService;

@Controller
@Log4j2
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {
    private final BoardService service;

    @GetMapping("/board_free")
    public void list(Criteria cri, Model model) {
        log.info("list // Criteria : " + cri);
        model.addAttribute("board_free", service.getList(cri));
        int total = service.getTotal(cri);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
    }

    @GetMapping("/write")
    public void write() {
    }

    @PostMapping("/write")
    public String write(BoardDTO dto, RedirectAttributes rttr) {
        log.info("write : " + dto);
        service.write(dto);
        rttr.addFlashAttribute("result", dto.getPost_num());
        return "redirect:/board/list";
    }

    @GetMapping({"/read", "/edit"})
    public void read(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("/read or /edit");
        model.addAttribute("board", service.read(bno));
    }
}
