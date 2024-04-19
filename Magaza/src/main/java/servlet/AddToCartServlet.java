package servlet;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.ShoppingCart;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }

       
        String itemId = request.getParameter("itemId");
        
        
        if (itemId != null && !itemId.isEmpty()) {
            cart.addItem(itemId);
            
            response.sendRedirect("viewCart.jsp");
        } else {
           
            response.sendRedirect("orderError.jsp?message=Invalid item ID");
        }
    }
}
