package com.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class MyServlet
 */

//Write a Java program to validate jsp form server side. 
//First Name: Only Alphabets Last Name: Only Alphabets Mobile: Only 10 Numbers 
//Email: Standard Email Id 
//Password: Minimum One 1 Upper, Minimum 1 Lower, Minimum 1 Digit, Minimum 
//1 Special Character from @, #, $, %, _, & I2. Write CRUD operation using jsp only. 

public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String gender=request.getParameter("gender");
		String password=request.getParameter("password");
		
		String errorMsg="";
		if(!fname.matches("[a-zA-Z]+")) {
			errorMsg+="first name must only contain alphabet.<br>";
		}
		if(!lname.matches("[a-zA-Z]+")) {
			errorMsg+="last name must only contain alphabet.<br>";
		}
		if(!mobile.matches("\\d{10}")) {
			errorMsg+="mobile number must be 10 digits.<br>";
		}
		String emailPattern="[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
		if(!email.matches(emailPattern)) {
			errorMsg+="email must be in format,<br>";
		}
		String passwordPattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$";
		if(!password.matches(passwordPattern)) {
			errorMsg+="Password must contain one uppercase alphabet,one lowercase alphabet,one number and one special charater and must contain 6 character long<br>";
		}
		response.setContentType("text/html");
		if(errorMsg.isEmpty()) {
			response.getWriter().println("Successful");
		}else {
			response.getWriter().println("failed<br>"+errorMsg);
		}
	}

}
