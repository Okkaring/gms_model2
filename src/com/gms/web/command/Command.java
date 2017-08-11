package com.gms.web.command;

import com.gms.web.constant.*;

public class Command implements Commandable{
	protected String dir,page,action,view;

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}
	
	public String getView() {
		return view;
	}

	@Override
	public void process() {
		this.view = Path.VIEW + dir + Path.SEPARATOR + page + Extension.JSP;
	}
	@Override
	public String toString() {
		return "Command [DEST ="+ dir + "/" + page + ".jsp" + ",ACTION=" + action + "]";
	}
	
}