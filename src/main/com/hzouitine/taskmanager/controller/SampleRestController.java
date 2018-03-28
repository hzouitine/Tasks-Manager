package com.hzouitine.taskmanager.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SampleRestController {
    @RequestMapping("/")
    String home(){
        return "Hello world";
    }
}
