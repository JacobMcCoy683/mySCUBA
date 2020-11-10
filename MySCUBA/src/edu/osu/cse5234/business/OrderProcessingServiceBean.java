package edu.osu.cse5234.business;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.jms.ConnectionFactory;
import javax.jms.JMSConnectionFactory;
import javax.jms.JMSContext;
import javax.jms.Queue;
import javax.json.Json;
import javax.json.JsonObject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.business.view.Item;
import edu.osu.cse5234.controller.Order;
import edu.osu.cse5234.model.LineItem;
import edu.osu.cse5234.util.ServiceLocator;

/**
 * Session Bean implementation class OrderProcessingServiceBean
 */
@Resource(name="jms/emailQCF", lookup="jms/emailQCF", type=ConnectionFactory.class)

@Stateless
@LocalBean
public class OrderProcessingServiceBean {
	@PersistenceContext
	EntityManager entityManager;
	
	private static String SHIPPING_URI = "http://localhost:9080/UPS/services/shipping";
	
	@Inject
	@JMSConnectionFactory("java:comp/env/jms/emailQCF")
	private JMSContext jmsContext;
	
	@Resource(lookup="jms/emailQ")
	private Queue queue;
	
    public EntityManager getEntityManager() {
		return entityManager;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	/**
     * Default constructor. 
     */
    public OrderProcessingServiceBean() {
        // TODO Auto-generated constructor stub
    }

    private void notifyUser(Order order) {
    	String message = order.getEmailAddress() + ":" +
    		       "Your order was successfully submitted. " + 
    		     	"You will hear from us when items are shipped. " + 
    		      	new Date();

    	System.out.println("Sending message: " + message);
    	jmsContext.createProducer().send(queue, message);
    	System.out.println("Message Sent!");

    }
    
    public String processOrder(Order order) {
//    	InventoryService in = ServiceLocator.getInventoryService();
//    	if (in.validateQuantity(order.getLineItems())) {
//    		if (in.updateInventory(order.getLineItems())) {
//    			return "123456";
//    		}
//    	}
    	entityManager.persist(order);
    	entityManager.flush();
    	
    	Client client = ClientBuilder.newClient();
    	WebTarget baseTarget = client.target(SHIPPING_URI);
    	JsonObject requestJson = Json.createObjectBuilder()
    			.add("Organization", "MySCUBA LLC.")
    			.add("OrderRefId", 101)
    			.add("ItemsCount", 50)
    			.add("Zip", "43215")
    			.build();
    	JsonObject responseJson = baseTarget.path("/initiate")
    			.request(MediaType.APPLICATION_JSON)
    			.post(Entity.json(requestJson), JsonObject.class);
    	
    	System.out.println("UPS accepted request? " + responseJson.getBoolean("Accepted"));
    	System.out.println("Shipping Reference Number: " + responseJson.getInt("ShippingReferenceNumber"));
    	client.close();
    	
    	notifyUser(order);
    	
    	return "56789";
    }
    
    public boolean validateItemAvailability(Order order) {
    	InventoryService in = ServiceLocator.getInventoryService();
    	List<Item> items=  in.getAvailableInventory().getItems();
    	List<LineItem> lineItems = order.getLineItems();
    	for(int i=0;i<lineItems.size();i++) {
    		
    		// todo: do not assume same order of items and lineitems
    		LineItem li = lineItems.get(i);
    		Item item = items.get(i);
    		int lineItemNumber = li.getItemNumber();
    		int itemNumber = item.getItemNumber();
    		int li_quantity = li.getQuantity();
    		int item_quantity = item.getQuantity();
    		if(lineItemNumber==itemNumber && li_quantity>item_quantity) {
    			return false;
    		}
    	}
    	return true;
//    	return in.validateQuantity(order.getLineItems());
    }
}
