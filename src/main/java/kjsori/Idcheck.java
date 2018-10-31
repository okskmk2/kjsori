package kjsori;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

@WebServlet("/api/idcheck")
public class Idcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Idcheck() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	BufferedReader input = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
		StringBuilder builder = new StringBuilder();
		String buffer;
		while ((buffer = input.readLine()) != null) {
			if (builder.length() > 0) {
				builder.append("\n");
			}
			builder.append(buffer);
		}
		response.setCharacterEncoding("UTF-8");
		JSONObject jsoninput = new JSONObject(URLDecoder.decode(builder.toString(), "UTF-8")); // this parses the json
		String id = (String) jsoninput.get("id");
		
		Filter userIdf = new FilterPredicate("userId", FilterOperator.EQUAL, id);
		Query q = new Query("user").setFilter(userIdf);
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		PreparedQuery pq = datastore.prepare(q);
		Entity user = pq.asSingleEntity();
		JSONObject jsonoutput = new JSONObject();
		if (user == null) {
			jsonoutput.put("message", "사용가능한 아이디입니다.");
		} else {
			jsonoutput.put("message", "이미 존재하는 아이디입니다.");
		}
		response.getWriter().println(jsonoutput.toString());
	}
	
}
