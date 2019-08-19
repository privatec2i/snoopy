package com.snoopy.actions;

import java.util.Collections;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pusher.rest.Pusher;
import com.snoopy.models.User;

public class LetsChatAction extends ActionSupport implements Action,ModelDriven<User>,SessionAware{
	private User myuser = new User();
	private Map<String, Object> session;
	@Override
	public String execute() throws Exception {
		session.put("username", myuser.getUsername());
		session.put("fullname", myuser.getFullname());
		return "SUCCESS";
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public User getModel() {
		return myuser;
	}

}
