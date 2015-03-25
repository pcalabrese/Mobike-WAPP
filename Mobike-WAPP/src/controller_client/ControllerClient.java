package controller_client;

import java.util.Date;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.CookieParam;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Cookie;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NewCookie;
import javax.ws.rs.core.Response;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import utils.Crypter;

import com.google.api.client.googleapis.auth.oauth2.*;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpResponse;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson.JacksonFactory;
import com.google.api.services.oauth2.Oauth2;
import com.google.api.services.oauth2.model.Tokeninfo;
import com.google.api.services.oauth2.model.Userinfoplus;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientHandlerException;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.UniformInterfaceException;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.view.Viewable;


@Path("/")
public class ControllerClient {

	private static final String BaseURI = "http://mobike.ddns.net/SRV/";
	private final String BaseWebAppUri = "http://mobike.ddns.net/WAPP/";
	Client client = Client.create();
	private final WebResource wr = client.resource(BaseURI);

	@GET
	public Viewable welcome() {
		return new Viewable("/landing.jsp", null);
	}

	@GET
	@Path("/landing")
	public Response landing(@Context HttpServletRequest request) {

		return Response.ok(new Viewable("/landing.jsp")).build();
	}

	@GET
	@SuppressWarnings("unchecked")
	@Path("/home")
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
	@Path("/aboutus")
	public Viewable aboutus() {
		return new Viewable("/aboutus.jsp", null);
	}
	
	@GET
	@Path("/events")
	@Produces(MediaType.TEXT_HTML)
	public Response events(@CookieParam("token") String userToken) {
		
		String crEventJson;
		Crypter crypter = new Crypter();
		
		JSONObject outputOBJ = new JSONObject();
		try {
			crEventJson = wr.path("/events").path("/retrieveall").queryParam("user", userToken).accept(MediaType.APPLICATION_JSON).get(String.class);
			JSONObject receivedJson = new JSONObject(crEventJson);
			outputOBJ.put("events", new JSONArray(crypter.decrypt(receivedJson.getString("events"))));
			outputOBJ.put("user", new JSONObject(crypter.decrypt(userToken)));
		} catch (Exception e1) {
			
			e1.printStackTrace();
			return Response.status(500).build();
		}
		
		return Response.ok(new Viewable("/events.jsp",outputOBJ)).build();
		
		
		
		

		
	}
	
	
	
	@SuppressWarnings("unchecked")
	@GET
	@Path("/getitineraries")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getItineraries() {
		Crypter crypter = new Crypter();
		ObjectMapper mapper = new ObjectMapper();
		String output = wr.path("/routes").path("/retrieveall").accept(MediaType.APPLICATION_JSON).get(String.class);
		Map<String, String> map = null;
		String output2 = null;
		try {
			map = (Map<String,String>) mapper.readValue(output, Map.class);
			output2 = crypter.decrypt(map.get("routes"));
		} catch (Exception e) {
			e.printStackTrace();
			return Response.status(500).build();
		}
		
		return Response.ok(output2).build();

	}
	
