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


@WebServlet("/queryEmp")
public class queryEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		try {
			AllTableAccessBean ss = new AllTableAccessBean();
			Collection<EmpTableBean> coll = ss.empTable();
			request.setAttribute("etb", coll);
			RequestDispatcher rd = request.getRequestDispatcher(response.encodeRedirectURL("/index.jsp"));
				rd.forward(request, response);
				return;
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}

}
