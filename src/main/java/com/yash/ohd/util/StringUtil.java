package com.yash.ohd.util;

/**
 * @author :Shaik Ismail
 */

public class StringUtil {
    //converts an array of objects into a comma-separated string.
    public static String toCommaSeparatedString(Object[] items){
        StringBuilder sb = new StringBuilder();
        for (Object item : items) {
            sb.append(item).append(",");
        }
        if(sb.length()>0){
            sb.deleteCharAt(sb.length()-1);
        }
        return sb.toString();
    }
}