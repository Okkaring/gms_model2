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
import com.gms.web.proxy.BlockHandler;
import com.gms.web.proxy.PageHandler;
import com.gms.web.proxy.PageProxy;
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
			System.out.println("MemberCtrller: MEMBER MOVE 진입");
			DispatcherServlet.send(request, response);
			break;
		case Action.JOIN:
			System.out.println("MemberCtrller: MEMBER JOIN 진입");
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
			System.out.println("MemberCtrller: MEMBER LIST 진입");
			PageProxy pxy = new PageProxy(request);
			pxy.setPageSize(5);
			pxy.setBlockSize(5);
			pxy.setTheNumberOfRows(Integer.parseInt(service.countMembers()));
			pxy.setPageNumber(Integer.parseInt(request.getParameter("pageNumber")));
			int[] arr = PageHandler.attr(pxy);
			int[] arr2 = BlockHandler.attr(pxy);
			pxy.execute(arr2, service.list(arr));
			DispatcherServlet.send(request, response);
			break;
		case Action.UPDATE: 
			System.out.println("MemberCtrller: MEMBER UPDATE 진입");
			service.modify(service.findById(request.getParameter("id"))); //(bean)
			DispatcherServlet.send(request, response);
			break;
		case Action.DELETE: 
			System.out.println("MemberCtrller: MEMBER DELETE 진입");
		/*	service.remove(request.getParameter("id"));*/
			response.sendRedirect(request.getContextPath()+"/member.do?action=list&page=member_list&pageNumber=1");
			break;
		case Action.DETAIL: 
			System.out.println("MemberCtrller: MEMBER DETAIL 진입");
			request.setAttribute("student",service.findById(request.getParameter("id")));
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