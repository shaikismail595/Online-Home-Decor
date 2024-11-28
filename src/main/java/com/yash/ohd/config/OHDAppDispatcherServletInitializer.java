package com.yash.ohd.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

/**
 * @author :Shaik Ismail
 */

public class OHDAppDispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {


     // Business layer
    @Override
    protected Class<?>[] getRootConfigClasses()
    {

        return new Class[]{SpringRootConfig.class};
    }

    //Web layer
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{SpringWebConfig.class};
    }

    //Front controller
    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        super.onStartup(servletContext); //must present to configure the globle object required
    }
}