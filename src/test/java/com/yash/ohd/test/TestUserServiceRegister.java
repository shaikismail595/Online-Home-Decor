package com.yash.ohd.test;

import com.yash.ohd.config.SpringRootConfig;
import com.yash.ohd.domain.User;
import com.yash.ohd.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestUserServiceRegister {
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserService userService = ctx.getBean(UserService.class);

        // The user details will be taken from user-reg-form
        User u = new User();
        u.setName("harsh");
        u.setPhone("9876673765");
        u.setEmail("harsh@gmail.com");
        u.setAddress("patna");
        u.setLoginName("hs");
        u.setPassword("hsi13");
        u.setRole(UserService.ROLE_ADMIN); // Admin role
        u.setLoginStatus(UserService.LOGIN_STATUS_ACTIVE); // Active status

        userService.register(u);
        System.out.println("------ USER REGISTERED SUCCESSFULLY------");
    }
}
