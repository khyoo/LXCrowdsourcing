package com.infolab.cs.service;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infolab.cs.dao.CrowdLXDao;
import com.infolab.cs.model.WorkerDto;

@Service
public class CrowdLXService {

	@Autowired
	private CrowdLXDao dataDao;
	
	public WorkerDto getWorkerInfo(WorkerDto workerInfo) {	
		
		WorkerDto result = dataDao.getWorkerInfoDao(workerInfo); 
		
		return result;
	}
	
	public WorkerDto getWorkerMissionCnt(WorkerDto workerInfo) {	
		
		WorkerDto result = dataDao.getWorkerMissionCnt(workerInfo); 
		
		return result;
	}
	
	public int insertWorkerInfo(WorkerDto workerInfo) {
		
		int result = dataDao.insertWorkerInfo(workerInfo);
		
		return result;
	}
	
	public int updateWorkerInfo(WorkerDto workerInfo) {
		
		int result = dataDao.updateWorkerInfo(workerInfo);
		
		return result;
	}
	
	public int updateWorkerPasswd(WorkerDto workerInfo) {
		
		int result = dataDao.updateWorkerPasswd(workerInfo);
		
		return result;
	}

	public List<LinkedHashMap<String, Object>> getPretrainedList() {	
		
		List<LinkedHashMap<String, Object>> result = dataDao.getPretrainedList(); 
		
		return result;
	}
	
	public List<LinkedHashMap<String, Object>> getPairwiseService() {	
		
		List<LinkedHashMap<String, Object>> result = dataDao.getPairwiseDao(); 
		
		return result;
	}
	
	public List<LinkedHashMap<String, Object>> getEvalTaskList(WorkerDto workerInfo) {	
		
		List<LinkedHashMap<String, Object>> result = dataDao.getEvalTaskList(workerInfo); 
		
		return result;
	}
	
	public List<Integer> getResultTaskList() {	
		
		List<Integer> result = dataDao.getResultTaskList(); 
		
		return result;
	}
	
	public int getRandomTaskId() {	
		
		int result = dataDao.getRandomTaskId(); 
		
		return result;
	}
	
	public int insertEvalResultService(WorkerDto workerInfo) {
		
		int result = dataDao.insertEvalResultDao(workerInfo);
		
		return result;
	}
	
	public int insertTaskResult(WorkerDto workerInfo) {
		
		int result = dataDao.insertTaskResult(workerInfo);
		
		return result;
	}
	
	public int updateTaskResult(WorkerDto workerInfo) {
		
		int result = dataDao.updateTaskResult(workerInfo);
		
		return result;
	}
		
	public int insertTaskList(WorkerDto workerInfo) {
		
		int result = dataDao.insertTaskList(workerInfo);
		
		return result;
	}
	
	
	public int insertData(WorkerDto workerInfo) {
		
		int result = dataDao.insertData(workerInfo);
		
		return result;
	}
	
	
	
	
	
	
	public int getTotalTaskCnt() { return dataDao.getTotalTaskCnt(); }
	public int getEvalTaskCnt() { return dataDao.getEvalTaskCnt(); }
	
	public List<LinkedHashMap<String, Object>> getResultInfoList(WorkerDto workerInfo) { return dataDao.getResultInfoList(workerInfo); }	
	public List<LinkedHashMap<String, Object>> getTaskAggList() { return  dataDao.getTaskAggList(); }	
	public List<LinkedHashMap<String, Object>> getTaskIdResultList(WorkerDto workerInfo) { return dataDao.getTaskIdResultList(workerInfo); }
	
	public List<LinkedHashMap<String, Object>> getUserList() { return  dataDao.getUserList(); }
}
