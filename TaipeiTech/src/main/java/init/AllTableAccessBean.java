package init;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.sql.DataSource;

import _1.emp_crud.EmpTableBean;

public class AllTableAccessBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private DataSource ds = null;

	public AllTableAccessBean() throws ServletException, IOException,
			NamingException {
		Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jdbcpra");
	}

	// ask
	public Collection<EmpTableBean> allTable(String sal) throws SQLException {
		EmpTableBean bean = null;
		PreparedStatement pStmt = null;
		Connection connection = null;
		ResultSet rs = null;
		Collection<EmpTableBean> coll = new ArrayList<EmpTableBean>();
		String queryString = "SELECT * FROM = ?";
		try {
			connection = ds.getConnection();
			pStmt = connection.prepareStatement(queryString);
			pStmt.setString(1, sal);
			rs = pStmt.executeQuery();
			while (rs.next()) {
				bean = new EmpTableBean();
				bean.setEmpno(rs.getInt(1));
				bean.setEname(rs.getString(2));
				bean.setJob(rs.getString(3));
				bean.setMgr(rs.getInt(4));
				bean.setHiredate(rs.getString(5));
				bean.setSal(rs.getDouble(6));
				bean.setComm(rs.getDouble(7));
				bean.setDeptno(rs.getInt(8));
				coll.add(bean);
			}
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pStmt != null) {
				try {
					pStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return coll;
	}

	// 方法二
	public Collection<EmpTableBean> empTable() throws SQLException {
		PreparedStatement pStmt = null;
		Connection connection = null;
		ResultSet rs = null;
		Collection<EmpTableBean> coll = new ArrayList<EmpTableBean>();

		try {
			String queryString = "SELECT * FROM emp";
			connection = ds.getConnection();
			pStmt = connection.prepareStatement(queryString);
			rs = pStmt.executeQuery();
			while (rs.next()) {
				EmpTableBean bean = new EmpTableBean();
				bean.setEmpno(rs.getInt(1));
				bean.setEname(rs.getString(2));
				bean.setJob(rs.getString(3));
				bean.setMgr(rs.getInt(4));
				bean.setHiredate(rs.getString(5));
				bean.setSal(rs.getDouble(6));
				bean.setComm(rs.getDouble(7));
				bean.setDeptno(rs.getInt(8));
				coll.add(bean);
			}
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pStmt != null) {
				try {
					pStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return coll;
	}

	// 更新
	// 修改一筆記錄
	public int updateBook(EmpTableBean bean) throws SQLException {
		int n = 0;
		String updateString = "UPDATE emp SET  ename=?,  job=?,  hiredate=?, sal=?, comm=?,deptno=? where empno =?";
		PreparedStatement pStmt = null;
		Connection connection = null;
		try {
			connection = ds.getConnection();
			pStmt = connection.prepareStatement(updateString);
			pStmt.clearParameters();

			pStmt.setString(1, bean.getEname());
			pStmt.setString(2, bean.getJob());
			pStmt.setString(3, bean.getHiredate());
			pStmt.setDouble(4, bean.getSal());
			pStmt.setDouble(5, bean.getComm());
			pStmt.setInt(6, bean.getDeptno());
			pStmt.setInt(7, bean.getEmpno());
			n = pStmt.executeUpdate();
		} finally {
			
			if (pStmt != null) {
				try {
					pStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return n;
	}
	public int deleteBook(int no) throws SQLException {
		int n = 0;
		String deleteString = "Delete from emp where empno =?";
		PreparedStatement pStmt = null;
		Connection connection = null;
		try {
			connection = ds.getConnection();
			pStmt = connection.prepareStatement(deleteString);
			pStmt.clearParameters();
			pStmt.setInt(1, no);
			n = pStmt.executeUpdate();
		} finally {
			
			if (pStmt != null) {
				try {
					pStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return n;
	}

}
