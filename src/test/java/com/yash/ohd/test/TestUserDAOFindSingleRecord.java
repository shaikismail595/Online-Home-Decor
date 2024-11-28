package com.yash.ohd.test;

import com.yash.ohd.config.SpringRootConfig;
import com.yash.ohd.dao.UserDAO;
import com.yash.ohd.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestUserDAOFindSingleRecord {
    public static void main(String[] args) {
        ApplicationContext ctx=new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDao=ctx.getBean(UserDAO.class);
        User u = userDao.findById(3);
        System.out.println("----------User Details-----------");
        System.out.println(u.getUserId());
        System.out.println(u.getName());
        System.out.println(u.getPhone());
        System.out.println(u.getEmail());
        System.out.println(u.getAddress());
        System.out.println(u.getLoginName());
        System.out.println(u.getLoginStatus());

    }
}
