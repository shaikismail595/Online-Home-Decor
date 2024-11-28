package com.yash.ohd.test;


import com.yash.ohd.config.SpringRootConfig;
import com.yash.ohd.dao.UserDAO;
import com.yash.ohd.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestUserDAOUpdate {
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDao = ctx.getBean(UserDAO.class);
        //the user details will be taken from update user profile page
        User u = new User();
        u.setUserId(1);
        u.setName("ismail Hidayath ");
        u.setPhone("6456265443");
        u.setEmail("issu.hidayath@gmail.com");
        u.setAddress("indore, Ind");
        u.setRole(2);//Admin
        u.setLoginStatus(2);//Active

        userDao.update(u);
        System.out.println("------updated successfully------");
    }
}