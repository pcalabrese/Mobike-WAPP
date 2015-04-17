package controller_client;

import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.CookieParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

import utils.Crypter;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.view.Viewable;

@Path("/")
public class PagesController {
	
	private static final String BaseURI = "http://mobike.ddns.net/SRV/";
	Client client = Client.create();
	private final WebResource wr = client.resource(BaseURI);
	
	@GET
	@Path("/landing")
	@Produces(MediaType.TEXT_HTML)
	public Response landing() {
		return Response.ok(new Viewable("/landing.jsp")).build();
	}
	
	
	
	@GET
	@Path("/home")
	@Produces(MediaType.TEXT_HTML)
	public Response home() {
		return Response.ok(new Viewable("/index.jsp")).build();
	}
	
	
	@GET
	@Path("/itineraries")
	@Produces(MediaType.TEXT_HTML)
	public Response itineraries() {
		return Response.ok(new Viewable("/itineraries.jsp")).build();
	}
	
	@GET
	@Path("/itineraries/{id}")
	@Produces(MediaType.TEXT_HTML)
	public Response itineraryDetails(@PathParam("id") long id, @CookieParam("token") String userToken) {
		
		return Response.ok(new Viewable("/itinerarydetail.jsp")).build();
	}
	
	@GET
	@Path("/itineraries/new")
	@Produces(MediaType.TEXT_HTML)
	public Response newItinerary(){
		return Response.ok(new Viewable("/itncreation.jsp",null)).build();
	}
	
	@GET
	@Path("/events")
	@Produces(MediaType.TEXT_HTML)
	public Response events() {
		return Response.ok(new Viewable("/events.jsp")).build();	
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
	public Viewable eventnew() {
		return new Viewable("/eventcreation.jsp", null);
	}
	
	@GET
	@Path("/aboutus")
	@Produces(MediaType.TEXT_HTML)
	public Viewable aboutus() {
		return new Viewable("/aboutus.jsp", null);
	}
	
	@GET
	@Path("/androidapp")
	@Produces(MediaType.TEXT_HTML)
	public Response androidapp(){
		return Response.ok(new Viewable("/androidapp.jsp",null)).build();
	}
	
	@GET
	@Path("/test")
	@Produces(MediaType.TEXT_HTML)
	public Response test(){
		return Response.ok(new Viewable("/test.jsp",null)).build();
	}
}
