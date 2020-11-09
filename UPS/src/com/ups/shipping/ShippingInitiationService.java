package com.ups.shipping;

import javax.json.Json;
import javax.json.JsonObject;
import javax.ws.rs.*;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;

@ApplicationPath("services")
@Path("shipping")
public class ShippingInitiationService extends Application {

	@GET
	@Path("isAlive")
	@Produces(MediaType.TEXT_PLAIN)
	public String ping() {
		return "UPS is up and running ...";
	}
	
	@POST
	@Path("/initiate")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public JsonObject initiateShipping(JsonObject incomingJson) {
		String organization = incomingJson.getString("Organization");
		int orderRefId = incomingJson.getInt("OrderRefId");
		int numberOfItemsToShip = incomingJson.getInt("ItemsCount");
		String zip = incomingJson.getString("Zip");
		
		System.out.println("UPS\n===\n" + organization
				+ " requested shipping of " + numberOfItemsToShip
				+ " items to ZIP: " + zip
				+ ", Order Ref: " + orderRefId);
		
		// Persist the shipping request and generate a shipping reference
		// skip for now, create a hard-coded shipping number - PK

		JsonObject responseJson = Json.createObjectBuilder()
				.add("Accepted", true)
				.add("ShippingReferenceNumber", 90001)
				.add("Organization", organization)
				.add("OrderRefId", orderRefId)
				.build();
		
		return responseJson;
	}
}
