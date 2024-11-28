package com.yash.ohd.test;

import com.yash.ohd.config.SpringRootConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

/**
 * @author Shaik Ismail
 */


public class TestDataSource {
        public static void main(String[] args) {
            ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
            DataSource ds = ctx.getBean(DataSource.class);
            JdbcTemplate jt = new JdbcTemplate(ds);

            // Corrected SQL statement with VALUES clause
            String sql = "INSERT INTO user(`name`, `phone`, `email`, `address`, `loginName`, `password`) VALUES (?, ?, ?, ?, ?, ?)";

            // Parameters to insert
            Object[] param = new Object[]{"shaik", "23676676676", "shaik@gmail.com", "bangalore", "as", "abc123"};

            // Execute the update
            jt.update(sql, param);

            System.out.println("--------SQL executed-------");
        }
    }
