package com.infolab.cs.model;

import lombok.Data;

@Data
public class WorkerDto {

	private String user_id;
	private String passwd;
	private String name;
	private String email;
	private String birth;
	private String sex;
	private String phone;
	private int age;
	private String address;
	private String bank_code;
	private String bank_name;
	private String bank_acct;
	private String stdt_no;
	
	private int taskNum;
	
	private int task_id;
	private int worker_id;	
	private String sns_id;
	private int eval_time;
	private int eval_score;
	private String eval_result;
	private int level;
	
	private int mission_cnt;
	
	private String gname;
	
	private int pair_id;
	private String pre_yn;
	private String answer;
	private String worker_answer;
	private int result_id;	
	
	private int startIdx;
	private int endIdx;		
	
	private int imgId1;
	private int imgId2;
}