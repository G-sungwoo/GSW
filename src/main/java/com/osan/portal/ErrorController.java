package com.osan.portal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/error")
public class ErrorController {
    private static Logger logger = LoggerFactory.getLogger(ErrorController.class);
	
    @RequestMapping(value="/throwable")
    public String throwable(HttpServletRequest request, Model model) {
    	logger.info("throwable 발생하였습니다.");
    	pageErrorLog(request);
    	model.addAttribute("msg", "서버에 오류가 발생하였습니다.");
    	return "/error";
    }
    
    @RequestMapping(value="/exception")
    public String exception(HttpServletRequest request, Model model) {
    	logger.info("exception 발생하였습니다.");
    	pageErrorLog(request);
    	model.addAttribute("msg", "서버에 오류가 발생하였습니다.");
    	return "/error";
    }

    @RequestMapping(value="/404")
    public String pageError404(HttpServletRequest request, Model model) {
        logger.info("404 에러 발생하였습니다.");
        pageErrorLog(request);
        model.addAttribute("msg", "요청하신 페이지는 존재하지 않습니다.");
        return "/error";
    }
    
    @RequestMapping(value="/500")
    public String pageError500(HttpServletRequest request, Model model) {
        logger.info("500 에러 발생하였습니다.");
        pageErrorLog(request);
        model.addAttribute("msg", "세션이 종료되었습니다.");
        return "/index";
    }
    
    private void pageErrorLog(HttpServletRequest request) {
        logger.info("status_code    : " + request.getAttribute("javax.servlet.error.status_code"));
        logger.info("exception_type : " + request.getAttribute("javax.servlet.error.exception_type"));
        logger.info("message        : " + request.getAttribute("javax.servlet.error.message"));
        logger.info("request_uri    : " + request.getAttribute("javax.servlet.error.request_uri"));
        logger.info("exception      : " + request.getAttribute("javax.servlet.error.exception"));
        logger.info("servlet_name   : " + request.getAttribute("javax.servlet.error.servlet_name"));
    }
}
