package com.gms.web.service;

import java.util.*;

import com.gms.web.dao.MemberDAOImpl;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;



public class MemberServiceImpl implements MemberService{
	public static MemberServiceImpl getInstance() {return new MemberServiceImpl();}
	private MemberServiceImpl(){}
	//List<MemberBean> list = new ArrayList<>();
	@SuppressWarnings("unchecked")
	@Override
	public String addMember(Map<?,?> map) {
		System.out.println("member service 진입");
		MemberBean m = (MemberBean)map.get("member");
		System.out.println("넘어온 회원의 이름: "+ m.toString());
		List<MajorBean> list =(List<MajorBean>)map.get("major");
		System.out.println("넘어온 수강과목:"+list);
		return MemberDAOImpl.getInstance().insert(map);
	}
	@Override
	public List<?> list() {
		return MemberDAOImpl.getInstance().selectAll();
	}
	@Override
	public String countMembers() {
		return String.valueOf(MemberDAOImpl.getInstance().countMembers());
	}
	
	@Override
	public MemberBean findById(String id) {
		return MemberDAOImpl.getInstance().selectById(id);
	}

	@Override
	public List<?> findByName(String name) {
		return MemberDAOImpl.getInstance().selectByName(name);
	}

	@Override
	public String modify(MemberBean bean) {
		return MemberDAOImpl.getInstance().update(bean);
	}

	@Override
	public String remove(String id) {
		return	(MemberDAOImpl.getInstance().delete(id).equals("1"))? "삭제 성공!!": "삭제 실패!!";
	}
	@Override
	public Map<String, Object> login(MemberBean bean) {
		Map<String, Object> map = new HashMap<>();
		MemberBean m = findById(bean.getId());
		String page = (m != null)?(bean.getPw().equals(m.getPw()))?"main":"login_fail":"member_join";
		map.put("page",page);
		map.put("user",m);
		return map;
	}
}
