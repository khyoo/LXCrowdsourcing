package com.infolab.cs.web;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.infolab.cs.model.WorkerDto;
import com.infolab.cs.service.CrowdLXService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private CrowdLXService cs;
		
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Request GET (/) : The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	/**
	 * Login
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postLogin(Locale locale, Model model, HttpServletRequest request,
			@RequestBody WorkerDto workerInfo) {
		logger.info("Request POST (/) : The client locale is {}.", locale);

		Map<String, Object> resData = new LinkedHashMap<String, Object>();
		
		WorkerDto result = cs.getWorkerInfo(workerInfo);
		
		if (result != null) {
			workerInfo.setWorker_id(result.getWorker_id());
			workerInfo.setName(result.getName());
			
			HttpSession session = request.getSession();			
			session.setAttribute("workerInfo", workerInfo);
			
			resData.put("result", "OK");	
		} else {
			resData.put("result", "fail");	
		}
		
		return resData;
	}
	
	/**
	 * ��������ó�� ��ħ
	 */
	@RequestMapping(value = "/privateTerms", method = RequestMethod.GET)
	public String getPrivateTerms(Locale locale, Model model) {
		logger.info("Controller(GET): /regist The client locale is {}.", locale);
				
		return "worker/privateTerms";
	}
	
	/*
	@RequestMapping(value = "/khyoo", method = RequestMethod.GET)
	public String khyoo(Locale locale, Model model) {
		logger.info("Controller(GET): /khyoo The client locale is {}.", locale);
		
		int len = 127080;
		
		WorkerDto wkr = new WorkerDto();
		
		int startX = 1;
		int endX = 50;
		
		int taskId = 1;
		
		for(int i=0; i<len/50; i++) {
			wkr.setStartIdx(startX);
			wkr.setEndIdx(endX);	

			wkr.setTask_id(taskId);
			
			int result = cs.insertTaskList(wkr);
			
			startX += 50;
			endX += 50;
			taskId++;
		}
				
		return "worker/privateTerms";
	}
	*/
	
	/**
	 * Worker Id üũ
	 */
	@RequestMapping(value = "/idchk", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getIdchk(Locale locale, Model model, 
			@RequestBody WorkerDto workerInfo) {
		logger.info("Controller(GET): /idchk The client locale is {}.", locale);
		
		Map<String, Object> resData = new LinkedHashMap<String, Object>();
		
		WorkerDto result = cs.getWorkerInfo(workerInfo);
		
		if(result != null) {
			resData.put("result", "1");	
		} else {
			resData.put("result", "0");	
		}
		return resData;
	}
	
	/**
	 * Worker ȸ������
	 */
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String getRegist(Locale locale, Model model) {
		logger.info("Controller(GET): /regist The client locale is {}.", locale);
				
		return "worker/regist";
	}
	
	/**
	 * Worker ȸ������
	 */
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postRegist(Locale locale, Model model, HttpServletRequest request,
			@RequestBody WorkerDto workerInfo) {
		logger.info("Controller(POST): /regist The client locale is {}.", locale);
	
		int result = cs.insertWorkerInfo(workerInfo);
		
		WorkerDto result2 = cs.getWorkerInfo(workerInfo);
		
		workerInfo.setWorker_id(result2.getWorker_id());
		workerInfo.setName(result2.getName());
		
		HttpSession session = request.getSession();			
		session.setAttribute("workerInfo", workerInfo);
		
		Map<String, Object> resData = new LinkedHashMap<String, Object>();
		resData.put("result", "OK");
		
		return resData;
	}
	
	/**
	 * Worker ��й�ȣ ���� üũ
	 */
	@RequestMapping(value = "/passwdChangeChk", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> passwdChangeChk(Locale locale, Model model, 
			@RequestBody WorkerDto workerInfo) {
		logger.info("Controller(POST): /passwdChangeChk The client locale is {}.", locale);
		
		Map<String, Object> resData = new LinkedHashMap<String, Object>();
		
		WorkerDto result = cs.getWorkerInfo(workerInfo);
		
		if(result != null) {
			resData.put("result", "1");	
		} else {
			resData.put("result", "0");	
		}		
		return resData;
	}
	
	/**
	 * Worker ��й�ȣ ����
	 */
	@RequestMapping(value = "/passwdChange", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> passwdChange(Locale locale, Model model, 
			@RequestBody WorkerDto workerInfo) {
		logger.info("Controller(POST): /passwdChange The client locale is {}.", locale);
		
		Map<String, Object> resData = new LinkedHashMap<String, Object>();
		
		int result = cs.updateWorkerPasswd(workerInfo);
		
		resData.put("result", result);				
		return resData;
	}
	
	/**
	 * Worker mypage
	 */
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Controller(GET): /mypage The client locale is {}.", locale);
		
		HttpSession session = request.getSession();
		WorkerDto workerInfo = (WorkerDto) session.getAttribute("workerInfo"); 
		
		//model.addAttribute("workerInfo", workerInfo);
		
		WorkerDto result = cs.getWorkerInfo(workerInfo);
		
		model.addAttribute("result", result);
		
		return "worker/mypage";
	}
	
	/**
	 * Worker Tester
	 */
	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> post_mypage(Locale locale, Model model, HttpServletRequest request,
			@RequestBody WorkerDto workerInfo) {
		logger.info("Controller(POST): /mypage The client locale is {}.", locale);
	
		int result = cs.updateWorkerInfo(workerInfo);
		
		WorkerDto result2 = cs.getWorkerInfo(workerInfo);
		
		workerInfo.setWorker_id(result2.getWorker_id());
		workerInfo.setName(result2.getName());
		
		HttpSession session = request.getSession();			
		session.setAttribute("workerInfo", workerInfo);
		
		Map<String, Object> resData = new LinkedHashMap<String, Object>();
		resData.put("result", "OK");
		
		return resData;
	}
	
	/**
	 * Worker Tester
	 */
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String tester(Model model, HttpServletRequest request) {
//		logger.info("Welcome home! The client locale is {}.", locale);
		
		HttpSession session = request.getSession();
		WorkerDto workerInfo = (WorkerDto) session.getAttribute("workerInfo"); 
		
		model.addAttribute("workerInfo", workerInfo);
		
		WorkerDto result = cs.getWorkerMissionCnt(workerInfo);
		
		float pctge = ((float)result.getMission_cnt()/50)*100;
		
		model.addAttribute("missionCnt", result.getMission_cnt());
		model.addAttribute("missionPctge", String.format("%.2f", pctge));
		model.addAttribute("reward", result.getMission_cnt()*1200);
		
		return "worker/dashboard";
	}
		
	/**
	 * Worker �½�ũ ��
	 */
	@RequestMapping(value = "/evaluation", method = RequestMethod.GET)
	public String evaluation(Locale locale, Model model, HttpServletRequest request,
			@RequestParam(value = "taskId", defaultValue = "") String taskId,
			@RequestParam(value = "taskNum", defaultValue = "1") String taskNum) {
		logger.info("Evaluation GET Requst! The client locale is {}.", locale);
		
		int task_id = 0;
		
		List<Integer> rtaskList = cs.getResultTaskList();
		
		if (taskId != null && !"".equals(taskId)) {
			task_id = Integer.parseInt(taskId);
		} else {
			Random rand = new Random();
			task_id = rand.nextInt(2540)+1;
			
			if(rtaskList.contains(task_id)) {
				task_id = rand.nextInt(2540)+1;
			}
		}
				
		HttpSession session = request.getSession();
		session.setAttribute("taskId", task_id);
		
		session.setAttribute("correct", 0);
		
		long startTime = System.currentTimeMillis();
		session.setAttribute("startTime", startTime);		
		
		WorkerDto workerInfo = (WorkerDto) session.getAttribute("workerInfo");
		workerInfo.setTask_id(task_id);
		
		WorkerDto evalChk = cs.getWorkerMissionCnt(workerInfo);
		
		if(evalChk.getMission_cnt() == 50) {
			return "worker/evaluationComp";
		}
		
		model.addAttribute("workerInfo", workerInfo);
		
		List<LinkedHashMap<String, Object>> result = cs.getEvalTaskList(workerInfo);
		
		// Task Number 1�� �ʱ�ȭ
		model.addAttribute("taskNum", 1);
		
		//  ����(����� ����) �ʱ�ȭ
		int[] questArr = new int[55];
		
		session.setAttribute("questArr", questArr);
		
		String img1 = result.get(0).get("image_id1").toString();
		String img2 = result.get(0).get("image_id2").toString();
				
		model.addAttribute("img1", img1);
		model.addAttribute("img2", img2);
		
		return "worker/evaluation";
	}
	
	@RequestMapping(value = "/evaluation", method = RequestMethod.POST)	
	public String evaluation2(Locale locale, Model model, HttpServletRequest request,
			@RequestParam(value = "taskNum", defaultValue = "0") int taskNum,
			@RequestParam(value = "questAnswer", defaultValue = "0") int questAnswer) throws IOException {	
	
		logger.info("Evaluation POST Requst! The client locale is {}.", locale);
		
		HttpSession session = request.getSession();
		WorkerDto workerInfo = (WorkerDto) session.getAttribute("workerInfo");
				
		List<LinkedHashMap<String, Object>> result = cs.getEvalTaskList(workerInfo);
		System.out.println(result.get(taskNum-1));
		
		LinkedHashMap<String, Object> taskDetail = result.get(taskNum-1);
		
		int correct = (int) session.getAttribute("correct");
		System.out.println(taskDetail.get("task_order"));
		if("Y".equals(taskDetail.get("pre_yn"))) {
			String tempAn = "";
			if(questAnswer == 1) {
				tempAn = "left";
			} else if(questAnswer == 2) {
				tempAn = "right";
			} else if(questAnswer == 3) {
				tempAn = "equal";
			}
			if(taskDetail.get("answer").equals(tempAn)) {
				correct += 1;
			}
			session.setAttribute("correct", correct);
		}		
		
		if (taskNum > 0) {						
			model.addAttribute("workerInfo", workerInfo);
			
			int[] questArr = (int[]) session.getAttribute("questArr");
			
			questArr[taskNum-1] = questAnswer;
			for(int i=0; i<questArr.length; i++) {
				System.out.print(questArr[i]+", ");		
			}
			if(taskNum < 55) {
				model.addAttribute("taskNum", taskNum+1);
				model.addAttribute("flag", false);
			} else if (taskNum >= 55) {
				model.addAttribute("taskNum", taskNum);
				model.addAttribute("taskId", (int)session.getAttribute("taskId"));
				model.addAttribute("flag", true);
				
				long startTime = (long) session.getAttribute("startTime");
				long currentTime = System.currentTimeMillis();
				
				int elapsedTime = (int) ((currentTime-startTime)/1000); 
				
				model.addAttribute("elapsedTime", elapsedTime);
				
				workerInfo.setEval_time(elapsedTime);
				workerInfo.setEval_score(correct/5);
				
				String evalValid = "Y";
				if (correct < 4) {
					evalValid = "N";
				}
				workerInfo.setEval_result(evalValid);
				workerInfo.setTask_id((int)session.getAttribute("taskId"));
				
				model.addAttribute("correct", correct);
				model.addAttribute("evalValid", evalValid);
				
				int re = cs.insertEvalResultService(workerInfo);
				
				for(int i=0; i<result.size(); i++) {
					if(questArr[i] == 1) {
						workerInfo.setWorker_answer("left");
					} else if(questArr[i] == 2) {
						workerInfo.setWorker_answer("right");
					} else if(questArr[i] == 3) {
						workerInfo.setWorker_answer("equal");	
					}
					
					workerInfo.setTaskNum(i+1);
					workerInfo.setPair_id((int)result.get(i).get("pair_id"));
					workerInfo.setPre_yn(result.get(i).get("pre_yn").toString());
					workerInfo.setAnswer(result.get(i).get("answer").toString());

					cs.insertTaskResult(workerInfo);
				}
				
				return "worker/evalEnd";
			}
			
			session.setAttribute("questArr", questArr);
		}		
		
		String img1 = result.get(taskNum).get("image_id1").toString();
		String img2 = result.get(taskNum).get("image_id2").toString();
				
		model.addAttribute("img1", img1);
		model.addAttribute("img2", img2);
		model.addAttribute("pre_yn", result.get(taskNum).get("pre_yn"));
		model.addAttribute("answer", result.get(taskNum).get("answer"));
		
		return "worker/evaluation";
	}
	
	
	/**
	 * Worker Pretrained
	 */
	@RequestMapping(value = "/pretrained", method = RequestMethod.GET)
	public String pretrained(Model model, HttpServletRequest request) {
//		logger.info("pretrained The client locale is {}.", locale);
		
		WorkerDto workerInfo = new WorkerDto();
		
		List<LinkedHashMap<String, Object>> resultList = cs.getPretrainedList();
		
		model.addAttribute("resultList", resultList);
		
		return "worker/pretrained";
	}
	
	
	
	
	
//	@RequestMapping(value = "/insertData", method = RequestMethod.GET)
//	public String insertData(Model model, HttpServletRequest request) {
////		logger.info("pretrained The client locale is {}.", locale);
//		
//		WorkerDto workerInfo = new WorkerDto();
//		
//		int x = cs.insertData(workerInfo);
//		
//		return "worker/insertData";
//	}
}