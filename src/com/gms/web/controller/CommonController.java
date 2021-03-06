package com.gms.web.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gms.web.constant.Action;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;
import com.gms.web.service.MemberServiceImpl;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.Separator;


@WebServlet({"/home.do","/common.do"})
public class CommonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Separator.init(request);
		switch (Separator.cmd.getAction()) {
		case Action.MOVE:
			System.out.println("****** CommonCtrl ****** : move 진입");
			DispatcherServlet.send(request, response);
			break;
		case Action.LOGIN:
			System.out.println("****** CommonCtrl ****** : login 진입");
			MemberService service = MemberServiceImpl.getInstance();
			MemberBean member = new MemberBean();
			member.setId(request.getParameter("login_id"));
			System.out.println("*** CommonCtrl_id = "+ request.getParameter("login_id"));
			member.setPw(request.getParameter("login_pass"));
			Map<String, Object> map = service.login(member);
			
			if(map.get("page").equals("main")){
				session.setAttribute("user", map.get("user"));
			}
			Separator.cmd.setPage(String.valueOf(map.get("page")));
			Separator.cmd.process();
			DispatcherServlet.send(request, response);
			break;
		case Action.LOGOUT: 
			System.out.println("*** CommonCtrl : logout 진입");
			session.invalidate();
			DispatcherServlet.send(request, response);
			break;
		default:
			break;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CommonController Do Post 진입");
	}

}
