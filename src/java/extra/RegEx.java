/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package extra;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Alex
 */
public class RegEx {
    public static String checkRegex(String check, String regex)
    {
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(check);
        m.matches();
        return m.group(1);
    }
}
