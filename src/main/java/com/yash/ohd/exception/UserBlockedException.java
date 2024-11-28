package com.yash.ohd.exception;
/**
 * @author :Shaik Ismail
 */

public class UserBlockedException extends Exception{
    /**
     * Creates User object without error description.
     */
    public UserBlockedException() {
    }
    /**
     * Creates User object with error description.
     */
    public UserBlockedException(String errDesc) {
        super(errDesc);
    }
}