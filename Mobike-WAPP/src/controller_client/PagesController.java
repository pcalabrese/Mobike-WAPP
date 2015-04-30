package controller_client;

import java.net.URL;
import java.util.Map;

import javax.ws.rs.CookieParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

import utils.Crypter;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.view.Viewable;

@Path("/")
public class PagesController {
	
	private static final String BaseURI = "http://mobike.ddns.net/SRV/";
	// private final String BaseWebAppUri = "/WAPP/";
	Client client = Client.create();
	private final WebResource wr = client.resource(BaseURI);
	
	@GET
	public Response welcome(){
		return Response.ok(new Viewable("/landing.jsp")).build();
	}
	
	
	@GET
	@Path("/landing")
	@Produces(MediaType.TEXT_HTML)
	public Response landing() {
		return Response.ok(new Viewable("/landing.jsp")).build();
	}
	
	
	
	@SuppressWarnings("unchecked")
	@GET
	@Path("/home")
	@Produces(MediaType.TEXT_HTML)
	public Response home(@CookieParam("token") String userToken) {
		Crypter crypter = new Crypter();
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> map;
		Map<String, String> map2;
		try {
			map = mapper.readValue(new URL(BaseURI.concat("routes/retrieve/lastuploaded")), Map.class);
			String routesjson = crypter.decrypt(map.get("routes"));
			map2 = mapper.readValue(new URL(BaseURI.concat("events/retrieve/lastuploaded")), Map.class);
			String eventsjson = crypter.decrypt(map2.get("events"));
			JSONObject outputOBJ = new JSONObject();
			JSONArray routes = new JSONArray(routesjson);
			JSONArray events = new JSONArray(eventsjson);
			JSONObject user = new JSONObject(crypter.decrypt(userToken));			
			outputOBJ.put("routes", routes);
			outputOBJ.put("user", user);
			outputOBJ.put("events", events);	
			return Response.ok(new Viewable("/index.jsp", outputOBJ)).build();
		} catch ( Exception e) {
			e.printStackTrace();
			return Response.status(500).build();
		}
	}
	
	
	@SuppressWarnings("unchecked")
	@GET
	@Path("/itineraries")
	@Produces(MediaType.TEXT_HTML)
	public Response itineraries(@CookieParam("token") String userToken) {
		Map<String,String> routesmap = null;
		ObjectMapper mapper = new ObjectMapper();
		Crypter crypter = new Crypter();
		JSONObject outputOBJ = new JSONObject();
		try {
			routesmap = (Map<String,String>) mapper.readValue(new URL(BaseURI.concat("routes/retrieveall")), Map.class);
			String routesjson = crypter.decrypt(routesmap.get("routes"));
			
			JSONArray routes = new JSONArray(routesjson);
			JSONObject user = new JSONObject(crypter.decrypt(userToken));
			outputOBJ.put("routes", routes);
			outputOBJ.put("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			return Response.status(500).build();
		}
		return Response.ok(new Viewable("/itineraries.jsp", outputOBJ)).build();
	}
	
	@GET
	@Path("/itineraries/{id}")
	@Produces(MediaType.TEXT_HTML)
	public Response itineraryDetails(@PathParam("id") long id, @CookieParam("token") String userToken) {
		String json = wr.path("/routes").path("/retrieve").path("/"+id).get(String.class);
		Crypter crypter = new Crypter();
		JSONObject outputOBJ = new JSONObject();
		try {
			JSONObject jsonreceived = new JSONObject(json);
			outputOBJ.put("route", new JSONObject(crypter.decrypt(jsonreceived.getString("route"))));
			outputOBJ.put("user", new JSONObject(crypter.decrypt(userToken)));
			outputOBJ.put("gpx", jsonreceived.getString("gpx"));
			
			
		} catch (Exception e) {
			return Response.status(500).build();
		}
		
		return Response.ok(new Viewable("/itinerarydetail.jsp", outputOBJ)).build();
	}
	
	@GET
	@Path("/itineraries/new")
	@Produces(MediaType.TEXT_HTML)
	public Response newItinerary(@CookieParam("token") String userToken){
		Crypter crypter = new Crypter();
		JSONObject outputOBJ = new JSONObject();
		try {
			JSONObject user = new JSONObject(crypter.decrypt(userToken));
			outputOBJ.put("user", user);
		}
		catch (Exception e) {
			return Response.status(500).build();
		}
		
		return Response.ok(new Viewable("/itinerarycreation.jsp",outputOBJ)).build();
	}
	
	@GET
	@Path("/events")
	@Produces(MediaType.TEXT_HTML)
	public Response events(@CookieParam("token") String userToken) {
		String crEventJson;
		Crypter crypter = new Crypter();
		
		JSONObject outputOBJ = new JSONObject();
		try {
			crEventJson = wr.path("/events").path("/retrieveallws").queryParam("user", userToken).accept(MediaType.APPLICATION_JSON).get(String.class);
			JSONObject receivedJson = new JSONObject(crEventJson);
			outputOBJ.put("events", new JSONArray(crypter.decrypt(receivedJson.getString("events"))));
			outputOBJ.put("user", new JSONObject(crypter.decrypt(userToken)));
		} catch (Exception e1) {
			
			e1.printStackTrace();
			return Response.status(500).build();
		}
		
		return Response.ok(new Viewable("/events.jsp",outputOBJ)).build();
	}
	
	@GET
	@Path("/events/{id}")
	@Produces("text/html")
	public Response eventId(@PathParam("id") long id, @CookieParam("token") String userToken) {
		String json = wr.path("/events").path("/retrieve").path("/"+id).get(String.class);
		Crypter crypter = new Crypter();
		JSONObject outputOBJ = new JSONObject();
		try {
			JSONObject jsonreceived = new JSONObject(json);
			outputOBJ.put("event", new JSONObject(crypter.decrypt(jsonreceived.getString("event"))));
			outputOBJ.put("user", new JSONObject(crypter.decrypt(userToken)));
		} catch (Exception e) {
			return Response.status(500).build();
		}
		return Response.ok(new Viewable("/eventdetail.jsp", outputOBJ)).build();
	}
	
	@GET
	@Path("/events/new")
	@Produces(MediaType.TEXT_HTML)
	public Response eventnew(@CookieParam("token") String userToken) {
			
		Crypter crypter = new Crypter();
		JSONObject outputOBJ = null;
		
		if(userToken != null){
			try {
				outputOBJ = new JSONObject();
				outputOBJ.put("user", new JSONObject(crypter.decrypt(userToken)));
			} catch (Exception e) {
				
				e.printStackTrace();
				return Response.status(500).build();
			}
		}
		return  Response.ok(new Viewable("/eventcreation.jsp", outputOBJ)).build();
	}
	
	
	
	@GET
	@Path("/contacts")
	@Produces(MediaType.TEXT_HTML)
	public Response Contacts(@CookieParam("token") String userToken) {
		
		Crypter crypter = new Crypter();
		
		JSONObject outputOBJ = null;
		
		if(userToken != null){
			System.out.println("usertoken not not null");
			try {
				outputOBJ = new JSONObject();
				outputOBJ.put("user", new JSONObject(crypter.decrypt(userToken)));
			} catch (Exception e) {
				
				e.printStackTrace();
				return Response.status(500).build();
			}
		}
		
		
		
		return  Response.ok(new Viewable("/contacts.jsp", outputOBJ)).build();
	}
	
	@GET
	@Path("/androidapp")
	@Produces(MediaType.TEXT_HTML)
	public Response androidapp(){
		return Response.ok(new Viewable("/androidapp.jsp",null)).build();
	}
	
	@SuppressWarnings("unused")
	@GET
	@Path("/users/profile")
	@Produces(MediaType.TEXT_HTML)
	public Response userDetail(@CookieParam("token") String userToken) {
		Crypter crypter = new Crypter();
		String plainUser = null;
		JSONObject user = null;
		String id = null;
		try {
			 plainUser = crypter.decrypt(userToken);
			 user = new JSONObject(plainUser);
			 id = user.getString("id");
		} catch (Exception e) {
			
			e.printStackTrace();
			return Response.status(500).build();
		}
		
		if(user != null){
			ClientResponse response = wr.path("/users/getDetails").queryParam("id", id).queryParam("token", userToken).get(ClientResponse.class);
			
			if (response.getStatus()==200){
				try {
					JSONObject responseEntity = new JSONObject(response.getEntity(String.class));
					JSONObject outputOBJ = new JSONObject();
					JSONObject plainUserDetails = new JSONObject(crypter.decrypt(responseEntity.getString("user")));
					outputOBJ.put("user", plainUserDetails);
					
					return Response.ok(new Viewable("/userprofile.jsp", outputOBJ)).build();
				} catch (Exception e) {
					
					e.printStackTrace();
					return Response.status(500).build();
				}
				
				
			}
			else {
				return Response.status(response.getStatus()).build();
			}
		}
		else {
			return Response.status(500).build();
		}
		
		
	}
	
	@GET
	@Path("/test")
	@Produces(MediaType.TEXT_HTML)
	public Response test(){
		return Response.ok(new Viewable("/test.jsp",null)).build();
	}
}
