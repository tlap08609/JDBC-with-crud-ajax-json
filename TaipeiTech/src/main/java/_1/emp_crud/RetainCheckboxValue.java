package _1.emp_crud;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RetainCheckboxValue")
public class RetainCheckboxValue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 練習 checkbox
		String[] ckbox = request.getParameterValues("ckbox");
		String str = "";
		if (ckbox != null) {
			for (int i = 0; i < ckbox.length; i++)
				str += " " + ckbox[i];

			System.out.println(str);
		} else
			System.out.println("未勾選");
	}

}
