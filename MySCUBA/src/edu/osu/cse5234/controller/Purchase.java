package edu.osu.cse5234.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.osu.cse5234.business.view.Item;
import edu.osu.cse5234.util.ServiceLocator;

import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@RequestMapping("/purchase")
public class Purchase {
	
	@RequestMapping(path = "/qty", method = RequestMethod.GET)
	public void handleAjaxQuery(HttpServletRequest request, HttpServletResponse respone) throws Exception {
		Order curr_order = (Order)request.getSession().getAttribute("order");
		String item = (String) request.getParameter("item");
	    String qty = curr_order.items.get(Integer.parseInt(item)).getAvailable();
	    System.out.println("Quantity is:"+qty);
	    
	    respone.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
	    //respone.setCharacterEncoding("UTF-8"); // You want world domination, huh?
	    respone.getWriter().write(qty.toString());  
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewOrderEntryForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession();
//		if (request.getParameter("JSESSIONID") != null) {
//		    Cookie userCookie = new Cookie("JSESSIONID", request.getParameter("JSESSIONID"));
//		    response.addCookie(userCookie);
//		} else {
//		    String sessionId = session.getId();
//		    Cookie userCookie = new Cookie("JSESSIONID", sessionId);
//		    response.addCookie(userCookie);
//		}
//		
//		if(request.getSession().getAttribute("order") != null) {
//			Order order = (Order) request.getSession().getAttribute("order");
//			System.out.println("New available qty of item 0->"+order.getItems().get(0).getAvailable());
//		}
		if(request.getSession().getAttribute("order") != null) {
			
			Order order = (Order)request.getSession().getAttribute("order");
			for(int i=0; i < order.getItems().size(); i++) {
				order.getItems().get(i).setQuantity("0");
			}
			request.setAttribute("order", order);
			
			//request.getSession().setAttribute("order", order);
		} else {
			
			Order order = new Order();
			order.setItems(ServiceLocator.getInventoryService().getAvailableInventory().getItems());
			
			request.setAttribute("order", order);
			request.getSession().setAttribute("order", order);
		}
			
		return "OrderEntryForm";
	}
	
	@RequestMapping(path = "/submitItems", method = RequestMethod.POST)
	public String submitItems(@ModelAttribute("order") Order order, HttpServletRequest request) {
		request.getSession().setAttribute("order", order);
		System.out.println("SubmitSHIPPING"+order.getItems());

		if (ServiceLocator.getOrderProcessingService().validateItemAvailability(order)) {
			return "redirect:/purchase/paymentEntry";
		} else {
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
		request.getSession().setAttribute("payment", payment);
		
		return "redirect:/purchase/shippingEntry";
	}
	
	@RequestMapping(path = "/shippingEntry", method = RequestMethod.GET)
	public String viewShippingEntryForm(HttpServletRequest request, HttpServletResponse respone) {
		request.setAttribute("shipping", new ShippingInfo());
		
		return "ShippingEntryForm";
	}
	
	@RequestMapping(path = "/submitShipping", method = RequestMethod.POST)
	public String submitShipping(@ModelAttribute("shipping") ShippingInfo shipping, HttpServletRequest request,HttpServletResponse respone) throws IOException {
		request.getSession().setAttribute("shipping", shipping);
		
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
		System.out.println(order.getItems());
		for(Item i: order.items) {
			int updated_available = Integer.parseInt(i.getAvailable())-Integer.parseInt(i.getQuantity());
			i.setAvailable(updated_available+"");
			//i.setQuantity("0");
		}
		for(Item i: order.items) {
//			int updated_available = Integer.parseInt(i.getAvailable())-Integer.parseInt(i.getQuantity());
			System.out.println(i.getAvailable());
		}
		request.getSession().setAttribute("order", order);
		return "redirect:/purchase/viewConfirmation";
	}
	
	@RequestMapping(path = "/viewConfirmation", method = RequestMethod.GET)
	public String viewViewConfirmationForm(HttpServletRequest request, HttpServletResponse respone) throws IOException {
		return "Confirmation";
	}
}