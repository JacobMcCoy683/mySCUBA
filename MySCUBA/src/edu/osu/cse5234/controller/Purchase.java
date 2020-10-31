package edu.osu.cse5234.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.Item;
import edu.osu.cse5234.model.LineItem;
import edu.osu.cse5234.util.ServiceLocator;

import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@RequestMapping("/purchase")
public class Purchase {
	@PersistenceContext
	EntityManager entityManager;
//	@RequestMapping(path = "/qty", method = RequestMethod.GET)
//	public void handleAjaxQuery(HttpServletRequest request, HttpServletResponse respone) throws Exception {
//		Order curr_order = (Order)request.getSession().getAttribute("order");
//		String item = (String) request.getParameter("item");
//	    String qty = curr_order.items.get(Integer.parseInt(item)).getAvailable();
//	    System.out.println("Quantity is:"+qty);
//	    
//	    respone.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
//	    //respone.setCharacterEncoding("UTF-8"); // You want world domination, huh?
//	    respone.getWriter().write(qty.toString());  
//	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewOrderEntryForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.getSession().setAttribute("validQuantity", true);
		
//		if(request.getSession().getAttribute("order") != null) {
//			
//			Order order = (Order)request.getSession().getAttribute("order");
//			for(int i=0; i < order.getLineItems().size(); i++) {
//				order.getLineItems().get(i).setQuantity(0);
//			}
//			request.setAttribute("order", order);
//			
//			//request.getSession().setAttribute("order", order);
//		} else {
			
			Order order  = new Order();
			request.getSession().setAttribute("order", order);

			Inventory inventory  = ServiceLocator.getInventoryService().getAvailableInventory();
			request.getSession().setAttribute("inventory", inventory);
//		}
//			System.out.println(inventory.getItems());
			
		return "OrderEntryForm";
	}
	
	@RequestMapping(path = "/submitItems", method = RequestMethod.POST)
	public String submitItems(@ModelAttribute("order") Order order, HttpServletRequest request) {
		request.getSession().setAttribute("order", order);
		System.out.println("SubmitSHIPPING"+order.getLineItems());

		if (ServiceLocator.getOrderProcessingService().validateItemAvailability(order)) {
			entityManager.persist(order);
			
			return "redirect:/purchase/paymentEntry";
		} else {
			request.setAttribute("validQuantity", false);
			return "redirect:/purchase";
		}
	}
	
	@RequestMapping(path = "/paymentEntry", method = RequestMethod.GET)
	public String viewPaymentEntryForm(HttpServletRequest request, HttpServletResponse respone) {
		request.setAttribute("payment", new PaymentInfo());
		
		return "PaymentEntryForm";
	}
	
	@RequestMapping(path = "/submitPayment", method = RequestMethod.POST)
	public String submitPayment(@ModelAttribute("payment") PaymentInfo payment, HttpServletRequest request,HttpServletResponse respone) {
				
		Order order  = (Order) request.getSession().getAttribute("order");
		
		order.setPaymentInfo(payment);
		
		request.getSession().setAttribute("order", order);
		
		return "redirect:/purchase/shippingEntry";
	}
	
	@RequestMapping(path = "/shippingEntry", method = RequestMethod.GET)
	public String viewShippingEntryForm(HttpServletRequest request, HttpServletResponse respone) {
		request.setAttribute("shipping", new ShippingInfo());
		
		return "ShippingEntryForm";
	}
	
	@RequestMapping(path = "/submitShipping", method = RequestMethod.POST)
	public String submitShipping(@ModelAttribute("shipping") ShippingInfo shipping, HttpServletRequest request,HttpServletResponse respone) throws IOException {
		
		Order order  = (Order) request.getSession().getAttribute("order");
		
		order.setShippingInfo(shipping);
		
		request.getSession().setAttribute("order", order);
		
		return "redirect:/purchase/viewOrder";
	}
	
	@RequestMapping(path = "/viewOrder", method = RequestMethod.GET)
	public String viewViewOrderForm(HttpServletRequest request, HttpServletResponse respone) throws IOException {
		return "ViewOrder";
	}
	
	@RequestMapping(path = "/confirmOrder", method = RequestMethod.POST)
	public String confirmOrder(HttpServletRequest request) {
		Order order = (Order)request.getSession().getAttribute("order");
		
		String confirmationCode = ServiceLocator.getOrderProcessingService().processOrder(order);
		request.getSession().setAttribute("confirmationCode", confirmationCode);

		if(order==null) System.out.println("ORDER IS NULL");

		request.getSession().setAttribute("order", order);
		entityManager.flush();
		return "redirect:/purchase/viewConfirmation";
	}
	
	@RequestMapping(path = "/viewConfirmation", method = RequestMethod.GET)
	public String viewViewConfirmationForm(HttpServletRequest request, HttpServletResponse respone) throws IOException {
		return "Confirmation";
	}
}