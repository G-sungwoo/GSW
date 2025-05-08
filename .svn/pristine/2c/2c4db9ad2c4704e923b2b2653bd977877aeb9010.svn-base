package com.osan.portal.service;

import com.osan.portal.vo.LoginInfo;

public interface LoginService {
	/*����� ���� ��ȸ*/
    public LoginInfo selectUser(LoginInfo loginInfo);
    
    public LoginInfo selectUserWithPassword(LoginInfo loginInfo);
    /*��й�ȣ ��ȣȭ*/
    public String selectEncPassword(LoginInfo loginInfo);
    /*sms������ȣ ����*/
    public int selelctRandomNumber(int length);
    /*sms������ȣ ����*/
    public int insertVerifySms(LoginInfo loginInfo);
    /*sms������ȣ �߼�*/
    public int insertSentVerifyNumber(LoginInfo loginInfo);
    /*sms������ȣ Ȯ��*/
    public int selectOneVerifyNumberCheck(LoginInfo loginInfo);
    /*����� ID Ȯ��*/
    public LoginInfo selectOneUserNo(LoginInfo loginInfo);
    /*�ӽ� ��й�ȣ ����*/
    public String selelctTempPassword();
    /*�ӽ� ��й�ȣ �߼�*/
    public int insertTempPassword(LoginInfo loginInfo);
	/*����� ���� ��ȸ(��й�ȣ ã��)*/
    public LoginInfo selectUserForFindPassword(LoginInfo loginInfo);
    /*��й�ȣ ����Ƚ�� ����(������)*/
    public int updateUserWrongPasswordCnt(LoginInfo loginInfo);
    /*��й�ȣ ����Ƚ�� ����(�л�)*/
    public int updateStntUserWrongPasswordCnt(LoginInfo loginInfo);
    /*�α��� �̷� ����*/
    public int insertLoginInfo(LoginInfo loginInfo);
}
