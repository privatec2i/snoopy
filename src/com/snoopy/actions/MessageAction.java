package com.snoopy.actions;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.pusher.rest.Pusher;

public class MessageAction extends ActionSupport implements Action{
	private String username;
	private String fullname;
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	private String message;
	@Override
	public String execute() throws Exception {
		Pusher pusher = new Pusher("844463", "6f91cb8f07188889118f", "14908d1ddee1bf2f0e93");
		pusher.setCluster("ap1");
		pusher.setEncrypted(true);
		
		Map<String,String> messageData = new HashMap<String,String>();
		messageData.put("message", message);
		messageData.put("fullname", fullname);
		messageData.put("username", username);
		
        
		pusher.trigger("my-channel", "my-event", messageData);
		return "SUCCESS";
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
