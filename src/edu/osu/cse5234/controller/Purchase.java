package edu.osu.cse5234.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@RequestMapping("/purchase")
public class Purchase {

	@RequestMapping(method = RequestMethod.GET)
	public String viewOrderEntryForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Order order = new Order();
		ArrayList<Item> items = new ArrayList<>();
		
		HashMap<String, String> products = new HashMap<>();
		products.put("BCD", "400.00");
		products.put("Fins", "150.00");
		products.put("Mask", "80.00");
		products.put("Regulator", "300.00");
		products.put("Tank", "250.00");
		
		Iterator<Map.Entry<String, String>> it = products.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, String> entry = it.next();
			Item item = new Item();
			item.setName(entry.getKey());
			item.setPrice(entry.getValue());
			items.add(item);
		}
		order.setItems(items);
		request.setAttribute("order", order);
		
		return "OrderEntryForm";
	}
	
	@RequestMapping(path = "/submitItems", method = RequestMethod.POST)
	public String submitItems(@ModelAttribute("order") Order order, HttpServletRequest request) {
		request.getSession().setAttribute("order", order);
		
		return "redirect:/purchase/paymentEntry";
	}
	
	@RequestMapping(path = "/paymentEntry", method = RequestMethod.GET)
	public String viewPaymentEntryForm(HttpServletRequest request, HttpServletResponse respone) {
		request.setAttribute("payment", new PaymentInfo());
		
		return "PaymentEntryForm";
	}
}