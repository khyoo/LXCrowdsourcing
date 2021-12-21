package com.infolab.cs.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infolab.cs.model.WorkerDto;

@Repository
public class CrowdLXDaoImpl implements CrowdLXDao {
	
	private List<LinkedHashMap<String, Object>> resultList;	
	
	@Autowired
    private SqlSessionTemplate sqlSession;
		
	@Override
	public WorkerDto getWorkerInfoDao(WorkerDto workerInfo) {	
		
		WorkerDto resultList = sqlSession.selectOne("CrowdLXMapper.getWorkerInfo", workerInfo);
		
		return resultList;
	}
	
	@Override
	public WorkerDto getWorkerMissionCnt(WorkerDto workerInfo) {	
		
		WorkerDto resultList = sqlSession.selectOne("CrowdLXMapper.getWorkerMissionCnt", workerInfo);
		
		return resultList;
	}
	
	@Override
	public int insertWorkerInfo(WorkerDto workerInfo) {
		
		int result = sqlSession.insert("CrowdLXMapper.insertWorkerInfo", workerInfo);
		
		return result;
	}	
	
	@Override
	public int updateWorkerInfo(WorkerDto workerInfo) {
		
		int result = sqlSession.update("CrowdLXMapper.updateWorkerInfo", workerInfo);
		
		return result;
	}		
	
	@Override
	public int updateWorkerPasswd(WorkerDto workerInfo) {
		
		int result = sqlSession.update("CrowdLXMapper.updateWorkerPasswd", workerInfo);
		
		return result;
	}	
	
	@Override
	public List<LinkedHashMap<String, Object>> getPretrainedList() {	
		
		resultList = sqlSession.selectList("CrowdLXMapper.getPretrainedList");
		
		return resultList;
	}
	
	@Override
	public List<LinkedHashMap<String, Object>> getEvalTaskList(WorkerDto workerInfo) {	
		
		resultList = sqlSession.selectList("CrowdLXMapper.getEvalTaskList", workerInfo);
		
		return resultList;
	}
	
	@Override
	public List<Integer> getResultTaskList() {	
		
		List<Integer> resultList = sqlSession.selectList("CrowdLXMapper.getResultTaskList");
		
		return resultList;
	}
	
	@Override
	public int getRandomTaskId() {	
		
		int resultList = sqlSession.selectOne("CrowdLXMapper.getRandomTaskId");
		
		return resultList;
	}
	
	@Override
	public List<LinkedHashMap<String, Object>> getPairwiseDao() {	
		
		resultList = sqlSession.selectList("CrowdLXMapper.getPairwise");
		
		return resultList;
	}	
	
	@Override
	public int insertEvalResultDao(WorkerDto workerInfo) {
		
		int result = sqlSession.insert("CrowdLXMapper.insertEvalResult", workerInfo);
		
		return result;
	}
	
	@Override
	public int insertTaskResult(WorkerDto workerInfo) {
		
		int result = sqlSession.update("CrowdLXMapper.insertTaskResult", workerInfo);
		
		return result;
	}
	
	@Override
	public int updateTaskResult(WorkerDto workerInfo) {
		
		int result = sqlSession.update("CrowdLXMapper.updateTaskResult", workerInfo);
		
		return result;
	}
		
	@Override
	public int insertTaskList(WorkerDto workerInfo) {
		
		int result = sqlSession.insert("CrowdLXMapper.insertTaskList", workerInfo);
		
		return result;
	}
	
	@Override
	public int insertData(WorkerDto workerInfo) {
				
		List<Integer> rand1 = new ArrayList<Integer>();
		
		for(int i=1; i<=42360; i++) {
			rand1.add(i);		
		}
		
		Collections.shuffle(rand1);		
						
		List<Object> result = new ArrayList<Object>();
		int k = 6;
		int head, c1, c2;
		
		while (k >= 2) {
			head = c1 = rand1.get(0);
			rand1.remove(0);
			while (rand1.size() > 0) {
				c2 = rand1.get(0);
					
				int idx = 0;
				while (exist(sort(c1, c2), result)) {				
					c2 = rand1.get(++idx);
				}				
				rand1.remove(idx);	
				result.add(sort(c1, c2));
//				System.out.println("번째 : " + c1 + ", " + c2);
				
				workerInfo.setImgId1(c1);
				workerInfo.setImgId2(c2);
				sqlSession.insert("CrowdLXMapper.insertData", workerInfo);
				
				c1 = c2;
			}
			
			result.add(sort(head, c1));		
			
			workerInfo.setImgId1(head);
			workerInfo.setImgId2(c1);
			sqlSession.insert("CrowdLXMapper.insertData", workerInfo);
			
//			for(int i=0; i<result.size(); i++) {
//				int[] temp = (int[]) result.get(i);
//				System.out.println(i +"번째 : " + temp[0] + ", " + temp[1]);
//			}
			
			for(int i=1; i<=42360; i++) {
				rand1.add(i);		
			}
			
			Collections.shuffle(rand1);
			k = k - 2;
		}
		return 1;
	}
	
	public int[] sort(int c1, int c2) {
		
		int[] a = new int[2];
		if(c1 > c2) {
			a[0] = c2;
			a[1] = c1;
		} else {
			a[0] = c1;
			a[1] = c2;
		}
		
		return a;
	}
	
	public boolean exist(int[] a, List<Object> b) {
		boolean result = false;
		
		for(int i=0; i<b.size(); i++) {
			int[] temp = (int[]) b.get(i);
			if(temp[0] == a[0] && temp[1] == a[1]) {
				result = true;
			}	
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public int getTotalTaskCnt() {	
		
		int resultList = sqlSession.selectOne("CrowdLXMapper.getTotalTaskCnt");
		
		return resultList;
	}
	
	@Override
	public int getEvalTaskCnt() {	
		
		int resultList = sqlSession.selectOne("CrowdLXMapper.getEvalTaskCnt");
		
		return resultList;
	}
	
	@Override
	public List<LinkedHashMap<String, Object>> getResultInfoList() {	
		
		resultList = sqlSession.selectList("CrowdLXMapper.getResultInfoList");
		
		return resultList;
	}	
	
	@Override
	public List<LinkedHashMap<String, Object>> getTaskAggList() {	
		
		resultList = sqlSession.selectList("CrowdLXMapper.getTaskAggList");
		
		return resultList;
	}	
}
