package com.yash.ohd.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;

import javax.sql.DataSource;

/**
 * @author :Shaik Ismail
 */


abstract public class BaseDAO extends NamedParameterJdbcDaoSupport {


    /**
     * This is an abstract base class that other DAO classes can extend to inherit common database functionality
     * It uses Spring's JDBC support for database operations through NamedParameterJdbcDaoSupport
     */



    @Autowired
    public void setDataSource2(DataSource ds){
        super.setDataSource(ds);
    }


}