package board.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.db.DBConn;
import board.vo.CategoryVo;
import oracle.jdbc.OracleCallableStatement;

public class CategoryDao {

	public List<CategoryVo> getCategoryList() {
		List<CategoryVo> categoryList = new ArrayList<CategoryVo>();
		Connection        conn  = null; 
		CallableStatement cstmt = null;
		ResultSet         rs    = null;
		
		try {
			DBConn  db = new DBConn();
			conn       = db.getConnection();
			String sql = "{CALL PKG_TRAVEL.PROC_CATEGORY_LIST(?)}";
			cstmt      = conn.prepareCall(sql) ;
			
			cstmt.registerOutParameter( 1, 
				oracle.jdbc.OracleTypes.CURSOR	);
			cstmt.execute();
			
			OracleCallableStatement ocstmt = (OracleCallableStatement) cstmt;
			rs  = ocstmt.getCursor(1);
			
			while(rs.next()) {
				CategoryVo   vo  =  new CategoryVo();
				vo.setCategory_code_id( rs.getString("Category_code_id") );
				vo.setCategory_code_name( rs.getString("Category_code_name") );
				
				categoryList.add(vo);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs     !=null && !rs.isClosed() )    rs.close();
				if(cstmt  !=null && !cstmt.isClosed() ) cstmt.close();
				if(conn   !=null && !conn.isClosed() )  conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return categoryList;
	}

}
