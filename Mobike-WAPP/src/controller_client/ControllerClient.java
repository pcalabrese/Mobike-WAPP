package controller_client;


import javax.validation.constraints.NotNull;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

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
	
	private static final String BaseURI = "http://localhost:8080/Mobike-SRV/";
	
	Client client = Client.create();
	private final WebResource wr = client.resource(BaseURI);
	
	@GET
	public Viewable welcome(){
		return new Viewable("/index.html", "welcome");
	}
	
	@GET
	@Path("/home")
	public Viewable home(){
		return new Viewable("/index.html", "welcome");
	}
	
	@GET
	@Path("/prova")
	@Produces(MediaType.TEXT_PLAIN)
	public String prova(){
		return "helloprova";
	}
	
	@GET
	@Path("/routes")
	@Produces(MediaType.APPLICATION_JSON)
	public Viewable getRoutes(){
		ClientResponse response = wr.path("/routes").path("/retrieveall").accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
		String output = response.getEntity(String.class);
		String output2 = output.substring(1, output.length());
		JSONObject object = null;
		try {
			object = new JSONObject(output2);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new Viewable("/paths.html",object);
		
		
		
	
	}
	
	@GET
	@Path("/test")
	public Viewable testmethod(){
		return new Viewable("/test.jsp","welcome");
	}
	/*
	@GET
	@Path("/analysis")
	public Viewable startAnalysis(){
		return new Viewable("/startAnalysis.jsp", "startsearch");
	}

	@GET
	@Path("/references")
	public Viewable references(){
		return new Viewable("/references.jsp", "references");
	}
	@POST
	@Path("/search/done")
	//?brand={brand}&data={data}
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public Viewable doSearch(@NotNull @FormParam("brand") String brand,
							@NotNull @FormParam("until") String untilDate,
							@NotNull @FormParam("since") String sinceDate){
			
		String input = "{\"brand\":\""+brand+"\",\"sinceDate\":\""+sinceDate+"\",\"untilDate\":\""+untilDate+"\"}";

		ClientResponse response = wr.path("/search").path("/start").type(MediaType.APPLICATION_JSON).post(ClientResponse.class, input);
		JSONObject output = response.getEntity(JSONObject.class);
		
		return new Viewable("/analysisDone",output);
	}
	

	@GET
	@Path("/analysis/start")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public Viewable doAnalysis(@NotNull @QueryParam("brand") String brand,
								@NotNull @QueryParam("since") String sinceDate,
								@NotNull @QueryParam("until") String untilDate){
			
		String input = "{\"brand\":\""+brand+"\",\"sinceDate\":\""+sinceDate+"\",\"untilDate\":\""+untilDate+"\"}";
		System.out.println(input);
		ClientResponse response = wr.path("/analysis").path("/start").type(MediaType.APPLICATION_JSON).post(ClientResponse.class,input);
		JSONObject output = response.getEntity(JSONObject.class);
		
		return new Viewable("/analysisDone",output);*/
	}
	
	
	
//	//TEST
//	@GET
//	@Path("/hello")
//	public Viewable getHello(){
//		ClientResponse response = wr.path("/hello").accept(MediaType.TEXT_PLAIN).get(ClientResponse.class);
//		
//		if (response.getStatus() != 200) {
//			   throw new RuntimeException("Failed : HTTP error code : "
//				+ response.getStatus());
//			}
//	 
//			String output = response.getEntity(String.class);
//	 
//			System.out.println("Output from Server .... \n");
//			System.out.println(output);
//			return new Viewable("/provaoutput", output);
//	}
//	
//	@GET
//	@Path("/prova/prova")
//	public Viewable get(){
//		return new Viewable("/provaoutput", "bello");
//	}
//	
