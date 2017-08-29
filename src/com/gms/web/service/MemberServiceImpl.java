package com.gms.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.dao.MemberDAOImpl;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;



public class MemberServiceImpl implements MemberService{
	public static MemberServiceImpl getInstance() {return new MemberServiceImpl();}
	private MemberServiceImpl(){}
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
	public List<?> list(Command cmd) {
		return MemberDAOImpl.getInstance().selectAll(cmd);
	}
	@Override
	public String countMembers(Command cmd) {
		return String.valueOf(MemberDAOImpl.getInstance().countMembers(cmd));
	}
	
	@Override
	public StudentBean findById(Command cmd) {
		return MemberDAOImpl.getInstance().selectById(cmd);
	}

	@Override
	public List<?> findByName(Command cmd) {
		System.out.println("*** MemberSerImpl findByName : " + cmd.getSearch());
		return MemberDAOImpl.getInstance().selectByName(cmd);
	}

	@Override
	public String modify(MemberBean bean) {
		return MemberDAOImpl.getInstance().update(bean);
	}

	@Override
	public String remove(Command cmd) {
		return	(MemberDAOImpl.getInstance().delete(cmd).equals("1"))? "삭제 성공!!": "삭제 실패!!";
	}
	@Override
	public Map<String, Object> login(MemberBean bean) {
		Map<String, Object> map = new HashMap<>();
		Command cmd = new Command();
		cmd.setSearch(bean.getId());
		MemberBean m = MemberDAOImpl.getInstance().login(cmd);
		String page = (m != null)?(bean.getPw().equals(m.getPw())) ? "main":"login_fail" : "member_join";
		map.put("page",page);
		map.put("user",m);
		return map;
	}
}
