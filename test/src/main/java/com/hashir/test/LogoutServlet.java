package com.hashir.test;

import java.io.IOException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		/**
		 * CLEARING THE SESSION
		 */
		
		HttpSession httpSession = req.getSession();
		
		/***
		 * Method 01
		 * Manually removes each session.
		 */
		
//		if(httpSession.getAttribute("logged_in") != null) {
//			httpSession.removeAttribute("logged_in");
//			httpSession.removeAttribute("user");
//		}
//		boolean l = (Boolean) httpSession.getAttribute("logged_in");
		
		/***
		 * Method 02
		 * Remove sessions via enumeration itself
		 */
		
		
		Enumeration<String> sessionEnumeration = httpSession.getAttributeNames();
		
		while(sessionEnumeration.hasMoreElements()) {
			String element= sessionEnumeration.nextElement();
			httpSession.removeAttribute(element);
		}
		
		/***
		 * Method 03
		 * Remove sessions via List
		 */
//		List<String> sessions = Collections.list(sessionEnumeration);
//		System.out.println("Size : " + sessions.size());
//		
//		for (String item : sessions) {
//			System.out.println("Status : " + item);
//			httpSession.removeAttribute(item);
//		}
		

//		RequestDispatcher rDispatcher = req.getRequestDispatcher("login.jsp");
//		rDispatcher.forward(req, res);
		
		
		
		
		/**
		 * CLEARING THE COOKIES
		 */
		Cookie cookies[] = req.getCookies();
		for(int i=0; i < cookies.length; i++) {
			if(cookies[i].getName().equalsIgnoreCase("welcome")) {
				cookies[i].setMaxAge(0);
				res.addCookie(cookies[i]);
			} else if(cookies[i].getName().equalsIgnoreCase("u-email")) {
				cookies[i].setMaxAge(0);
				res.addCookie(cookies[i]);
			}
		}
		
		
		res.sendRedirect("login1.jsp");
		
	}

}
