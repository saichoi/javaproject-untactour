package board.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.base.Action;
import board.dao.CategoryDao;
import board.vo.CategoryVo;

public class CategoryActionList implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String                path      =  "/index.jsp";
		CategoryDao       categoryDao   =  new CategoryDao();
		List<CategoryVo>  categoryList  =  categoryDao.getCategoryList();
				
		System.out.println(categoryList);
		
		request.setAttribute("categoryList", categoryList);
		// 페이지 이동
		request.getRequestDispatcher(path).forward(request,  response);
	}

}
