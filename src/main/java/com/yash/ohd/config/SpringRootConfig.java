package com.yash.ohd.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * @author :Shaik Ismail
 */

@Configuration
@ComponentScan(basePackages = {"com.yash.capp.dao","com.yash.capp.service"})
public class SpringRootConfig {
    @Bean
    public BasicDataSource getDataSource(){
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/homedecordb");
        ds.setUsername("root");
        ds.setPassword("root");
        ds.setMaxTotal(2);
        ds.setInitialSize(1);
        ds.setTestOnBorrow(true);
        ds.setValidationQuery("SELECT 1");
        ds.setDefaultAutoCommit(true);
        return ds;
    }

    @Bean
    public JdbcTemplate jdbcTemplate(BasicDataSource basicDataSource) {
        return new JdbcTemplate(basicDataSource);
    }
}
