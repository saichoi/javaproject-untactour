package board.base;

import board.impl.CategoryActionList;
import board.impl.categoryActionView;

//  2개 수정
public class ActionFactory {

	public Action getAction(String command) {
		
		Action action = null;
		
		if(command == null) {
				action = new CategoryActionList();               // 1. 이부분 수정!!!!!!!!!!!!!!
		}
		else {
				switch(command) {                            // 2. 이부분 수정!!!!!!!!!!!!!!
				
				case "CATEGORYVIEW": 
					action = new categoryActionView();
					break;
			
		//		
		//		// CATEGORY
		//		case "": break;
		//		
		//		// DETAIL
		//		case "": break;		
			}	
		}
		return action;
	}
}
