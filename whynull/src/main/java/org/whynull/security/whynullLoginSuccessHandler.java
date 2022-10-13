package org.whynull.security;

import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Log4j2
public class whynullLoginSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
        log.warn("Login Success");
        List<String> roleNames = new ArrayList<>();

        auth.getAuthorities().forEach(authority -> {
            roleNames.add(authority.getAuthority());
        });

        log.warn("Role names : " + roleNames);
        if (roleNames.contains("ADMIN")) {
            response.sendRedirect("/whynull/main");
            return;
        }
        if (roleNames.contains("MEMBER")) {
            response.sendRedirect("/whynull/main");
            return;
        }

        response.sendRedirect("/whynull");

    }
}
