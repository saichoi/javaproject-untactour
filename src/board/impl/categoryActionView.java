package board.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.base.Action;
import board.dao.CategoryDao;
import board.dao.ItemDao;
import board.vo.CategoryVo;
import board.vo.ItemVo;
import board.vo.PageVo;

public class categoryActionView implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/view/category.jsp";
		String category_code_id = request.getParameter("category_code_id");
		String category_code_name = request.getParameter("category_code_name");
		int    nowpage    =  Integer.parseInt(request.getParameter("nowpage"));
		int    pagecount  =  Integer.parseInt(request.getParameter("pagecount"));
		
		// 헤더값 넘겨주기
		CategoryDao categoryDao = new CategoryDao();
		List<CategoryVo>  categoryList = categoryDao.getCategoryList();
		request.setAttribute("categoryList", categoryList);
		
		request.setAttribute("category_code_name", category_code_name);
		request.setAttribute("category_code_id", category_code_id);
		
		// ItemlIst - 게시물 목록
		ItemDao      itemDao  = new ItemDao();
		List<ItemVo> itemList = itemDao.getItemList(
				category_code_id, nowpage, pagecount ); // 조회된 현재 페이지 의 data 
		int  totalcount = itemList.get(0).getTotalcount();  // 전체자료수
		
		// paging 관련변수 처리		
	    PageVo  pageVo = new PageVo(nowpage, pagecount, totalcount);		
		request.setAttribute("pageVo", pageVo);
		
		request.getRequestDispatcher(path).forward(request,  response);
	}

}
