package servlet;

import java.io.*;
import javax.servlet.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ShoppingCart;

@jakarta.servlet.annotation.WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

       
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

       
        String cardNumber = request.getParameter("cardNumber");
        request.getParameter("expiryDate");
        request.getParameter("cvc");
        request.getParameter("address");

       
        if (cart != null && cardNumber != null && !cardNumber.isEmpty()) {
           
            session.removeAttribute("cart");

           
            response.sendRedirect("orderConfirmation.jsp");
        } else {
           
            response.sendRedirect("orderError.jsp");
        }
    }
}
