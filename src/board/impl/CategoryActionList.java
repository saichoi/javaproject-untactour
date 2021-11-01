package board.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.base.Action;
import board.dao.BasketDao;
import board.dao.CategoryDao;
import board.vo.CategoryVo;

public class categoryActionList implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String                path      =  "/index.jsp";
//		HttpSession session = request.getSession(false);
//	    String id  = (String) session.getAttribute("customer_id");
	    
		CategoryDao       categoryDao   =  new CategoryDao();
		List<CategoryVo>  categoryList  =  categoryDao.getCategoryList();
		
//		BasketDao bdao = new BasketDao();
//		bdao.deleteAllBasket(id);
		int totalBasket = 0;
		
		request.setAttribute("categoryList", categoryList);
	
		request.setAttribute("totalBasket", totalBasket);
		// 페이지 이동
		request.getRequestDispatcher(path).forward(request,  response);
		
	}

}
