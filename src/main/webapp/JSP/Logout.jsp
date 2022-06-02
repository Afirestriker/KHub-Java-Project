<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp" %>

<%
	try
	{
		System.out.print("\n Logout.jsp is called \n");

		session.invalidate();
		response.sendRedirect("Index.jsp");		
	}
	catch(Exception e)
	{
		System.out.println("\n Logout.jsp Exception: " + e);
	}

%>