package util;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

@WebServlet("/upload")
public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public FileServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getRequestURL());
		try {
			BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
			Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
			List<BlobKey> blobKeys = blobs.get("upload");

			JSONObject outData = new JSONObject();
			if (blobKeys == null || blobKeys.isEmpty()) {
				outData.put("uploaded", false);
			} else {
				outData.put("uploaded", true);
				outData.put("url", request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/serve?blob-key=" + blobKeys.get(0).getKeyString());
			}
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(outData.toString());
		} catch (Exception e) {
			response.getWriter().print(e);
		}

	}

}
