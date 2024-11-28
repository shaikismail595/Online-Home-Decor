package com.yash.ohd.test;

import com.yash.ohd.config.SpringRootConfig;
import com.yash.ohd.dao.UserDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestUserDAODelete {
    public static void main(String[] args) {
        ApplicationContext ctx=new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDao=ctx.getBean(UserDAO.class);
        userDao.delete(2);

        System.out.println("------Data Deleted------");
    }
}
