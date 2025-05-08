package com.osan.portal.service;

import java.util.List;
import java.util.Map;

import com.osan.portal.vo.AtendInfo;
import com.osan.portal.vo.AtendSearchInfo;

public interface AttendanceService {
	public Map srchAtendLectureList(AtendSearchInfo atendSearchInfo);
	
	public List<AtendInfo> srchAtendLectureTimeInfo(AtendSearchInfo atendSearchInfo);

	public List<AtendInfo> srchLectureAddInfoList(AtendSearchInfo atendSearchInfo);

	public List<AtendInfo> selectAtendLectureStdList(AtendInfo atendInfo , List<AtendInfo> resultLectureList, List<AtendInfo> addInfoList);

	public int srchPfsAtendStdUseCnt(AtendSearchInfo atendSearchInfo);

	public List<AtendInfo> selectAtendStatisResult(AtendSearchInfo atendSearchInfo);
	
	public AtendInfo srchAtendLectureInfo(AtendSearchInfo atendSearchInfo);
	
	public Map selectStdDefaultPhoto(String paramString);
	
	public int deleteAtendLectureEnd(AtendSearchInfo paramAtendSearchInfo);
	
	public int insertAtendLectureEnd(AtendSearchInfo paramAtendSearchInfo);

	public int selectCheckAtendStdCnt(AtendInfo atendInfo);

	public int updateCheckAtendStd(AtendInfo atendInfo);
	
	public int insertCheckAtendStd(AtendInfo atendInfo);
}

