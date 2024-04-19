<%@ page import="model.Catalog, model.Item, model.ShoppingCart" %>
<%@ page import="java.util.Map" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Alışveriş Sepeti</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #001f3f; 
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
        }
        h2 {
            color: #fff; 
            font-weight: 600;
            text-align: center;
            margin-bottom: 20px;
        }
        .cart-item-card {
            background-color: rgba(255, 255, 255, 0.1); 
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .item-info {
            color: #ddd;
        }
        .remove-button {
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        .remove-button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Alışveriş Sepeti</h2>
        <%
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            Catalog catalog = (Catalog) session.getAttribute("catalog");
        
            if (cart == null) {
                out.println("<p class='text-white'>Alışveriş sepeti boş.</p>");
            } else {
                Map<String, Integer> cartItems = cart.getCartItems();
                for (Map.Entry<String, Integer> entry : cartItems.entrySet()) {
                    String itemId = entry.getKey();
                    int quantity = entry.getValue();
                    Item item = catalog.getItem(itemId);
        %>
                    <div class="cart-item-card">
                        <p class="item-info">Ürün: <strong><%= item.getName() %></strong> - Miktar: <%= quantity %></p>
                        <form action="RemoveFromCartServlet" method="post">
                            <input type="hidden" name="itemId" value="<%= itemId %>">
                            <button type="submit" class="remove-button">Kaldır</button>
                        </form>
                    </div>
        <%
                }
            }
        %>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
