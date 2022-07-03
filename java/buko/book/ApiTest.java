package buko.book;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ApiTest
 */
@WebServlet("/ApiTest")
public class ApiTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApiTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("Hello");
		var url = "https://www.googleapis.com/books/v1/volumes?q=all";
		var req = HttpRequest.newBuilder().GET().uri(URI.create(url)).build();
		//System.out.println(req);
		var client = HttpClient.newBuilder().build();
		HttpResponse<String> res;
		try {
			res = client.send(req, HttpResponse.BodyHandlers.ofString());
			JSONParser jp = new JSONParser();
			try {
				Object jsondata = jp.parse(res.body());
				JSONObject data = (JSONObject)jsondata;
				//System.out.println("JSON DATA");
				JSONArray items = (JSONArray)data.get("items");
				for(int i=0; i<items.size(); i++) {
					JSONObject item = (JSONObject)items.get(i);
					JSONObject vol = (JSONObject)item.get("volumeInfo");
					System.out.println(vol.get("title"));
					System.out.println();
				}
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
