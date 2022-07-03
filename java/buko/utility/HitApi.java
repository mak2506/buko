package buko.utility;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class HitApi {

	public static String fetchResults(String key)
	{
		//return key;
		var url = "https://www.googleapis.com/books/v1/volumes?q="+key;
		var req = HttpRequest.newBuilder().GET().uri(URI.create(url)).build();
		var client = HttpClient.newBuilder().build();
		HttpResponse<String> res;
		String html="";
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
					JSONObject image = (JSONObject)vol.get("imageLinks");
					//System.out.println();
					//html = html+"<p>"+vol.get("title")+"</p>";
					html = html+"<div class=\"card m-2\" style=\"width: 20%\">\r\n"
							+ "  <img class=\"card-img-top\" src=\""+image.get("thumbnail")+"\" alt=\"Card image\">\r\n"
							+ "  <div class=\"card-body\">\r\n"
							+ "    <h4 class=\"card-title\">"+vol.get("title")+"</h4>\r\n"
							+ "    <p class=\"card-text\">"+vol.get("title")+"</p>\r\n"
							+ "    <a href=\""+vol.get("previewLink")+"\" class=\"btn btn-primary\">View in Google</a>\r\n"
							+ "  </div>\r\n"
							+ "</div>";
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
		return html;
		//return "result";
	}
	
}
