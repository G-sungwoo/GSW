package com.osan.portal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.osan.portal.vo.HomePageInfo;
import com.osan.portal.vo.LoginInfo;

public interface MainService {
	/*Ȩ������ ����*/
    public List<HomePageInfo> selectListHomepageUniNotice(LoginInfo loginInfo);
    /*Ȩ������ ����(����)*/
    public List<HomePageInfo> selectListHomepageIphakNotice(LoginInfo loginInfo);
    /*Ȩ������ ����(����)*/
    public List<HomePageInfo> selectListHomepageBidNotice(LoginInfo loginInfo);
    public List<HomePageInfo> selectListHomepageCoronaNotice(LoginInfo loginInfo);
    public List<HomePageInfo> selectListHomepageStudentNotice(LoginInfo loginInfo);
    /*�����ҽ�*/
    public List<HomePageInfo> selectListOsanUniNews(LoginInfo loginInfo);
    /*qna*/
    public List<HomePageInfo> selectListOsanUniQnA(LoginInfo loginInfo);
    /*���� �������(����)*/
    public int selectSignDocCnt(LoginInfo loginInfo);
    /*���� �������(����)*/
    public int selectPublicDocCnt(LoginInfo loginInfo);
    /*���� �������(����)*/
    public int selectInboxDocCnt(LoginInfo loginInfo);
    /*�������л� �Խ��� �� �Խñ� ��*/
    public int selectBoardArticleCnt(LoginInfo loginInfo);
    /*�������л� �Խ��� �Խñ� ����Ʈ*/
    public Map selectListBoardArticle(LoginInfo loginInfo, HttpServletRequest request);
    /*�л��*/
    public Map selectListAcademicSchedule(LoginInfo loginInfo);
    /*�������� ����*/
    public int updateUserInfo(LoginInfo loginInfo);
    /*�������� ����(�л�)*/
    public int updateStntUserInfo(LoginInfo loginInfo);
    /*��й�ȣ ����*/
    public int updateUserPassword(LoginInfo loginInfo);
    /*��й�ȣ ����(�л�)*/
    public int updateStntUserPassword(LoginInfo loginInfo);
    /*������ �˻� �� �����*/
    public int selectSearchWorkerCnt(LoginInfo loginInfo);
    /*������ �˻� ����Ʈ*/
    public Map selectListSearchWorker(LoginInfo loginInfo, HttpServletRequest request);
    /*���� ���� �б� ��ȸ*/
    public HomePageInfo selectSchpYearShtm();
    /*���ǽð�ǥ(����)*/
    public List<HomePageInfo> selectListLectTimetable(LoginInfo loginInfo);
    /*���ǽð�ǥ(�л�)*/
    public List<HomePageInfo> selectListLectTimetableForStnt(LoginInfo loginInfo);
    /*���ǰ�ȹ��*/
    public List<HomePageInfo> selectListLectPlan(LoginInfo loginInfo);
    /*���ǰ�ȹ��(�л�)*/
    public List<HomePageInfo> selectListLectPlanForStnt(LoginInfo loginInfo);
    /*�л�����(����)*/
    public Map selectStntPhoto(LoginInfo loginInfo);
    /*�л�����*/
    public HomePageInfo selectStntInfo(LoginInfo loginInfo);
    /*��ϱ� ��Ȳ*/
    public List<HomePageInfo> selectListLesnAmnt(LoginInfo loginInfo);
    /*���б� ��Ȳ*/
    public List<HomePageInfo> selectListShshAmnt(LoginInfo loginInfo);
    /*������ȸ(��ü)*/
    public HomePageInfo selectTotalGrad(LoginInfo loginInfo);
    /*������ȸ(�б�)*/
    public List<HomePageInfo> selectListShtmGrad(LoginInfo loginInfo);
    /*������ȸ(����)*/
    public Map selectListSubjectGrad(LoginInfo loginInfo);
    /*������ȸ(������ �ִ� ���� ��ȸ)*/
    public List<HomePageInfo> selectListGradYear(LoginInfo loginInfo);
    /*ä�����(����ä������)*/
    public List<HomePageInfo> selectListJob();
    /*ä�����(�Ƹ�����Ʈ)*/
    public List<HomePageInfo> selectListParttimeJob();
    /*����������*/
    public List<HomePageInfo> selectListRentBook(LoginInfo loginInfo);
    
	public void updateregiInfo(LoginInfo loginInfo);
	
	public String getClientIpAddr(HttpServletRequest request);
	
	public int updatezeroregi(LoginInfo loginInfo);
}
