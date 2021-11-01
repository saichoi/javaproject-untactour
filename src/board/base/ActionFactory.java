package board.base;

import board.impl.categoryActionList;
import board.impl.categoryActionView;

//  2개 수정
public class ActionFactory {

	public Action getAction(String command) {
		
		Action action = null;
		
		if(command == null) {
				action = new categoryActionList();               // 1. 이부분 수정!!!!!!!!!!!!!!
		}
		else {
				switch(command) {                            // 2. 이부분 수정!!!!!!!!!!!!!!
				
				case "CATEGORYVIEW": 
					action = new categoryActionView();
					break;
			}	
		}
		return action;
	}
}
