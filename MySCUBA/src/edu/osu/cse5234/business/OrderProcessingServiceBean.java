package edu.osu.cse5234.business;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.controller.Order;
import edu.osu.cse5234.util.ServiceLocator;

/**
 * Session Bean implementation class OrderProcessingServiceBean
 */
@Stateless
@LocalBean
public class OrderProcessingServiceBean {

    /**
     * Default constructor. 
     */
    public OrderProcessingServiceBean() {
        // TODO Auto-generated constructor stub
    }

    public String processOrder(Order order) {
    	InventoryService in = ServiceLocator.getInventoryService();
    	if (in.validateQuantity(order.getItems())) {
    		if (in.updateInventory(order.getItems())) {
    			return "123456";
    		}
    	}
    	
    	return "ERROR";
    }
    
    public boolean validateItemAvailability(Order order) {
    	InventoryService in = ServiceLocator.getInventoryService();
    	return in.validateQuantity(order.getItems());
    }
}
