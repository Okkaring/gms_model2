package com.gms.web.command;

import com.gms.web.constant.*;
import lombok.Getter;
import lombok.Setter;

public class Command implements Commandable{
	@Getter 
	protected String action, pageNumber, view;
	@Getter @Setter
	protected String dir, page, startRow, endRow, column, search;
	
	public void setPageNumber(String pageNumber) {
		this.pageNumber = (pageNumber==null)? "1" : pageNumber;
		System.out.println("*** Command/pageNumber : " + pageNumber);
	}
	public void setAction(String action) {
		this.action = (action==null)? "move" : action;
		System.out.println("*** Command/action : " + action);
	}
/*	public void setColumn(String column) {
		this.column = (column==null)? "none":column;
		System.out.println("*** Command/column"+this.column);
	}
	public void setSearch(String search) {
		this.search = (search==null)? "none":search;
		System.out.println("*** Command/search"+this.search); //의미가 없었군...
	}*/
	@Override
	public void process() {
		this.view = (dir.equals("home"))? "/WEB-INF/view/common/home.jsp" : Path.VIEW + dir + Path.SEPARATOR + page + Extension.JSP;
		System.out.println("*** Command/process()/이동 페이지 : " + view);
		System.out.println("*** Command/page : " + page);
	}
	@Override
	public String toString() {
		return "Command [DEST ="+ dir + "/" + page + ".jsp" + ",ACTION=" + action + "]";
	}

}
