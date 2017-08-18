package com.gms.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.gms.web.constant.Action;
import com.gms.web.dao.MemberDAOImpl;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.service.MemberService;
import com.gms.web.service.MemberServiceImpl;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.ParamsIterator;
import com.gms.web.util.Separator;

@WebServlet("/member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController Do get 진입");
		Separator.init(request);
		MemberBean member = new MemberBean();
		MemberService service = MemberServiceImpl.getInstance();
		switch (request.getParameter("action")) {
		case Action.MOVE:
			System.out.println("====moveeeeee");
			DispatcherServlet.send(request, response);
			break;
		case Action.JOIN:
			System.out.println("====join 진입");
			Map<?,?> map = ParamsIterator.execute(request);
			member.setId((String)map.get("id"));
			member.setPw((String)map.get("pw"));
			member.setSsn((String)map.get("birthday"));
			member.setEmail((String)map.get("email"));
			member.setPhone((String)map.get("phone"));
			member.setMajor((String)map.get("major"));
			member.setName((String)map.get("name"));
			member.setProfile("default.jpg");
			//major는 여러 행을 입력해야 함.
			String[] subjects=((String)map.get("subject")).split(",");
	         List<MajorBean> list=new ArrayList<>();
	         MajorBean major=null;
	         for(int i=0;i<subjects.length;i++){
	            major=new MajorBean();
	            major.setMajorId(String.valueOf((int)((Math.random() * 9999) + 1000)));
	            major.setId((String)map.get("id"));
	            major.setTitle((String)map.get("name"));
	            major.setSubjId(subjects[i]);
	            list.add(major);
	         }
			Map<String,Object> tempMap = new HashMap<>();
			tempMap.put("member", member);
			tempMap.put("major", list);
			String rs= service.addMember(tempMap);
			Separator.cmd.setDir("common");
			Separator.cmd.process();
			System.out.println("컨트롤러 인서트 결과 "+rs);
			System.out.println("이 곳은 멤 버 컨 트 롤 러 ! id는 ? "+map.get("id"));
			DispatcherServlet.send(request, response);
			break;
		case Action.LIST :
			System.out.println("여기는 멤버컨트롤러. Member List Enter 데스:");
			@SuppressWarnings("unchecked")
			List<StudentBean> memberList = (List<StudentBean>)service.list();
			System.out.println("DB에서 가져온 MemberList"+memberList);
/*			Agency a = new PageProxy();
			Map<?,?> r = a.delegateTo(null);*/
			request.setAttribute("pageNumber",request.getParameter("pageNumber"));
			request.setAttribute("list", memberList);
			request.setAttribute("prevBlock", "0");

			request.setAttribute("theNumberOfPages", memberList.size()/5);
			request.setAttribute("startPage", "1");
			System.out.println("페이지수"+memberList.size()/5);
			int pageCount=memberList.size()/5;
			int endPage = (pageCount%5!=0)?pageCount+1:pageCount;
			request.setAttribute("endPage", String.valueOf(endPage));
			DispatcherServlet.send(request, response);
			break;
		default: System.out.println("FAIL....");
			break;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController Do Post 진입");
	}
}