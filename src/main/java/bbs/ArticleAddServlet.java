package bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

import util.BhnUtil;

/**
 * Servlet implementation class ArticleAddServlet
 */
@WebServlet("/article")
public class ArticleAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleAddServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bbsType = request.getParameter("bbsType");
		String author_id = request.getParameter("author_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String regDt = BhnUtil.getCurrentLocalDateTimeStamp();
		Entity bbs = new Entity(bbsType);
		bbs.setProperty("author_id", author_id);
		bbs.setProperty("title", title);
		bbs.setProperty("content", content);
		bbs.setProperty("reg_dt", regDt);
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		ds.put(bbs);
		response.sendRedirect("/"+bbsType+".jsp");
	}

}
