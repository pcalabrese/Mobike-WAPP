package controller_client;


import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
	public String login(String json, @Context HttpServletRequest req){
		//inizializzo Gson
		Gson gson = new GsonBuilder().create();
		//Converto il json in un oggetto Properties
		Properties pr = gson.fromJson(json, Properties.class);
		
		
		String id = null;
		ClientResponse response = wr.path("/users").path("/auth").type(MediaType.APPLICATION_JSON).post(ClientResponse.class, json);
		id = response.getEntity(String.class);
	
		//Prendo la sessione e aggiungo i dati dell'utente in una HashMap User
		HttpSession session = req.getSession(true);
		Map <String,String> user = new HashMap<String,String>();
		user.put("name", pr.getProperty("name"));
		user.put("surname", pr.getProperty("surname"));
		user.put("email", pr.getProperty("email"));
		if(id!=null)
			user.put("id", id);
		
		//setto la HashMap come attributo della sessione
		session.setAttribute("user", user);
		
		
		
		//restituisco la URL a cui reindirizzare il browser
		return "/WAPP/home";
	}

	
	@GET
	@Path("/logout")
	@Consumes(MediaType.TEXT_PLAIN)
	public String logout(@Context HttpServletRequest req){
		HttpSession session = req.getSession();
		
		if(session != null){
			session.removeAttribute("user");
		}
		
		return "/WAPP/landing";	
	}
	
	@GET
	@Path("/getEvents")
	@Produces(MediaType.APPLICATION_JSON)
	public String getEvents(){
		String output = wr.path("/events").path("/retrieveall").accept(MediaType.APPLICATION_JSON).get(String.class);
		return output;
	}
	
	@GET
	@Path("/getEventById/{id}")
	@Produces(MediaType.APPLICATION_JSON)
		public String getEventById(@PathParam ("id") long id){
			String output = wr.path("/events").path("/retrieve").path("/"+id).accept(MediaType.APPLICATION_JSON).get(String.class);
			return output;
		
		}
	
	@GET
	@Path("/events")
	@Produces(MediaType.TEXT_HTML)
	public Viewable events(){
		return new Viewable("/events.jsp",null);
	}
	
	@GET
	@Path("/events/{id}")
	@Produces("text/html")
	public Response eventId(@PathParam("id") long id){
		Map<String,String> map = new HashMap<String,String>();
		map.put("id",String.valueOf(id));
		return Response.ok(new Viewable("/eventdetail.jsp",map)).build();
	}
	
	@GET
	@Path("/events/new")
	@Produces(MediaType.TEXT_HTML)
	public Viewable eventnew(){
		return new Viewable("/createevent.jsp",null);
	}
	
	@POST
	@Path("/events/insertnew")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces("text/html")
	public Response insertNew(@FormParam("name")String name, @FormParam("description") String description, 
							@FormParam("date") String date, @FormParam("time") String time, 
							@FormParam("startLocation") String startLocation, @FormParam("routeId") String routeId,@Context HttpServletRequest req){
		
		HttpSession session = req.getSession();
		@SuppressWarnings("unchecked")
		Map<String,String> user = (Map<String, String>) session.getAttribute("user");
		String creatorId  = user.get("id");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentDate = new Date();
		String creationDate = dateFormat.format(currentDate);
		String dateTime = date + " " + time + ":00";
		
		String json = "{\"creatorId\"=\"" + creatorId + "\", \"name\"=\"" + name + "\", \"description\"=\"" + description + "\", \"routeId\"=\"" + routeId +"\", \"startDate\"=\"" + dateTime +
				"\", \"startLocation\"=\"" + startLocation +"\", \"creationDate\"=\"" + creationDate + "\"}";
		
		ClientResponse response = wr.path("/events").path("/create").type(MediaType.APPLICATION_JSON).post(ClientResponse.class, json);
		String output = response.getEntity(String.class);
		Map<String,String> map = new HashMap<String,String>();
		map.put("id",output);
		return Response.ok(new Viewable("/eventdetail.jsp",map)).build();
	}
}