package com.gms.web.service;

import java.util.*;

import com.gms.web.domain.MemberBean;

//관리자의 회원목록(list,array로 지금은 하자)
//지금은 목록을 가져오는 기능을 설정하는 것이다.

public interface MemberService {
	public String addMember(Map<?,?> map);			
	public List<?> list();					
	public String countMembers();							
	public MemberBean findById(String id);	
	public List<?> findByName(String name); 
	public String modify(MemberBean bean);
	public String remove(String id);		
	public Map<String, Object> login(MemberBean bean);
	
}
