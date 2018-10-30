package account;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

import util.KjsoriConst;

@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = -6564474565618227499L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.sendRedirect(KjsoriConst.URL_LOGIN);
		}
		String userId = (String) session.getAttribute("userId");
		if (!KjsoriConst.ADMIN.equals(userId)) {
			request.setAttribute("errMsg", "관리자 권한이 필요합니다.");
			request.getRequestDispatcher(KjsoriConst.URL_ERROR).forward(request, response);
		}

		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("user");
		PreparedQuery pq = ds.prepare(q);
		Iterator<Entity> iterator = pq.asIterator();
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		while (iterator.hasNext()) {
			Entity entity = iterator.next();
			Map<String, Object> map = entity.getProperties();
			list.add(map);
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/member/memberList.jsp").forward(request, response);
	}

}
