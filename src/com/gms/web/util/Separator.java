package com.gms.web.util;

import javax.servlet.http.HttpServletRequest;

public class Separator {
	public static String init(HttpServletRequest request){
		String servletPath=request.getServletPath();
		System.out.println("servletPath: " +servletPath);
		String directory= servletPath.substring(1,servletPath.indexOf("."));
		System.out.println("directory: "+directory);
		return directory;
	}
}
