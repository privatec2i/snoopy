package com.snoopy.actions;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.pusher.rest.Pusher;

public class LetsDoodleAction extends ActionSupport implements Action{
	private String xpos;
	private String ypos;
	@Override
	public String execute() throws Exception {
		return "SUCCESS";
	}
	public void sendDrawPoints(){
		Pusher pusher = new Pusher("844463", "6f91cb8f07188889118f", "14908d1ddee1bf2f0e93");
		pusher.setCluster("ap1");
		pusher.setEncrypted(true);
		
		Map<String,String> messageData = new HashMap<String,String>();
		messageData.put("xpos", xpos);
		messageData.put("ypos", ypos);
		
		pusher.trigger("drawingchannel", "drawingevent", messageData);
	}
	public String getXpos() {
		return xpos;
	}
	public void setXpos(String xpos) {
		this.xpos = xpos;
	}
	public String getYpos() {
		return ypos;
	}
	public void setYpos(String ypos) {
		this.ypos = ypos;
	}
	
	
	

}
