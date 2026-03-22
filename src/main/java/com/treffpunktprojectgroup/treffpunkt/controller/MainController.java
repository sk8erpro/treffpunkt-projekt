package com.treffpunktprojectgroup.treffpunkt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    // Kullanıcı direkt localhost:8080 yazdığında login sayfasına gitsin
    @GetMapping("/")
    public String redirectToLogin() {
        return "login"; 
    }

    // Ayrıca /login yazınca da aynı sayfa gelsin
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }
}