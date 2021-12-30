package com.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BackendController {

	@GetMapping("/say/hello")
	public String sayHello() {
		return "Hello world";
	}
	
	@GetMapping("/say/hello/again")
	public String sayHelloAgain() {
		return "Hello world 2";
	}
}
