package com.example.deploybl_spring_demo.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping()
public class IndexController {
    @GetMapping()
    public String Index(){
        return "Deploybl Demo Spring Boot App Is Running...";
    }
}
