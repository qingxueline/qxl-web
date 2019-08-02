package com.qingxueline.web.biz;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
/**
 * @author lyl
 */
@RestController
@RequestMapping(value = "/api/user")
public class UserController {
    @RequestMapping("/say")
    public String say() {
        return "Say Hello000";
    }
}
