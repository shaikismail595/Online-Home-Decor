package com.yash.ohd.command;

import com.yash.ohd.domain.User;

/**
 * @author :Shaik Ismail
 */

public class UserCommand {
    //Automatically binding form data to Java objects Moving data between view and controller
    User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}