	@POST
	@Path("/itineraries/insertnew")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public Response createItineraries(String json, @CookieParam("token") String userToken){
		System.out.println(json.toString());
		JSONObject route = null;
		Crypter crypter = new Crypter();
		JSONObject userplain = null;
		try {
			route = new JSONObject(json);
			userplain = new JSONObject(crypter.decrypt(userToken));
			route.put("owner", userplain);
			
			String cryptedRoute = crypter.encrypt(route.toString());
			
			Map<String,String> map = new HashMap<String,String>();
			map.put("user", userToken);
			map.put("route", cryptedRoute);
			ObjectMapper mapper = new ObjectMapper();
			String output = wr.path("/routes").path("/create").type(MediaType.APPLICATION_JSON).post(String.class, mapper.writeValueAsString(map));
			
			URI uri = null;
			try {
				uri = new URI("./routes/itineraries/".concat(output));
			} catch (URISyntaxException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return Response.seeOther(uri).build();
			
			
		} catch (Exception e1) {
			
			e1.printStackTrace();
			return Response.status(500).build();
		}	
	}
	
	@GET
	@Path("/itineraries/new")
	
	public Response newItinerary(){
		return Response.ok(new Viewable("/itncreation.jsp",null)).build();
	}
	/*
	@GET
	@Path("/getitnbyid/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getItnById(@PathParam("id") long id) {
		String output = wr.path("/routes").path("/retrieve").path("/" + id)
				.accept(MediaType.APPLICATION_JSON).get(String.class);
		return output;

	} 

	

	/*
	@GET
	@Path("/logout")
	@Produces(MediaType.TEXT_PLAIN)
	public Response logout(@Context HttpServletRequest request) {
		request.getSession().invalidate();
		Cookie cookie = new Cookie("token", "");

		NewCookie newCookie = new NewCookie(cookie, null, 0, false);

		return Response.ok(this.BaseWebAppUri.concat("landing"))
				.cookie(newCookie).build();
	} 

	@GET
	@Path("/getEvents")
	@Produces(MediaType.APPLICATION_JSON)
	public String getEvents() {
		String output = wr.path("/events").path("/retrieveall")
				.accept(MediaType.APPLICATION_JSON).get(String.class);
		return output;
	}

	@GET
	@Path("/getEventById/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getEventById(@PathParam("id") long id) {
		String output = wr.path("/events").path("/retrieve").path("/" + id)
				.accept(MediaType.APPLICATION_JSON).get(String.class);
		return output;

	} */

	

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

	@POST
	@Path("/events/insertnew")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces("text/html")
	public Response insertNew(@FormParam("name") String name,
			@FormParam("description") String description,
			@FormParam("date") String date, @FormParam("time") String time,
			@FormParam("startlocation") String startLocation,
			@FormParam("routeId") String routeId,
			@FormParam("invites") String invites,
			@CookieParam("token") String userToken) {

		Crypter crypter = new Crypter();
		JSONObject object;
		String creatorId = null;
		String nickname = null;
		try {
			object = new JSONObject(crypter.decrypt(userToken));
			creatorId = object.getString("id");
			nickname = object.getString("nickname");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		String [] users = invites.split(",");
		List<String> container = Arrays.asList(users);
		JSONArray usersOK = new JSONArray();
		String userResponse = wr.path("/users").path("/retrieveall").queryParam("token", userToken).get(String.class);
		try {
			JSONObject usersDB = new JSONObject(userResponse);
			String decrypted = crypter.decrypt(usersDB.getString("users"));
			JSONArray usersD = new JSONArray(decrypted);
			
			for(int i=0;i<container.size();i++){
				for(int j=0; j<usersD.length();j++){
					if(container.get(i).equals(usersD.getJSONObject(j).get("nickname"))){
						usersOK.put(usersD.getJSONObject(j));
					}
				}
			}
			
			
		} catch ( Exception e1) {
			
			e1.printStackTrace();
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date currentDate = new Date();
		String creationDate = dateFormat.format(currentDate);
		String date2 = date.replace("-", "/");
		String dateTime = date2 + " " + time + ":00";
		JSONObject event = null;
		
		try {
			 event = new JSONObject("{\"owner\":{\"id\":" + creatorId + ", \"nickname\":\""+nickname+"\"}, \"name\":\""
					+ name + "\", \"description\":\"" + description
					+ "\", \"route\": {\"id\":"+routeId+ "}, \"startdate\":\""
					+ dateTime + "\", \"startlocation\":\"" + startLocation
					+ "\", \"creationdate\":\"" + creationDate + "\"}");
		} catch (JSONException e1) {
			
			e1.printStackTrace();
		}
		
		try {
			event.put("usersInvited", usersOK);
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		

		
		
		Map<String,String> inputmap = new HashMap<String,String>();
		try {
			inputmap.put("event", crypter.encrypt(event.toString()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		inputmap.put("user", userToken);
		
		ObjectMapper mapper = new ObjectMapper();
		String inputjson = null;
		try {
			inputjson = mapper.writeValueAsString(inputmap);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ClientResponse response = wr.path("/events").path("/create")
				.type(MediaType.APPLICATION_JSON)
				.post(ClientResponse.class, inputjson);
		String output = response.getEntity(String.class);
		URI uri = null;
		try {
			uri = new URI("./events/".concat(output));
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Response.seeOther(uri).build();
	}
	
	@POST
	@Path("/events/participation/{op}")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response acceptEvent(@CookieParam("token") String userToken, String json, @PathParam("op") String op){
		Map<String,String> map = new HashMap<String,String>();
		Crypter crypter = new Crypter();
		try {
			map.put("event", crypter.encrypt(json));
			map.put("user", userToken);
			ObjectMapper mapper = new ObjectMapper();
			String input = mapper.writeValueAsString(map);
			ClientResponse response = wr.path("/events").path("/participation").queryParam("op", op).type(MediaType.APPLICATION_JSON).post(ClientResponse.class, input);
			if(response.getStatus()==200)
				return Response.ok().build();
		} catch (Exception e) {
			
			e.printStackTrace();
			return Response.status(500).build();
		}
		return Response.status(500).build();
		
	}
	
	
	

	@SuppressWarnings("unchecked")
	@POST
	@Path("/connect")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_OCTET_STREAM)
	public Response connectServer(String x, @CookieParam("state") String state,
			@CookieParam("token") String userToken,
			@Context HttpServletRequest request) {

		// check if user is logged, check if it's authorization is valid and
		// then redirect browser.
		if (userToken != null) {
			System.out.println("entered 1st if");
			ClientResponse response = wr.path("/users").path("/auth")
					.queryParam("token", userToken).get(ClientResponse.class);
			System.out.println(response.getStatus());
			if (response.getStatus() == 200)
				return Response.ok(this.BaseWebAppUri.concat("home")).build();
			else {
				NewCookie cookie = null;
				return Response.ok(this.BaseWebAppUri.concat("landing"))
						.cookie(cookie).build();
			}

		}
		// initiate the Google Authentication Flow.
		else {
			String code = x;
			HttpTransport TRANSPORT = new NetHttpTransport();
			JacksonFactory JSON_FACTORY = new JacksonFactory();
			String CLIENT_ID = "648355147327-l29pdutihnfa25kdmo1ocjankqg4217c.apps.googleusercontent.com";
			String CLIENT_SECRET = "kFPvMH88ifFkbKYnsFsPq5Me";
			String name, surname, email, imgUrl = null;

			try {
				List<String> scopes = new ArrayList<String>();
				scopes.add("https://www.googleapis.com/auth/plus.login");
				scopes.add("https://www.googleapis.com/auth/plus.me");
				scopes.add("https://www.googleapis.com/auth/userinfo.profile");
				scopes.add("https://www.googleapis.com/auth/userinfo.email");
				scopes.add("https://www.googleapis.com/auth/plus.profile.emails.read");
				GoogleTokenResponse tokenResponse = new GoogleAuthorizationCodeTokenRequest(
						TRANSPORT, JSON_FACTORY, CLIENT_ID, CLIENT_SECRET,
						code, "postmessage").setScopes(scopes).execute();
				GoogleCredential credential = new GoogleCredential.Builder()
						.setJsonFactory(JSON_FACTORY).setTransport(TRANSPORT)
						.setClientSecrets(CLIENT_ID, CLIENT_SECRET).build()
						.setFromTokenResponse(tokenResponse);

				Oauth2 oauth2 = new Oauth2.Builder(TRANSPORT, JSON_FACTORY,
						credential).setApplicationName("mobike").build();

				request.getSession().setAttribute("googletoken",
						tokenResponse.toString());

				@SuppressWarnings("unused")
				Tokeninfo tokenInfo = oauth2.tokeninfo()
						.setAccessToken(credential.getAccessToken()).execute();

				Userinfoplus userinfo = oauth2.userinfo().get().execute();

				name = userinfo.getGivenName();
				surname = userinfo.getFamilyName();
				email = userinfo.getEmail();
				imgUrl = userinfo.getPicture();
			} catch (Exception e) {
				return Response.status(500).entity(e.getMessage()).build();
			}

			Map<String, String> userMap = new HashMap<String, String>();
			userMap.put("name", name);
			userMap.put("surname", surname);
			userMap.put("email", email);
			userMap.put("imgurl", imgUrl);

			String plainUserJson = null;
			ObjectMapper mapper = new ObjectMapper();
			try {
				plainUserJson = mapper.writeValueAsString(userMap);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			Crypter crypter = new Crypter();
			String cryptedJson = null;
			try {
				cryptedJson = crypter.encrypt(plainUserJson);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			ClientResponse response = wr.path("/users").path("/auth")
					.queryParam("token", cryptedJson).get(ClientResponse.class);
			

			if (response.getStatus() == 200) {
				String token = response.getEntity(String.class);
				ObjectMapper mapmapper = new ObjectMapper();
				Map<String, String> map = null;

				try {
					map = (Map<String, String>) mapmapper.readValue(token,
							Map.class);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				return Response.ok(BaseWebAppUri.concat("home"))
						.cookie(new NewCookie("token", map.get("user")))
						.build();
			}

			// costruire parte else in cui, se il codice restituito dal server è
			// 401 allora salva come cookie i dati con una chiave diversa,
			// bisogna poi chiedere all'utente di inserire il nickname e provare
			// la post, se fallisce chiedere di modificare i dati.
			// l'inserimento del nickname potrebbe essere fatto in una richiesta
			// asincrona AJAX.

			else {
				if (response.getStatus() == 401) {
					String tokentemp = cryptedJson;
					return Response.ok("na").cookie(new NewCookie("tokentemp", tokentemp)).build();
				} else {
					NewCookie cookie = null;
					return Response.status(400).cookie(cookie).build();
				}
			}

		}

	}

	@POST
	@Path("/disconnect")
	public Response disconnectServer(@Context HttpServletRequest request) {

		

		String tokenData = (String) request.getSession().getAttribute(
				"googletoken");

		HttpTransport TRANSPORT = new NetHttpTransport();
		JacksonFactory JSON_FACTORY = new JacksonFactory();
		String CLIENT_ID = "648355147327-l29pdutihnfa25kdmo1ocjankqg4217c.apps.googleusercontent.com";
		String CLIENT_SECRET = "kFPvMH88ifFkbKYnsFsPq5Me";

		try {
		GoogleCredential credential = new GoogleCredential.Builder()
				.setJsonFactory(JSON_FACTORY)
				.setTransport(TRANSPORT)
				.setClientSecrets(CLIENT_ID, CLIENT_SECRET)
				.build()
				.setFromTokenResponse(
						JSON_FACTORY.fromString(tokenData,
								GoogleTokenResponse.class));

		HttpResponse revokeResponse = TRANSPORT
				.createRequestFactory()
				.buildGetRequest(
						new GenericUrl(
								String.format(
										"https://accounts.google.com/o/oauth2/revoke?token=%s",
										credential.getAccessToken())))
				.execute();

		request.getSession().removeAttribute("googletoken");
		Cookie cookie = new Cookie("token", "");
		NewCookie newCookie = new NewCookie(cookie, null, 0, false);
		return Response.ok(this.BaseWebAppUri.concat("landing"))
				.cookie(newCookie).build();
		}
		catch (IOException e) {
	          // For whatever reason, the given token was invalid.
	          return Response.status(400).entity("Failed to revoke token for given user.").build();
		}

	}
	
	
	@SuppressWarnings("unchecked")
	@POST
	@Path("/createuser")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response createnewUser(String json, @CookieParam("tokentemp") String tokentemp){
		
		Crypter crypter = new Crypter();
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			Map<String, String> jsonnickbike;
			jsonnickbike = mapper.readValue(json, Map.class);
			String nickname = jsonnickbike.get("nickname");
			String bikemodel = jsonnickbike.get("bikemodel");
			Map<String,String> usermap = null;
			usermap = mapper.readValue(crypter.decrypt(tokentemp), Map.class);
			usermap.put("nickname", nickname);
			usermap.put("bikemodel", bikemodel);
			
			String cryptedJson = crypter.encrypt(mapper.writeValueAsString(usermap));
			
			Map<String,String> map = new HashMap<String,String>();
			map.put("user", cryptedJson);
			
			String wrappedJson = mapper.writeValueAsString(map);
			
			ClientResponse response = wr.path("/users").path("/create").type(MediaType.APPLICATION_JSON).post(ClientResponse.class, wrappedJson);
			System.out.println(response.getStatus());
			if(response.getStatus()==200){
				String token = response.getEntity(String.class);
				ObjectMapper mapmapper = new ObjectMapper();
				Map<String, String> map3 = null;
				map3 = (Map<String, String>) mapmapper.readValue(token,
						Map.class);
				return Response.ok(BaseWebAppUri.concat("home")).cookie(new NewCookie("token", map3.get("user"))).build();
			}
			return Response.status(500).build();
		} catch (Exception e3) {
			
			e3.printStackTrace();
			return Response.status(500).build();
		}
		

		
		
		
		
		
	}
	
	@POST
	@Path("/review/insertnew")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response newReview(String json, @CookieParam("token") String userToken){
		Map<String,String> map = new HashMap<String,String>();
		Crypter crypter = new Crypter();
		
		try {
			map.put("review", crypter.encrypt(json));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("user", userToken);
		ObjectMapper mapper = new ObjectMapper();
		
		ClientResponse response = wr.path("/reviews").path("/create").type(MediaType.APPLICATION_JSON).post(ClientResponse.class);
		
		return Response.status(response.getStatus()).build();
		
		
		
		
	}

}
