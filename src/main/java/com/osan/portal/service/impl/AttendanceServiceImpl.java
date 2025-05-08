package com.osan.portal.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.osan.portal.service.AttendanceService;
import com.osan.portal.vo.AtendInfo;
import com.osan.portal.vo.AtendSearchInfo;

@Repository
public class AttendanceServiceImpl implements AttendanceService{
	
	/*포탈, 종합정보시스템 oracle 접속*/
	@Autowired
    @Resource(name="sqlSession1")
    private SqlSession osanPortalSql;
	
	public Map srchAtendLectureList(AtendSearchInfo atendSearchInfo){
    	Map resultObject = new HashMap();
    	List list = new ArrayList();
    	list = osanPortalSql.selectList("srchAtendLectureList", atendSearchInfo);
    	resultObject.put("resultAtendLectureList", list);
    	return resultObject;
	}
	
	public List<AtendInfo> srchAtendLectureTimeInfo(AtendSearchInfo atendSearchInfo) {
		List<AtendInfo> atendInfoList = osanPortalSql.selectList("srchAtendLectureTimeInfo", atendSearchInfo);
		return atendInfoList;
	}
	
	public List<AtendInfo> srchLectureAddInfoList(AtendSearchInfo atendSearchInfo) {
		List<AtendInfo> atendInfoList = osanPortalSql.selectList("srchLectureAddInfoList", atendSearchInfo);
		return atendInfoList;
	}

	public List<AtendInfo> selectAtendLectureStdList(AtendInfo info ,List<AtendInfo> resultLectureList, List<AtendInfo> addInfoList) {
		List<AtendInfo> result = osanPortalSql.selectList("selectAtendLectureStdList", info);
	    int result2 = addInfoList.size();
	    for (int i = 0; i < result.size(); i++)
	    {
	      AtendInfo param = (AtendInfo)result.get(i);
	      int time = Integer.parseInt(((AtendInfo)result.get(0)).getLecture_time());
	      List<AtendInfo> detail = osanPortalSql.selectList("srchAtendStdDetailList", param);
	      String[][][] atend = new String[50][time][1];
	      
	      int no = 0;
	      int week = 0;
	      String status = "";
	      if (detail != null)
	      {
	        System.out.println("==============" + detail.size() + "=============");
	        if (detail.size() == 1)
	        {
	          for (int ii = 0; ii < detail.size(); ii++)
	          {
	            no = Integer.parseInt(((AtendInfo)detail.get(ii)).getAtend_no());
	            week = Integer.parseInt(((AtendInfo)detail.get(ii)).getWeek_atend_no());
	            if (week > 15) {
	              week = 1;
	            }
	            String tmpStatus = ((AtendInfo)detail.get(ii)).getWeek_atend_status();
	            if (tmpStatus == null) {
	              tmpStatus = "0";
	            }
	            status = ((AtendInfo)detail.get(ii)).getWeek_atend_status_name();
	            atend[(week - 1)][0][0] = status;
	            ((AtendInfo)result.get(i)).setAtend_cmmt(((AtendInfo)detail.get(ii)).getAtend_cmmt());
	          }
	        }
	        else
	        {
	          int time_no = 1;
	          for (int ii = 0; ii < detail.size(); ii++)
	          {
	            no = Integer.parseInt(((AtendInfo)detail.get(ii)).getAtend_no());
	            week = Integer.parseInt(((AtendInfo)detail.get(ii)).getWeek_atend_no());
	            String tmpStatus = ((AtendInfo)detail.get(ii)).getWeek_atend_status();
	            if (tmpStatus == null) {
	              tmpStatus = "0";
	            }
	            status = ((AtendInfo)detail.get(ii)).getWeek_atend_status_name();
	            if (time_no % time == 0) {
	              time_no = 1;
	            }
	            String gyosi = ((AtendInfo)detail.get(ii)).getTime_no();
	            String week_atend_no = ((AtendInfo)detail.get(ii)).getWeek_atend_no();
	            String lectDday = ((AtendInfo)detail.get(ii)).getLect_dday();
	            int resultTimeNo = 0;
	            int tempNo = 0;
	            String[] indexTimeNo = new String[time];
	            String[] indexLectDdayNo = new String[time];
	            
	            String[] indexAddWeekAtendNo = new String[result2];
	            String[] indexAddLectDdayNo = new String[result2];
	            for (int iii = 0; iii < resultLectureList.size(); iii++)
	            {
	              String originGyosi = ((AtendInfo)resultLectureList.get(iii)).getFrom_lttm();
	              String originLectDday = ((AtendInfo)resultLectureList.get(iii)).getLect_dday();
	              indexTimeNo[iii] = originGyosi;
	              indexLectDdayNo[iii] = originLectDday;
	              tempNo++;
	            }
	            System.out.println("=============addInfoList.size() : =" + addInfoList.size() + "============");
	            for (int z = 0; z < addInfoList.size(); z++)
	            {
	              String addWeekAtendNo = ((AtendInfo)addInfoList.get(z)).getNo();
	              String originLectDday2 = ((AtendInfo)addInfoList.get(z)).getLect_dday();
	              indexAddWeekAtendNo[z] = addWeekAtendNo;
	              indexAddLectDdayNo[z] = originLectDday2;
	            }
	            for (int iiii = 0; iiii < indexTimeNo.length; iiii++) {
	              if ((indexTimeNo[iiii].equals(gyosi)) && (indexLectDdayNo[iiii].equals(lectDday)) && (week < 16))
	              {
	                System.out.println("===week : " + week + "==========indexTimeNo : " + indexTimeNo[iiii] + "============gyosi : " + gyosi + "===========lectDday : " + lectDday);
	                resultTimeNo = iiii;
	                atend[(week - 1)][resultTimeNo][0] = status;
	                
	                break;
	              }
	            }
	            for (int j = 0; j < indexAddWeekAtendNo.length; j++) {
	              if ((indexAddWeekAtendNo[j].equals(week_atend_no)) && (indexAddLectDdayNo[j].equals(lectDday)))
	              {
	                System.out.println("===week : " + week + "==========indexAddWeekAtendNo : " + indexAddWeekAtendNo[j] + "============gyosi : " + week_atend_no + "===========lectDday : " + lectDday);
	                atend[(week - 1)][0][0] = status;
	              }
	            }
	            ((AtendInfo)result.get(i)).setAtend_cmmt(((AtendInfo)detail.get(ii)).getAtend_cmmt());
	          }
	        }
	      }
	      ((AtendInfo)result.get(i)).setAtend_detail(atend);
	    }
		return result;
	}
	
