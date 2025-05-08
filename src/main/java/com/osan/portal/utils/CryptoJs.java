package com.osan.portal.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Random;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;

public class CryptoJs
{
  private static String passwrd = "Syworks1004WjhStarR";
  
  public static String encrypt(String ciphertext)
  {
    return encrypt(ciphertext, passwrd);
  }
  
  public static String decrypt(String ciphertext)
  {
    return decrypt(ciphertext, passwrd);
  }
  
  public static String encrypt(String plaintext, String passphrase)
  {
    try
    {
      int keySize = 256;
      int ivSize = 128;
      
      byte[] key = new byte[32];
      byte[] iv = new byte[16];
      
      byte[] saltBytes = generateSalt(8);
      
      EvpKDF(passphrase.getBytes("UTF-8"), 256, 128, saltBytes, key, iv);
      
      Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
      cipher.init(1, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
      byte[] cipherBytes = cipher.doFinal(plaintext.getBytes("UTF-8"));
      byte[] sBytes = "Salted__".getBytes("UTF-8");
      byte[] b = new byte[sBytes.length + saltBytes.length + cipherBytes.length];
      System.arraycopy(sBytes, 0, b, 0, sBytes.length);
      System.arraycopy(saltBytes, 0, b, sBytes.length, saltBytes.length);
      System.arraycopy(cipherBytes, 0, b, sBytes.length + saltBytes.length, cipherBytes.length);
      
      byte[] base64b = Base64.encodeBase64(b);
      
      return new String(base64b);
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    return null;
  }
  
  private static byte[] generateSalt(int length)
  {
    Random r = new SecureRandom();
    byte[] salt = new byte[length];
    r.nextBytes(salt);
    return salt;
  }
  
  public static String decrypt(String ciphertext, String passphrase)
  {
    try
    {
      int keySize = 256;
      int ivSize = 128;
      
      byte[] ctBytes = Base64.decodeBase64(ciphertext.getBytes("UTF-8"));
      
      byte[] saltBytes = Arrays.copyOfRange(ctBytes, 8, 16);
      
      byte[] ciphertextBytes = Arrays.copyOfRange(ctBytes, 16, ctBytes.length);
      
      byte[] key = new byte[32];
      byte[] iv = new byte[16];
      
      EvpKDF(passphrase.getBytes("UTF-8"), 256, 128, saltBytes, key, iv);
      
      Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
      cipher.init(2, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
      byte[] recoveredPlaintextBytes = cipher.doFinal(ciphertextBytes);
      
      return new String(recoveredPlaintextBytes);
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    return null;
  }
  
  private static byte[] EvpKDF(byte[] password, int keySize, int ivSize, byte[] salt, byte[] resultKey, byte[] resultIv)
    throws NoSuchAlgorithmException
  {
    return EvpKDF(password, keySize, ivSize, salt, 1, "MD5", resultKey, resultIv);
  }
  
  private static byte[] EvpKDF(byte[] password, int keySize, int ivSize, byte[] salt, int iterations, String hashAlgorithm, byte[] resultKey, byte[] resultIv)
    throws NoSuchAlgorithmException
  {
    keySize /= 32;
    ivSize /= 32;
    int targetKeySize = keySize + ivSize;
    byte[] derivedBytes = new byte[targetKeySize * 4];
    int numberOfDerivedWords = 0;
    byte[] block = null;
    MessageDigest hasher = MessageDigest.getInstance(hashAlgorithm);
    while (numberOfDerivedWords < targetKeySize)
    {
      if (block != null) {
        hasher.update(block);
      }
      hasher.update(password);
      
      block = hasher.digest(salt);
      hasher.reset();
      for (int i = 1; i < iterations; i++)
      {
        block = hasher.digest(block);
        hasher.reset();
      }
      System.arraycopy(block, 0, derivedBytes, numberOfDerivedWords * 4, Math.min(block.length, (targetKeySize - numberOfDerivedWords) * 4));
      numberOfDerivedWords += block.length / 4;
    }
    System.arraycopy(derivedBytes, 0, resultKey, 0, keySize * 4);
    System.arraycopy(derivedBytes, keySize * 4, resultIv, 0, ivSize * 4);
    return derivedBytes;
  }
}

