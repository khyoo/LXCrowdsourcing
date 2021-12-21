package com.infolab.cs.web;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.infolab.cs.model.WorkerDto;
import com.infolab.cs.service.CrowdLXService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private CrowdLXService cs;
	
	/**
	 * Admin Dashboard 1
	 */
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Controller(GET): /dashboard The client locale is {}.", locale);
		
		HttpSession session = request.getSession();
		WorkerDto workerInfo = (WorkerDto) session.getAttribute("workerInfo"); 
		
		model.addAttribute("workerInfo", workerInfo);
		
		int totalTaskCnt = cs.getTotalTaskCnt();
		int evalTaskCnt = cs.getEvalTaskCnt();
		
		float pctge = ((float)evalTaskCnt/totalTaskCnt)*100;
		
		model.addAttribute("missionTotalCnt", totalTaskCnt);
		model.addAttribute("missionCnt", evalTaskCnt);
		model.addAttribute("missionPctge", String.format("%.2f", pctge));
		model.addAttribute("reward", evalTaskCnt*1200);
		
		List<LinkedHashMap<String, Object>> resultList = cs.getResultInfoList();		
		model.addAttribute("resultList", resultList);
		
		return "admin/dashboard";
	}		
	
	/**
	 * Admin Dashboard 2
	 */
	@RequestMapping(value = "/dashboard2", method = RequestMethod.GET)
	public String dashboard2(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Controller(GET): /dashboard The client locale is {}.", locale);
		
		HttpSession session = request.getSession();
		WorkerDto workerInfo = (WorkerDto) session.getAttribute("workerInfo"); 
		
		model.addAttribute("workerInfo", workerInfo);
		
		int totalTaskCnt = cs.getTotalTaskCnt();
		int evalTaskCnt = cs.getEvalTaskCnt();
		
		float pctge = ((float)evalTaskCnt/totalTaskCnt)*100;
		
		model.addAttribute("missionTotalCnt", totalTaskCnt);
		model.addAttribute("missionCnt", evalTaskCnt);
		model.addAttribute("missionPctge", String.format("%.2f", pctge));
		model.addAttribute("reward", evalTaskCnt*1200);
		
		List<LinkedHashMap<String, Object>> resultList = cs.getTaskAggList();		
		model.addAttribute("resultList", resultList);
		
		return "admin/dashboard2";
	}
}
