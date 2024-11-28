package com.yash.ohd.test;

import com.yash.ohd.config.SpringRootConfig;
import com.yash.ohd.dao.UserDAO;
import com.yash.ohd.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

public class TestUserDAOFindAllByProp {
    public static void main(String[] args) {
        ApplicationContext ctx=new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDao=ctx.getBean(UserDAO.class);

        List<User> users = userDao.findByProperty("userId",1);
        for (User u :users){
            System.out.println(u.getUserId()+" "+u.getName()+" "+u.getPhone()+" "+u.getEmail()+" "+u.getAddress()+" "+u.getLoginName());
        }
    }
}
