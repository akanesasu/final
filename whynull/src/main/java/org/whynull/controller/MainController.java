package org.whynull.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.whynull.domain.criteria.MainCriteria;
import org.whynull.service.BoardService;

@Controller
@Log4j2
@RequiredArgsConstructor
public class MainController {
    private final BoardService service;

    @GetMapping("/main")
    public void main(MainCriteria cri, Model model) {
        model.addAttribute("list1", service.getMainList1(cri));
        model.addAttribute("list2", service.getMainList2(cri));
        model.addAttribute("list3", service.getMainList3(cri));
        model.addAttribute("list4", service.getMainList4(cri));
    }
}
