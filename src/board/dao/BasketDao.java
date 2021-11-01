//package board.dao;
//
//import java.sql.CallableStatement;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Types;
//import java.util.ArrayList;
//
//import board.db.DBConn;
//import board.vo.BasketVo;
//import board.vo.CustomerVo;
//
//public class BasketDao {
//	
//	public BasketVo getBasketList(String basket_id, String customer_id, String item_id, String cnt) {
//	
//
//		BasketVo			bVo		=	null;
//		Connection			conn	=	null;
//		CallableStatement	cstmt	=	null;
//		
//		
//		try {
//			DBConn	db	=	new	DBConn();
//			conn		=	db.getConnection();
//			String	sql	=	"{ CALL PKG_TRAVEL.PROC_CUSTOMER_LOGIN(?,?,?,?) }";
//			cstmt	=	conn.prepareCall(sql);
//			
//			cstmt.setString(1,basket_id);
//			cstmt.setString(2,customer_id);
//			cstmt.setString(3,item_id);
//			cstmt.setString(4,cnt);
//			
//			cstmt.executeQuery();
//			
//			int logincheck	=	cstmt.getInt(3);
//			
//			cVo	=	new CustomerVo(logincheck);
//			System.out.println(cVo);
//			
//			
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			try {
//				if( cstmt != null ) cstmt.close();
//				if( conn  != null ) conn.close();
//			} catch (SQLException e) {
//				
//				e.printStackTrace();
//			}
//		}
//		
//		return bVo;
//		
//		
//		
//	}
//
//			
//			private static final String RETRIEVE_STMT
//			= "SELECT * FROM BASKET WHERE CUSTOMER_ID = ? ";
//			private static final String GETID_STMT = "SELECT CNT FROM BASKET";
//			private static final String ADD_STMT = "INSERT INTO BASKET VALUES(?,?,?,?,?)";
//			private static final String DELETE_STMT = "UPDATE BASKET SET CNT = ? WHERE CUSTOMER_ID = ? AND Basket_ID = ?";
//			private static final String CLEAN_STMT = "UPDATE BASKET_ADD SET CNT = 0 WHERE CUSTOMER_ID = ?";
//			
//	
//			ArrayList<Basket> basketRetrieve(String basket_id) throws SQLException {
//				ArrayList<Basket> baskets = new ArrayList<Basket>();
//				CallableStatement cstmt;
//				try {
//
//	public void insertCustomer(CustomerVo cVo) {
//		
//			Connection			conn	=	null;
//			CallableStatement 	cstmt	=	null;
//	
//		
//			try {
//				DBConn	db	=	new DBConn();
//				conn	=	db.getConnection();
//
//				cstmt	=	conn.prepareCall(sql);
//				
//				cstmt.setString(1, cVo.getCustomer_id());
//				cstmt.setString(2, cVo.getCustomer_name());
//				cstmt.setString(3, cVo.getCustomer_nickname());
//				cstmt.setString(4, cVo.getPasswd());
//				cstmt.setString(5, cVo.getEmail());
//				cstmt.setString(6, cVo.getTel());
//				cstmt.setString(7, cVo.getAddress());
//				
//				cstmt.executeUpdate();
//				
//				
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}	finally {
//				
//				try {
//					if( cstmt != null ) cstmt.close();
//					if( conn  != null ) conn.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//				
//			}
//		
//	}
//	
//}
//
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet rset = null;
//        try {
//            conn = dbconn.getConnection();
//            stmt = conn.prepareStatement(RETRIEVE_STMT);
//            stmt.setString(1, basket_id);
//            rset = stmt.executeQuery();
//            while (rset.next()) {
//                String basket_id 	= rset.getString(1);
//                String item_id 		= rset.getString(2);
//                String customer_id 	= rset.getString(3);
//                String cnt	 		= rset.getString(4);
//                String regdate		= rset.getString(5);
//                baskets.add(new Basket(basket_id, item_id, customer_id, cnt, regdate));
//            }
//            return baskets;
//        } catch (SQLException se) {
//            throw new RuntimeException(
//                    "A database error occurred. " + se.getMessage());
//        } catch (Exception e) {
//            throw new RuntimeException("Exception: " + e.getMessage());
//        } finally {
//            if (rset != null) {
//                try {
//                    rset.close();
//                } catch (SQLException se) {
//                    se.printStackTrace(System.err);
//                }
//            }
//            if (stmt != null) {
//                try {
//                    stmt.close();
//                } catch (SQLException se) {
//                    se.printStackTrace(System.err);
//                }
//            }
//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (Exception e) {
//                    e.printStackTrace(System.err);
//                }
//            }
//        }
//    }
//    void basketAdd(String customer_id, String item_id, String cnt) {
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet rset = null;
//        try {
//            conn = dbconn.getConnection();
//            stmt = conn.prepareStatement(GETID_STMT);
//            rset = stmt.executeQuery();
//            int ID = -1;
//            rset.next();
//            ID = rset.getInt("COUNT(BASKET_ID)");
//            ID++;
//            stmt = conn.prepareStatement(ADD_STMT);
//            stmt.setInt(1, ID);
//            stmt.setString(2, customer_id);
//            stmt.setString(3, item_id);
//            stmt.setString(4, cnt);
//            stmt.executeQuery();
//        } catch (SQLException se) {
//            throw new RuntimeException(
//                    "A database error occurred. " + se.getMessage());
//        } finally {
//            if (stmt != null) {
//                try {
//                    stmt.close();
//                } catch (SQLException se) {
//                    se.printStackTrace(System.err);
//                }
//            }
//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (Exception e) {
//                    e.printStackTrace(System.err);
//                }
//            }
//        }
//    }
//    void basketDelete(int userid, int basketid) {
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet rset = null;
//        try {
//            conn = dbconn.getConnection();
//            stmt = conn.prepareStatement(DELETE_STMT);
//            stmt.setInt(1, userid);
//            stmt.setInt(2, basketid);
//            stmt.executeQuery();
//        } catch (SQLException se) {
//            throw new RuntimeException(
//                    "A database error occurred. " + se.getMessage());
//        } finally {
//            if (stmt != null) {
//                try {
//                    stmt.close();
//                } catch (SQLException se) {
//                    se.printStackTrace(System.err);
//                }
//            }
//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (Exception e) {
//                    e.printStackTrace(System.err);
//                }
//            }
//        }
//    }
//    void basketClean(String customer_id) {
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet rset = null;
//        try {
//            conn = dbconn.getConnection();
//            stmt = conn.prepareStatement(CLEAN_STMT);
//            stmt.setString(1, customer_id);
//            stmt.executeQuery();
//        } catch (SQLException se) {
//            throw new RuntimeException(
//                    "A database error occurred. " + se.getMessage());
//        } finally {
//            if (stmt != null) {
//                try {
//                    stmt.close();
//                } catch (SQLException se) {
//                    se.printStackTrace(System.err);
//                }
//            }
//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (Exception e) {
//                    e.printStackTrace(System.err);
//                }
//            }
//        }
//    }
//}