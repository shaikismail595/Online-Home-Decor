package com.yash.ohd.service;

import com.yash.ohd.domain.User;
import com.yash.ohd.exception.UserBlockedException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author :Shaik Ismail
 */

@Service
public interface UserService {

    public static final Integer LOGIN_STATUS_ACTIVE=1;
    public static final Integer LOGIN_STATUS_BLOCKED=2;

    public static final Integer ROLE_ADMIN=1;
    public static final Integer ROLE_USER=2;
    public static final Integer ROLE_VENDOR=3;


    /**
     * The method handle the user registration task.
     * @param u the new user detail as User Object.
     */
    public void register(User u);

    /**
     * The method handles login operation(authentication) using given credentials,
     * it returns User object when success and null when failed.
     * When user account is blocked an exception will be thrown by this method.
     * @param loginName
     * @param password
     * @return
     * @throws com.yash.ohd.exception.UserBlockedException When user account is  blocked.
     */
    public User login(String loginName, String password) throws UserBlockedException;

    /**
     * Call this method to get list of registered users.
     * @return
     */
    public List<User> getUserList();

    List<User> getVendorList();

    /**
     * This method change the user login status for details passed as argument.
     * @param userId
     * @param loginStatus
     */
    public void changeLoginStatus(Integer userId, Integer loginStatus);

    /**
     * Check the username availability.
     * @param username
     * @return
     */
    public Boolean isUsernameExist(String username);

}