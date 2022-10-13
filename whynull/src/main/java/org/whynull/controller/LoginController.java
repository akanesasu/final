package org.whynull.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/member/*")
public class LoginController {
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
        log.info("whynull logout");
    }

    @PostMapping("/logout")
    public void logoutPOST() {
        log.info("post whynull logout");
    }
}
