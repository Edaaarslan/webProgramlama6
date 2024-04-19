package servlet;

import java.io.*;
import javax.servlet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ShoppingCart;

@jakarta.servlet.annotation.WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

       
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        
        
        String itemId = request.getParameter("itemId");

        
        if (cart != null) {
            cart.removeItem(itemId);
        }

       
        response.sendRedirect("viewCart.jsp");
    }
}
