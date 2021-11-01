package board.impl;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.base.Action;
import board.dao.CategoryDao;
import board.dao.ItemDao;
import board.vo.CategoryVo;
import board.vo.ItemVo;

public class DetailActionView implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category_code_id = request.getParameter("category_code_id");
		String category_code_name = request.getParameter("category_code_name");
		String item_id = request.getParameter("item_id");
		//String item_name = request.getParameter("item_name");
		//String price = request.getParameter("price");
		
		int nowpage = Integer.parseInt(request.getParameter("nowpage"));
		int pagecount = Integer.parseInt(request.getParameter("pagecount"));
		
		//카테고리(헤더)
		CategoryDao categoryDao = new CategoryDao();
		List<CategoryVo> categoryList = categoryDao.getCategoryList();
		request.setAttribute("categoryList", categoryList);
		
		//카테고리 제목 
		request.setAttribute("category_code_name", category_code_name);
			request.setAttribute("category_code_id", category_code_id);
			//request.setAttribute("item_name", item_name);
			//request.setAttribute("price", price);
			request.setAttribute("nowpage", nowpage);
			request.setAttribute("pagecount", pagecount);

		//현재 상품 상세정보  
		ItemDao itemDao = new ItemDao();
		ItemVo itemVo = itemDao.getItem(item_id);
		request.setAttribute("itemVo", itemVo);
		
		//연관 상품 정보
		List<ItemVo> itemList = itemDao.getItemList(category_code_id, nowpage, pagecount);
//		System.out.println("DetailAction:"+itemList);
		Collections.shuffle(itemList);
		request.setAttribute("itemList", itemList);
//		System.out.println("DetailAction:"+category_code_id+"끝");
//		System.out.println("DetailAction:"+nowpage);
//		System.out.println("DetailAction:"+pagecount);
//		System.out.println("DetailAction:"+itemList);
//		System.out.println("DetailAction:"+item_name);
//		System.out.println("DetailAction:"+price);
//		System.out.println("nowpage in detail action:"+nowpage);
//		System.out.println("pagecount in detail action:"+pagecount);

		//상품 설명에 엔터키 유효화 
		request.setAttribute("newLineChar", "\n");
		
		// 페이지 이동
		String path = "/view/detail.jsp";
		request.getRequestDispatcher(path).forward(request,  response);
		
		
	}

}
