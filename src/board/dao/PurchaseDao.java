package board.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.db.DBConn;
import board.vo.PurchaseVo;
import oracle.jdbc.OracleCallableStatement;

public class PurchaseDao {

	public List<PurchaseVo> getPurchaseList() {
		List<PurchaseVo> purchaseList = new ArrayList<PurchaseVo>();
		
		Connection 			conn 	= null;
		CallableStatement 	cstmt	= null;
		ResultSet			rs		= null;
		
	try {
		DBConn  db  = new DBConn();
		conn		= db.getConnection();
		String sql 	= "{ CALL PKG_TRAVEL.PROC_PURCHASE_LIST(?)}";
		cstmt		= conn.prepareCall(sql);
		
		cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.execute();

		OracleCallableStatement ocstmt = (OracleCallableStatement) cstmt;
		rs = ocstmt.getCursor(1);
		while(rs.next()) {
			PurchaseVo vo = new PurchaseVo();
			vo.setPurchase_id( rs.getString("purchase_id"));
			vo.setItem_id(rs.getString("Item_id"));
			vo.setCustomer_id( rs.getString("customer_id"));
			vo.setCnt( rs.getString("cnt"));
			vo.setRegdate( rs.getString("regdate"));
			
			purchaseList.add(vo);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs	 !=null && !rs.isClosed() ) rs.close();
				if(cstmt !=null && !cstmt.isClosed() ) cstmt.close();
				if(conn  !=null && !conn.isClosed() ) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return purchaseList;
	}
	
	public void purchaseInsert(PurchaseVo purchaseVo) {
		
		Connection 			conn  	= null;
		CallableStatement	cstmt	= null;
	try {	
		DBConn  db  =  new DBConn();
		conn		= db.getConnection();
		String sql 	= "{CALL PKG_TRAVEL.PROC_PURCHASE_INSERT(?)}";
		cstmt		=  conn.prepareCall(sql);
		
		cstmt.setString(1, purchaseVo.getPurchase_id());
		cstmt.execute();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt != null && !cstmt.isClosed() ) cstmt.close();
				if(conn  != null && !cstmt.isClosed() ) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}		
		}

	}
	
}
