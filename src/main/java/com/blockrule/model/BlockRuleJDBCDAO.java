package com.blockrule.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import com.bocklist.model.BlockListVO;

public class BlockRuleJDBCDAO implements BlockRuleDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Team03";
	String userid = "sa";
	String passwd = "sa123456";
	
	private static final String INSERT_STMT = "INSERT INTO block_rule (blockRuleNo, blockRule, blockLimitTimes, blockTime) VALUES (?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE block_rule set blockRule=?, blockLimitTimes=?, blockTime=? WHERE blockRuleNo = ?";
	private static final String DELETE_STMT = "DELETE FROM block_rule WHERE blockRuleNo = ?";	
	private static final String GET_ONE_STMT = "SELECT blockRuleNo , blockRule, blockLimitTimes, blockTime FROM block_rule WHERE blockRuleNo = ?";
	private static final String GET_ALL_STMT = "SELECT blockRuleNo , blockRule, blockLimitTimes, blockTime FROM block_rule";
	private static final String GET_blockLists_ByBlockRuleNo = "SELECT mamberNo,blockRuleNo,violationDate,reservationNo,blockState FROM bock_list where blockRuleNo = ? order by reservationNo";
	
	
	@Override
	public void insert(BlockRuleVO blockRuleVO){
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setShort(1, blockRuleVO.getBlockRuleNo());
			pstmt.setString(2, blockRuleVO.getBlockRule());
			pstmt.setInt(3, blockRuleVO.getBlockLimitTimes());
			pstmt.setInt(4, blockRuleVO.getBlockTime());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(BlockRuleVO blockRuleVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, blockRuleVO.getBlockRule());
			pstmt.setInt(2, blockRuleVO.getBlockLimitTimes());
			pstmt.setInt(3, blockRuleVO.getBlockTime());
			pstmt.setShort(4, blockRuleVO.getBlockRuleNo());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void delete(Short blockRuleNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setShort(1, blockRuleNo);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public BlockRuleVO findByPrimaryKey(Short blockRuleNo) {
		BlockRuleVO blockRuleVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setShort(1, blockRuleNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				blockRuleVO = new BlockRuleVO();
				blockRuleVO.setBlockRuleNo(rs.getShort("blockRuleNo"));
				blockRuleVO.setBlockRule(rs.getString("blockRule"));
				blockRuleVO.setBlockLimitTimes(rs.getInt("blockLimitTimes"));
				blockRuleVO.setBlockTime(rs.getInt("blockTime"));
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		return blockRuleVO;
	}

	@Override
	public List<BlockRuleVO> getAll() {
		List<BlockRuleVO> list = new ArrayList<BlockRuleVO>();
		BlockRuleVO blockRuleVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				blockRuleVO = new BlockRuleVO();
				blockRuleVO.setBlockRuleNo(rs.getShort("blockRuleNo"));
				blockRuleVO.setBlockRule(rs.getString("blockRule"));
				blockRuleVO.setBlockLimitTimes(rs.getInt("blockLimitTimes"));
				blockRuleVO.setBlockTime(rs.getInt("blockTime"));
				
				list.add(blockRuleVO);
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
		
	}

	@Override
	public Set<BlockListVO> getListsByBlockRuleNo(Short blockRuleNo) {
		Set<BlockListVO> set = new LinkedHashSet<BlockListVO>();
		BlockListVO blockListVO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
	
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_blockLists_ByBlockRuleNo);
			pstmt.setShort(1, blockRuleNo);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				blockListVO = new BlockListVO();
				blockListVO.setMamberNo(rs.getInt("mamberNo"));
				blockListVO.setBlockRuleNo(rs.getShort("blockRuleNo"));
				blockListVO.setViolationDate(rs.getString("violationDate"));
				blockListVO.setReservationNo(rs.getInt("reservationNo"));
				blockListVO.setBlockState(rs.getString("blockState"));

				set.add(blockListVO); 
			}
	

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return set;
	}

}