	public int srchPfsAtendStdUseCnt(AtendSearchInfo atendSearchInfo) {
		int result = 0;
		result = osanPortalSql.selectOne("srchPfsAtendStdUseCnt", atendSearchInfo);
		return result;
	}
	
	public List<AtendInfo> selectAtendStatisResult(AtendSearchInfo atendSearchInfo) {
		List<AtendInfo> atendInfoList = osanPortalSql.selectList("selectAtendStatisResult", atendSearchInfo);
		return atendInfoList;
	}
	
	public AtendInfo srchAtendLectureInfo(AtendSearchInfo atendSearchInfo) {
		AtendInfo atendInfo = osanPortalSql.selectOne("srchAtendLectureInfo", atendSearchInfo);
		return atendInfo;
	}

	public Map selectStdDefaultPhoto(String paramString) {
		Map photoInfo = osanPortalSql.selectOne("selectStdDefaultPhoto", paramString);
		return photoInfo;
	}
	
	public int deleteAtendLectureEnd(AtendSearchInfo paramAtendSearchInfo) {
		int result = osanPortalSql.delete("deleteAtendLectureEnd", paramAtendSearchInfo);
		return result;
	}

	public int insertAtendLectureEnd(AtendSearchInfo paramAtendSearchInfo) {
		int result = osanPortalSql.insert("insertAtendLectureEnd", paramAtendSearchInfo);
		if(result> 0) {
			osanPortalSql.update("procedureAtendLectureEnd",paramAtendSearchInfo);
		}
		return result;
	}
	
	public int selectCheckAtendStdCnt(AtendInfo atendInfo) {
		int result = osanPortalSql.selectOne("selectCheckAtendStdCnt", atendInfo);
		return result;
	}
	
	public int updateCheckAtendStd(AtendInfo atendInfo) {
		int result = osanPortalSql.update("updateCheckAtendStd", atendInfo);
		return result;
	}

	public int insertCheckAtendStd(AtendInfo atendInfo) {
		int result = osanPortalSql.insert("insertCheckAtendStd", atendInfo);
		return result;
	}
}
