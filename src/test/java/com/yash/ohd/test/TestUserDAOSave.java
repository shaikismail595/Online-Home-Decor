package com.yash.ohd.test;

import com.yash.ohd.config.SpringRootConfig;

import com.yash.ohd.dao.UserDAO;
import com.yash.ohd.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestUserDAOSave {
    public static void main(String[] args) {
        ApplicationContext ctx=new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDao=ctx.getBean(UserDAO.class);
        //the userv details will we be taken from user-reg-form
        User u=new User();
        u.setName("ismail");
        u.setPhone("645654565");
        u.setEmail("issu@gmail.com");
        u.setAddress("indore");
        u.setLoginName("is");
        u.setPassword("isi13");
        u.setRole(1);//Admin
        u.setLoginStatus(1);//Active
        userDao.save(u);
        System.out.println("------Data Saved------");
    }
}
