package board.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import board.db.DBConn;
import board.vo.CategoryVo;
import board.vo.ItemVo;
import oracle.jdbc.OracleCallableStatement;

public class ItemDao {
	
	Connection        conn  = null; 
	CallableStatement cstmt = null;
	ResultSet         rs    = null;


	public List<ItemVo> getItemList(String category_code_id, int nowpage, int pagecount) {
		
		List<ItemVo>     list  = new ArrayList<ItemVo>();
	
	    try {
			DBConn  db   =  new DBConn();
			conn         =  db.getConnection();
			String  sql  =  "{CALL  PKG_TRAVEL.PROC_ITEM_LIST(?, ?, ?, ?, ?) }";
			cstmt        =  conn.prepareCall(sql);
			
			cstmt.setString(1,  category_code_id);     
			cstmt.setInt(2,  nowpage);                // nowpage     
			cstmt.setInt(3,  pagecount);              // pagecount     
			cstmt.registerOutParameter(4, 
				Types.NUMERIC );                      // 결과 , 전체자료수
			cstmt.registerOutParameter(5, 
					oracle.jdbc.OracleTypes.CURSOR ); // 결과 , cursor
			
			cstmt.execute();  // 스토어드 프로시저 실행
									
			OracleCallableStatement ocstmt = (OracleCallableStatement) cstmt;
			
			int  totalcount  = ocstmt.getInt(4);
			
			rs    =     ocstmt.getCursor(5);
			while( rs.next() ) {
				String   item_id       =  rs.getString("item_id");
				String   item_name      =  rs.getString("item_name");
				String   item_cont     =  rs.getString("item_cont");   
				String   regdate    =  rs.getString("regdate");   
				int      price  =  rs.getInt("price");
				int      buycount       =  rs.getInt("buycount");
		
				ItemVo  itemVo    =  new ItemVo(item_id, item_name, item_cont, category_code_id, price, regdate, buycount, totalcount);
				
				list.add(itemVo);				
			}
			
			
		} catch (SQLException e) {;
			e.printStackTrace();
		}  finally {
			try {
				if( rs    != null ) rs.close();
				if( cstmt != null ) cstmt.close();
				if( conn  != null ) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
				
		return list;
	}


}
