package edu.osu.cse5234.business;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.business.view.Item;
import edu.osu.cse5234.controller.Order;
import edu.osu.cse5234.model.LineItem;
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
//    	InventoryService in = ServiceLocator.getInventoryService();
//    	if (in.validateQuantity(order.getLineItems())) {
//    		if (in.updateInventory(order.getLineItems())) {
//    			return "123456";
//    		}
//    	}
    	
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
