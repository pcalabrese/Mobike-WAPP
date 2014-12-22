package controller_client;

import javax.validation.constraints.NotNull;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
	 

import javax.ws.rs.core.MediaType;

/*import org.codehaus.jettison.json.JSONObject;
import org.glassfish.grizzly.http.server.HttpServer;

import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.view.Viewable;*/

@Path("/")
public class Controller {
	private static final String BaseURI = "http://localhost:8080/Mobike-SRV/";
	Client c = Client
	
	
	
	}
	
	
	
/*
import javax.validation.constraints.NotNull;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.codehaus.jettison.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.view.Viewable;
 
 @Path("/")
public class Controller {
	
	private static final String BaseURI = "http://localhost:8080/web.crawlerplatform.first/";
	
	Client client = Client.create();
	private final WebResource wr = client.resource(BaseURI);
	
	@GET
	public Viewable welcome(){
		return new Viewable("/index.jsp", "welcome");
	}
	
	@GET
	@Path("/home")
	public Viewable home(){
		return new Viewable("/index.jsp", "welcome");
	}
	
	@GET
	@Path("/search")
	public Viewable startSearch(){
		return new Viewable("/startSearch.jsp", "startsearch");
	}

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
		
		return new Viewable("/analysisDone",output);
	}
	
*/
	
	
	
	
	
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
}
