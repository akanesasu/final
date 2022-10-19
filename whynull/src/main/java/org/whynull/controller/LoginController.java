package org.whynull.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.whynull.domain.MemberDTO;
import org.whynull.service.MemberService;

@Controller
@Log4j2
@RequiredArgsConstructor
public class LoginController {
    private final MemberService service;

    @GetMapping("/error")
    public void accessDenied(Authentication auth, Model model) {
        log.info("access denied : " + auth);
        model.addAttribute("msg", "Access DENIED");
    }

    @GetMapping("/login")
    public void login(String error, String logout, Model model) {
        log.info("error : " + error);
        log.info("logout : " + logout);

        if (error != null) {
            model.addAttribute("error", "Login Error :: Check Your Account");
        }

        if (logout != null) {
            model.addAttribute("logout", "Logout");
        }
    }

    @GetMapping("/logout")
    public void logoutGET() {
        log.info("logout");
    }

    @PostMapping("/logout")
    public void logoutPOST() {
        log.info("post logout");
    }

    @GetMapping("/member/signin")
    public void signIn() {
        log.info("sign in");
    }

    @PostMapping("/member/signin")
    public String signInPOST(MemberDTO dto, RedirectAttributes rttr) {
        log.info("sign in : " + dto);
        service.signIn(dto);
        rttr.addFlashAttribute("result", dto.getUserId());
        return "redirect:/login";
    }
}
