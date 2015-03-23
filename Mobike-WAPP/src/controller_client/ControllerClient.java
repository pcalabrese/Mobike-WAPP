package controller_client;

import java.util.Date;
import java.io.IOException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Cookie;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NewCookie;
import javax.ws.rs.core.Response;

import org.codehaus.jackson.map.ObjectMapper;

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
import com.sun.jersey.api.view.Viewable;

@Path("/")
public class ControllerClient {

	private static final String BaseURI = "http://localhost:8080/Mobike-SRV/";
	private final String BaseWebAppUri = "http://localhost:8080/Mobike-WAPP/";

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

		if (userToken != null) {
			Crypter crypter = new Crypter();
			String plainJson = null;
			try {
				plainJson = crypter.decrypt(userToken);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			ObjectMapper mapper = new ObjectMapper();

			Map<String, String> map = null;
			try {
				map = (Map<String, String>) mapper.readValue(plainJson,
						Map.class);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String nickname = map.get("nickname");

			Map<String, String> outputMap = new HashMap<String, String>();
			outputMap.put("nickname", nickname);
			return Response.ok(new Viewable("/index.jsp", outputMap)).build();
		} else {
			return Response.ok(new Viewable("/landing.jsp", null)).build();
		}

	}

	@GET
	@Path("/itineraries")
	public Viewable itineraries() {
		return new Viewable("/itineraries.jsp", null);
	}

	@GET
	@Path("/aboutus")
	public Viewable aboutus() {
		return new Viewable("/aboutus.jsp", null);
	}

	@GET
	@Path("/getitineraries")
	@Produces(MediaType.APPLICATION_JSON)
	public String getItineraries() {
		String output = wr.path("/routes").path("/retrieveall")
				.accept(MediaType.APPLICATION_JSON).get(String.class);
		return output;

	}

	@GET
	@Path("/getitnbyid/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getItnById(@PathParam("id") long id) {
		String output = wr.path("/routes").path("/retrieve").path("/" + id)
				.accept(MediaType.APPLICATION_JSON).get(String.class);
		return output;

	}

	@GET
	@Path("/itineraries/{id}")
	public Viewable itineraryDetails(@PathParam("id") long id) {
		return new Viewable("/itinerarydetail.jsp", null);
	}

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

	}

	@GET
	@Path("/events")
	@Produces(MediaType.TEXT_HTML)
	public Viewable events() {
		return new Viewable("/events.jsp", null);
	}

	@GET
	@Path("/events/{id}")
	@Produces("text/html")
	public Response eventId(@PathParam("id") long id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", String.valueOf(id));
		return Response.ok(new Viewable("/eventdetail.jsp", map)).build();
	}

	@GET
	@Path("/events/new")
	@Produces(MediaType.TEXT_HTML)
	public Viewable eventnew() {
		return new Viewable("/createevent.jsp", null);
	}

	@POST
	@Path("/events/insertnew")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces("text/html")
	public Response insertNew(@FormParam("name") String name,
			@FormParam("description") String description,
			@FormParam("date") String date, @FormParam("time") String time,
			@FormParam("startLocation") String startLocation,
			@FormParam("routeId") String routeId,
			@Context HttpServletRequest req) {

		HttpSession session = req.getSession();
		@SuppressWarnings("unchecked")
		Map<String, String> user = (Map<String, String>) session
				.getAttribute("user");
		String creatorId = user.get("id");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentDate = new Date();
		String creationDate = dateFormat.format(currentDate);
		String dateTime = date + " " + time + ":00";

		String json = "{\"creatorId\"=\"" + creatorId + "\", \"name\"=\""
				+ name + "\", \"description\"=\"" + description
				+ "\", \"routeId\"=\"" + routeId + "\", \"startDate\"=\""
				+ dateTime + "\", \"startLocation\"=\"" + startLocation
				+ "\", \"creationDate\"=\"" + creationDate + "\"}";

		ClientResponse response = wr.path("/events").path("/create")
				.type(MediaType.APPLICATION_JSON)
				.post(ClientResponse.class, json);
		String output = response.getEntity(String.class);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", output);
		return Response.ok(new Viewable("/eventdetail.jsp", map)).build();
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
					return Response.status(401)
							.cookie(new NewCookie("tokentemp", tokentemp))
							.build();
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

}
