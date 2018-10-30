package account;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.CompositeFilter;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

import util.KjsoriConst;
import util.SHA256Digestor;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 8627912986695242294L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("kjsori_userId");
		String userPwd = request.getParameter("kjsori_userPwd");
		userPwd = SHA256Digestor.INSTANCE.digestString(userPwd);
		
		Filter userIdf = new FilterPredicate("userId", FilterOperator.EQUAL, userId);
		Filter userPwdf = new FilterPredicate("userPwd", FilterOperator.EQUAL, userPwd);
		CompositeFilter filter = CompositeFilterOperator.and(userIdf, userPwdf);
		Query q = new Query("user").setFilter(filter);
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		PreparedQuery pq = datastore.prepare(q);
		Entity user = pq.asSingleEntity();
		if (user == null) {
			request.setAttribute("errMsg", "로그인 정보가 없습니다.");
			request.getRequestDispatcher(KjsoriConst.URL_ERROR).forward(request, response);
		} else {
			request.getSession().setAttribute("userName", (String) user.getProperty("userName"));
			request.getSession().setAttribute("userId", (String) user.getProperty("userId"));
			response.sendRedirect("/");
		}
	}

}
