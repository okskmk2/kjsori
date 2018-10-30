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
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

import util.KjsoriConst;
import util.SHA256Digestor;

@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = -8472416348898294833L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/join.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		String userId = req.getParameter("kjsori_userId");
		String userPwd = req.getParameter("kjsori_userPwd");
		String userName = req.getParameter("kjsori_userName");
		userPwd = SHA256Digestor.INSTANCE.digestString(userPwd);
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Filter filter = new FilterPredicate("userId", FilterOperator.EQUAL, userId);
		Query q = new Query("user").setFilter(filter);
		PreparedQuery pq = ds.prepare(q);

		if (pq.asSingleEntity() != null) {
			req.setAttribute("errMsg", "이미 존재하는 아이디입니다.");
			req.getRequestDispatcher(KjsoriConst.URL_ERROR).forward(req, response);
		} else {
			Entity user = new Entity("user");
			user.setProperty("userId", userId);
			user.setProperty("userPwd", userPwd);
			user.setProperty("userName", userName);
			ds.put(user);
			req.getSession().setAttribute("userName", userName);
			req.getSession().setAttribute("userId", userId);
			req.getRequestDispatcher(KjsoriConst.URL_MAIN).forward(req, response);
		}
	}

}
