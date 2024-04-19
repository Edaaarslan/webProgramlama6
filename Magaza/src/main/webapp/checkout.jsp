<%@ page import="model.Catalog, model.Item, model.ShoppingCart" %>
<%@ page import="java.util.Map" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sipariş Özeti</title>
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
            color: white;
        }
        .container {
            max-width: 800px;
            margin: auto;
        }
        h2, h3 {
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
            color: #ddd;
        }
        form {
            background-color: rgba(255, 255, 255, 0.1); 
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            background-color: #f8f9fa;
        }
        .form-label {
            font-size: 14px;
            display: block;
            margin-bottom: 5px;
        }
        .submit-button {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 600;
            width: 100%;
            transition: background-color 0.3s;
        }
        .submit-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Sipariş Özeti</h2>
        <%
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            Catalog catalog = (Catalog) session.getAttribute("catalog");
        
            if (cart == null) {
                out.println("<p>Alışveriş sepeti boş.</p>");
            } else {
                Map<String, Integer> cartItems = cart.getCartItems();
                double totalPrice = 0.0;
                
                for (Map.Entry<String, Integer> entry : cartItems.entrySet()) {
                    String itemId = entry.getKey();
                    int quantity = entry.getValue();
                    Item item = catalog.getItem(itemId);
                    
                    double itemTotal = item.getPrice() * quantity;
                    totalPrice += itemTotal;
        %>
                    <div class="cart-item-card">
                        <p>Ürün: <strong><%= item.getName() %></strong> - Miktar: <%= quantity %> - Fiyat: <strong><%= String.format("%.2f", itemTotal) %></strong></p>
                    </div>
        <%
                }
        %>
                <h3>Toplam Fiyat: <strong><%= String.format("%.2f", totalPrice) %></strong></h3>
        <%
            }
        %>
        <form action="PlaceOrderServlet" method="post">
            <h3>Ödeme Bilgileri</h3>
            <div class="form-group">
                <label for="cardNumber" class="form-label">Kart Numarası:</label>
                <input type="text" id="cardNumber" name="cardNumber" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="expiryDate" class="form-label">Son Kullanma Tarihi:</label>
                <input type="text" id="expiryDate" name="expiryDate" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="cvc" class="form-label">CVC:</label>
                <input type="text" id="cvc" name="cvc" class="form-control" required>
            </div>
            <h3>Adres Bilgileri</h3>
            <div class="form-group">
                <label for="address" class="form-label">Adres:</label>
                <input type="text" id="address" name="address" class="form-control" required>
            </div>
            <button type="submit" class="submit-button">Siparişi Tamamla</button>
        </form>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
