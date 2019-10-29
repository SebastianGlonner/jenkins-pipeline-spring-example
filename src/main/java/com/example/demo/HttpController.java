package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HttpController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "works 133";
    }
}
