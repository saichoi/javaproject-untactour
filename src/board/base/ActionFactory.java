package board.base;

import board.impl.CustomerActionJoin;
import board.impl.CustomerActionLogin;
import board.impl.DetailActionView;
import board.impl.categoryActionList;
import board.impl.categoryActionView;

public class ActionFactory {

	public Action getAction(String command) {
		
		Action action = null;
		
		if(command == null) {
				action = new categoryActionList();               
		}
		else {
				switch(command) {
				
				case "CATEGORYVIEW": 
					action = new categoryActionView();
					break;
				case  "LOGIN" :
			         action = new CustomerActionLogin();
			         break;
				case  "JOIN" :
					action = new CustomerActionJoin();
					break;
				case "DETAILVIEW":
					action = new DetailActionView();
			}	
		}
		return action;
	}
}
