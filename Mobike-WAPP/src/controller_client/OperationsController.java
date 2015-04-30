package controller_client;

import java.util.Date;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.CookieParam;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
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
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;


@Path("/ops")
public class OperationsController {

	private static final String BaseURI = "http://mobike.ddns.net/SRV/";
	private final String BaseWebAppUri = "/WAPP/";
	Client client = Client.create();
	private final WebResource wr = client.resource(BaseURI);
	
	@SuppressWarnings("unchecked")
	@POST
	@Path("/connect")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_OCTET_STREAM)
	public Response connectServer(String x, @CookieParam("state") String state,	@CookieParam("token") String userToken,	@Context HttpServletRequest request) {

		// check if user is logged, check if it's authorization is valid and
		// then redirect browser.
		if (userToken != null) {
			System.out.println("userToken !=NULL :"+ userToken);
			ClientResponse response = wr.path("/users").path("/auth").queryParam("token", userToken).get(ClientResponse.class);
			
			if (response.getStatus() == 200)
				return Response.ok(this.BaseWebAppUri.concat("home")).build();
			else {
				NewCookie cookie = null;
				return Response.ok(this.BaseWebAppUri.concat("landing")).cookie(cookie).build();
			}

		}
		// initiate the Google Authentication Flow.
		else {
			System.out.println("userToken == null : starting G auth.");
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

				Oauth2 oauth2 = new Oauth2.Builder(TRANSPORT, JSON_FACTORY,	credential).setApplicationName("mobike").build();

				request.getSession().setAttribute("googletoken", tokenResponse.toString());

				@SuppressWarnings("unused")
				Tokeninfo tokenInfo = oauth2.tokeninfo().setAccessToken(credential.getAccessToken()).execute();

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
				e.printStackTrace();
			}

			Crypter crypter = new Crypter();
			String cryptedJson = null;
			try {
				cryptedJson = crypter.encrypt(plainUserJson);
			} catch (Exception e) {
				e.printStackTrace();
			}

			ClientResponse response = wr.path("/users").path("/auth").queryParam("token", cryptedJson).get(ClientResponse.class);
			

			if (response.getStatus() == 200) {
				String token = response.getEntity(String.class);
				ObjectMapper mapmapper = new ObjectMapper();
				Map<String, String> map = null;

				try {
					map = (Map<String, String>) mapmapper.readValue(token, Map.class);
				} catch (IOException e) {
					
					e.printStackTrace();
				}
				System.out.println("token:" + map.get("user"));
				NewCookie cookie = new NewCookie("token",map.get("user"),"/","","comment",86400,false);
				return Response.ok(BaseWebAppUri.concat("home")).cookie(cookie).build();
			}

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

		String tokenData = (String) request.getSession().getAttribute("googletoken");
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
		return Response.ok(this.BaseWebAppUri.concat("landing")).cookie(newCookie).build();
		}
		catch (IOException e) {
	          // For whatever reason, the given token was invalid.
	          return Response.status(400).entity("Failed to revoke token for given user.").build();
		}

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
		System.out.println(userToken);
		JSONObject route = null;
		Crypter crypter = new Crypter();
		JSONObject userplain = null;
		try {
			route = new JSONObject(json);
			userplain = new JSONObject(crypter.decrypt(userToken));
			route.put("owner", userplain);
			System.out.println(userplain);
			String cryptedRoute = crypter.encrypt(route.toString());
			System.out.println("cryptedRoute:" + route.toString());
			System.out.println(route.toString());
			Map<String,String> map = new HashMap<String,String>();
			map.put("user", userToken);
			map.put("route", cryptedRoute);
			ObjectMapper mapper = new ObjectMapper();
			String output = wr.path("/routes").path("/create").type(MediaType.APPLICATION_JSON).post(String.class, mapper.writeValueAsString(map));
			
			
			
			return Response.ok(output).build();
			
			
		} catch (Exception e1) {
			
			e1.printStackTrace();
			return Response.status(500).build();
		}	
	}
	
	@POST
	@Path("/events/newevent")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public Response insertNewAjax(String json, @CookieParam("token") String userToken){
		
		Crypter crypter = new Crypter();
		ObjectMapper mapper = new ObjectMapper();
		JSONObject userplain = null;
		String[] users = null;
		JSONObject event = null;
		JSONObject route;
		Map<String,String> inputmap = new HashMap<String,String>();
		try {
			event = new JSONObject(json);
			users = event.getString("invites").split(",");
			List<String> container = Arrays.asList(users);
			JSONArray usersOK = new JSONArray();
			JSONArray usersAcc= new JSONArray();
			String userResponse = wr.path("/users").path("/retrieveall").queryParam("token", userToken).get(String.class);
			JSONObject usersDB = new JSONObject(userResponse);
			String decrypted = crypter.decrypt(usersDB.getString("users"));
			JSONArray usersD = new JSONArray(decrypted);
			route = new JSONObject();
			route.put("id", event.get("routeId"));
			
			System.out.println("cont:"+container.toString());
			System.out.println("usersd:"+usersD.toString());
			for(int i=0;i<container.size();i++){
				for(int j=0; j<usersD.length();j++){
					if(container.get(i).toLowerCase().replace(" ","").equals(usersD.getJSONObject(j).get("nickname").toString().toLowerCase())){
						usersOK.put(usersD.getJSONObject(j));
						System.out.println(usersD.getString(j));
						
					}
				}
			}
			System.out.println("usercriptato:" + userToken);
			userplain = new JSONObject(crypter.decrypt(userToken));
			System.out.println(userplain);
			System.out.println(event.get("invites"));
			event.remove("invites");
			event.remove("routeId");
			event.put("owner", userplain);
			usersOK.put(userplain);
			usersAcc.put(userplain);
			event.put("usersInvited", usersOK);
			event.put("usersAccepted", usersAcc);
			event.put("route", route);
			//String newdata = event.getString("startdate").replace('\\', ' ');
			//System.out.println("datainput:" + event.getString("startdate") + "dataout:" +newdata);
			//event.put("startdate", newdata);
			
			
			System.out.println(event.toString());
			inputmap.put("event", crypter.encrypt(event.toString()));
			inputmap.put("user", userToken);
			
			String output = wr.path("/events").path("/create").type(MediaType.APPLICATION_JSON).post(String.class, mapper.writeValueAsString(inputmap));

		
			return Response.ok(output).build();
			
		} catch (Exception e1) {
		
		e1.printStackTrace();
		return Response.status(500).build();
	}	
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
			
			if(response.getStatus()==200){
				String token = response.getEntity(String.class);
				ObjectMapper mapmapper = new ObjectMapper();
				Map<String, String> map3 = null;
				map3 = (Map<String, String>) mapmapper.readValue(token,
						Map.class);
				NewCookie cookie = new NewCookie("token",map.get("user"),"/","","comment",86400,false);
				return Response.ok(BaseWebAppUri.concat("home")).cookie(cookie).build();
			}
			if(response.getStatus()==409){
				return Response.status(409).build();
			}
			return Response.status(500).build();
		} catch (Exception e3) {
			
			e3.printStackTrace();
			return Response.status(500).build();
		}
		
	}
	
	@POST
	@Path("/review/new")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response newReview(String json, @CookieParam("token") String userToken){
		Crypter crypter = new Crypter();
		JSONObject jsonReceived, user;
		try {
			jsonReceived = new JSONObject(json);
			user = new JSONObject(crypter.decrypt(userToken));
			if( jsonReceived.getJSONObject("reviewPK").get("usersId").equals(user.get("id"))){
				String reviewencrypted = crypter.encrypt(json);
				JSONObject output = new JSONObject();
				output.put("review", reviewencrypted);
				output.put("user", userToken);
				ClientResponse response = wr.path("/reviews").path("/create").type(MediaType.APPLICATION_JSON).post(ClientResponse.class, output);
				return Response.status(response.getStatus()).build();
			}
			else {
				return Response.status(401).build();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return Response.status(500).build();
		}
	}
	
	

}
