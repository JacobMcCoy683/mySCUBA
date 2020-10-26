package edu.osu.cse5234.business;

import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.business.view.Item;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Session Bean implementation class InventoryServiceBean
 */
@Stateless
public class InventoryServiceBean implements InventoryService {

    /**
     * Default constructor. 
     */
	@PersistenceContext
	EntityManager entityManager;
	
	String MY_QUERY = "Select i from Item i";
	public InventoryServiceBean() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public Inventory getAvailableInventory() {
		List<Item> items = new ArrayList<>();
		
		items = entityManager.createQuery(MY_QUERY, Item.class).getResultList();
		
//		HashMap<String, String> products = new HashMap<>();
//		products.put("BCD", "400.00");
//		products.put("Fins", "150.00");
//		products.put("Mask", "80.00");
//		products.put("Regulator", "300.00");
//		products.put("Tank", "250.00");
//		
//		List<String> availability = new ArrayList<String>(); 
//		availability.add("10"); 
//		availability.add("6"); 
//		availability.add("3"); 
//		availability.add("4"); 
//		availability.add("5"); 
//		
//		Iterator<Map.Entry<String, String>> it = products.entrySet().iterator();
//		int i=0;
//		while (it.hasNext()) {
//			Map.Entry<String, String> entry = it.next();
//			Item item = new Item();
//			item.setName(entry.getKey());
//			item.setPrice(entry.getValue());
//			item.setAvailable(availability.get(i));
//			item.setQuantity("0");
//			items.add(item);
//			i++;
//		}
		Inventory in = new Inventory();
		in.setItems(items);
		
		return in;
	}

	@Override
	public boolean validateQuantity(List<Item> items) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean updateInventory(List<Item> items) {
		// TODO Auto-generated method stub
		return true;
	}

}
