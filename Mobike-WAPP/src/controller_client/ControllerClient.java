package controller_client;


import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.view.Viewable;

@Path("/")
public class ControllerClient {

	private static final String BaseURI = "http://mobike.ddns.net/SRV/";
	
	Client client = Client.create();
	private final WebResource wr = client.resource(BaseURI);
	
	@GET
	public Viewable welcome(){
		return new Viewable("/index.jsp", null);
	}
	
	@GET
	@Path("/landing")
	public Viewable landing(){
		return new Viewable("/landing.jsp");
	}
	
	@GET
	@Path("/home")
	public Viewable home(){
		return new Viewable("/index.jsp", null);
	}
	
	@GET
	@Path("/itineraries")
	public Viewable itineraries(){
		return new Viewable("/itineraries.html", "itineraries");
	}
	
	@GET
	@Path("/aboutus")
	public Viewable aboutus(){
		return new Viewable("/aboutus.html", "aboutus");
	}
	
	@GET
	@Path("/getitineraries")
	@Produces(MediaType.APPLICATION_JSON)
	public String getItineraries(){
		String output = wr.path("/routes").path("/retrieveall").accept(MediaType.APPLICATION_JSON).get(String.class);
		return output;
		
	}
	@GET
	@Path("/getitnbyid/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getItnById(@PathParam ("id") long id){
		String output = wr.path("/routes").path("/retrieve").path("/"+id).accept(MediaType.APPLICATION_JSON).get(String.class);
		return output;
	
	}
	
	@GET
	@Path("/itineraries/{id}")
	public Viewable itineraryDetails(@PathParam ("id") long id){
		return new Viewable("/itinerarydetail.html", "details");
	}
	@GET
	@Path("/itntest")
	@Produces("text/html")
	public Viewable itntest(@Context HttpServletRequest req){
		HttpSession session = req.getSession(true);
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("chiave1", 1);
		map.put("chiave2", 2);
		map.put("chiave3", 3);
		session.setAttribute("mappa", map);
		return new Viewable("/test.jsp",null);
	}
	
	@POST
	@Path("/login")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String loginok(String json, @Context HttpServletRequest req){
		Gson gson = new GsonBuilder().create();
		Properties pr = gson.fromJson(json, Properties.class);
		
		HttpSession session = req.getSession(true);
		Map <String,String> user = new HashMap<String,String>();
		user.put("name", pr.getProperty("name"));
		user.put("surname", pr.getProperty("surname"));
		user.put("email", pr.getProperty("email"));
		
		
		session.setAttribute("user", user);
		
		
		return "/WAPP/home";
	}
	
}