/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package register;

import java.io.IOException;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 *
 * @author Alex
 */
public class base64Encoder {
    private static Random rand = new Random(new Date().getTime());
    public static String encrypt(String toEncode)
    {
        BASE64Encoder encoder = new BASE64Encoder();
        byte[] salt = new byte[8];
        //Send the salt to the database
        //I think I'm dumb :(
        //String sql = "INSERT INTO users VALUES ";
        //new SQLConnector().insertValues(sql);
        
        rand.nextBytes(salt);
        //return encoder.encode(salt)+encoder.encode(toEncrypt.getBytes());
        return encoder.encode(toEncode.getBytes());
        
    }
    
    public static String decrypt(String toDecrypt) 
    {
        if(toDecrypt.length()>12)
        {
            String cipher = toDecrypt.substring(12);
            BASE64Decoder decoder = new BASE64Decoder();
            try {
                return new String(decoder.decodeBuffer(cipher));
            } catch (IOException ex) {
                Logger.getLogger(base64Encoder.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
}
