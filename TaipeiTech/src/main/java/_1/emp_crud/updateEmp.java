package _1.emp_crud;

import init.AllTableAccessBean;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateEmp
 */
@WebServlet("/updateEmp")
public class updateEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		try {
			String empno = request.getParameter("empno");
			int iEmpno = Integer.parseInt(empno);
			String ename = request.getParameter("ename");
			String job = request.getParameter("job");
			String mgr = request.getParameter("mgr");
			int iMgr = Integer.parseInt(mgr);
			String hiredate = request.getParameter("hiredate");
			String sal = request.getParameter("sal");
			double dSal = Double.parseDouble(sal);
			String comm = request.getParameter("comm");
			double dComm = Double.parseDouble(comm);
			String deptno = request.getParameter("deptno");
			int iDeptno = Integer.parseInt(deptno);
//			EmpTableBean tt = new EmpTableBean(iEmpno,ename,job,iMgr,hiredate,dSal,dComm,iDeptno);
			AllTableAccessBean ss = new AllTableAccessBean();
			EmpTableBean tt = new EmpTableBean(iEmpno,ename,job,hiredate,dSal,dComm,iDeptno);

			ss.updateBook(tt);
			
			AllTableAccessBean dd = new AllTableAccessBean();
			Collection<EmpTableBean> coll = dd.empTable();
			request.setAttribute("etb", coll);
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			return;
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}

}
