package com.osan.portal.utils;

import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class AESUtil {
	  private static final String ENCRYPTION_KEY = "Syworks1004WjhStarR";
	  private static final String ENCRYPTION_IV = "4e5Wa71fYoT7MFEF";
	  
	  public static String encrypt(String src)
	  {
	    try
	    {
	      Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	      cipher.init(1, makeKey(), makeIv());
	      return Base64.getEncoder().encodeToString(cipher.doFinal(src.getBytes("UTF-8")));
	    }
	    catch (Exception e)
	    {
	      throw new RuntimeException(e);
	    }
	  }
	  
	  static AlgorithmParameterSpec makeIv()
	  {
	    try
	    {
	      return new IvParameterSpec("4e5Wa71fYoT7MFEF".getBytes("UTF-8"));
	    }
	    catch (UnsupportedEncodingException e)
	    {
	      e.printStackTrace();
	    }
	    return null;
	  }
	  
	  static Key makeKey()
	  {
	    try
	    {
	      MessageDigest md = MessageDigest.getInstance("SHA-256");
	      byte[] key = md.digest("Syworks1004WjhStarR".getBytes("UTF-8"));
	      return new SecretKeySpec(key, "AES");
	    }
	    catch (NoSuchAlgorithmException e)
	    {
	      e.printStackTrace();
	    }
	    catch (UnsupportedEncodingException e)
	    {
	      e.printStackTrace();
	    }
	    return null;
	  }
	  
	  public static String decrypt(String src)
	  {
	    String decrypted = "";
	    try
	    {
	      Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	      cipher.init(2, makeKey(), makeIv());
	      decrypted = new String(cipher.doFinal(Base64.getDecoder().decode(src)));
	    }
	    catch (Exception e)
	    {
	      throw new RuntimeException(e);
	    }
	    return decrypted;
	  }

}
