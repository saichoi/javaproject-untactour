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
		
		//상품 데이터 
		ItemDao itemDao = new ItemDao();
		List<ItemVo>  itemList = itemDao.getItemList(category_code_id, nowpage, pagecount);
		int  totalcount = 0;
		if ( itemList != null && itemList.size() != 0 ) {
		     totalcount = itemList.get(0).getTotalcount();  // 전체자료수
		     nowpage    = nowpage - 1;  // 전체자료수
		     System.out.println("totalcount:" + totalcount);
		     System.out.println("nowpage:" + nowpage);
		}
		
		//System.out.println( "BoardActionList boardList:" +  boardList );
		request.setAttribute("itemList", itemList);
		
		// 현재 category 정보
		CategoryVo  categoryVo  = categoryDao.getCategory(category_code_id);
		request.setAttribute("categoryVo", categoryVo);
		
		
		// paging 관련변수 처리		
		PageVo  pageVo = new PageVo(nowpage, pagecount, totalcount);
		request.setAttribute("pageVo", pageVo);
		System.out.println("pageVo:" + pageVo);
	    		
		String path = "/view/category.jsp";
		System.out.println(path);
		request.getRequestDispatcher(path).forward(request, response);
		
		
		
	}

}
