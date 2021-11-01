package board.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import board.db.DBConn;
import board.vo.CustomerVo;

public class CustomerDao {

	public CustomerVo getLogin(String customer_id, String passwd) {

		CustomerVo			cVo		=	null;
		Connection			conn	=	null;
		CallableStatement	cstmt	=	null;
		
		
		try {
			DBConn	db	=	new	DBConn();
			conn		=	db.getConnection();
			String	sql	=	"{ CALL PKG_TRAVEL.PROC_CUSTOMER_LOGIN(?,?,?) }";
			cstmt	=	conn.prepareCall(sql);
			 
			cstmt.setString(1,customer_id);
			cstmt.setString(2,passwd);
			cstmt.registerOutParameter(3, Types.NUMERIC);
			
			cstmt.executeQuery();
			
			int logincheck	=	cstmt.getInt(3);
			
			cVo	=	new CustomerVo(logincheck);
			System.out.println(cVo);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if( cstmt != null ) cstmt.close();
				if( conn  != null ) conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
		return cVo;
		
		
		
	}

	public void insertCustomer(CustomerVo cVo) {
		
			Connection			conn	=	null;
			CallableStatement 	cstmt	=	null;
	
		
			try {
				DBConn	db	=	new DBConn();
				conn	=	db.getConnection();
				String	sql	=	"{CALL PKG_TRAVEL.PROC_CUSTOMER_JOIN(?,?,?,?,?,?,?)}";
				cstmt	=	conn.prepareCall(sql);
				
				cstmt.setString(1, cVo.getCustomer_id());
				cstmt.setString(2, cVo.getCustomer_name());
				cstmt.setString(3, cVo.getCustomer_nickname());
				cstmt.setString(4, cVo.getPasswd());
				cstmt.setString(5, cVo.getEmail());
				cstmt.setString(6, cVo.getTel());
				cstmt.setString(7, cVo.getAddress());
				
				cstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}	finally {
				
				try {
					if( cstmt != null ) cstmt.close();
					if( conn  != null ) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
		
	}
	
}
