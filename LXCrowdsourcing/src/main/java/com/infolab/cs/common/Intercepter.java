package com.infolab.cs.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.infolab.cs.model.WorkerDto;

public class Intercepter extends HandlerInterceptorAdapter{
 
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession(false);
    	
        if(session == null) {
        	response.sendRedirect(request.getContextPath()+"/");
    		return false;	
        } else {
        	WorkerDto workerDto = (WorkerDto) session.getAttribute("workerInfo");
        	if(workerDto == null) {
        		response.sendRedirect(request.getContextPath()+"/");
        		return false;	
        	}
        }
        
        return true;    	
        //return super.preHandle(request, response, handler);
    }
 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
    	System.out.println("post");
        super.postHandle(request, response, handler, modelAndView);
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub
    	System.out.println("after");
        super.afterCompletion(request, response, handler, ex);
    }
 
}