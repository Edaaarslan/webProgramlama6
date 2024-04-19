<%@ page import="model.Catalog, model.Item" %>
<%@ page import="java.util.Collection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ürün Listesi</title>
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
        .item-card {
            background-color: rgba(255, 255, 255, 0.1); 
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #fff; 
            font-weight: 600;
            text-align: center;
            margin-bottom: 20px;
        }
        .item-name {
            color: #fff;
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .item-description {
            color: #ddd;
            margin-bottom: 10px;
        }
        .item-price {
            color: #fff;
            font-size: 18px;
            font-weight: 600;
        }
        .add-to-cart {
            background-color: #007bff; 
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        .add-to-cart:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Ürün Listesi</h2>
        <%
            Catalog catalog = (Catalog) session.getAttribute("catalog");
            if (catalog == null) {
                catalog = new Catalog();
                session.setAttribute("catalog", catalog);
            }
            Collection<Item> items = catalog.getAllItems();
            for (Item item : items) {
        %>
            <div class="item-card">
                <h3 class="item-name"><%= item.getName() %></h3>
                <p class="item-description"><%= item.getDescription() %></p>
                <p class="item-price">Fiyat: <%= item.getPrice() %></p>
                <form action="viewCart.jsp" method="post">
                    <input type="hidden" name="itemId" value="<%= item.getId() %>">
                    <button type="submit" class="add-to-cart">Sepete Ekle</button>
                </form>
            </div>
        <%
            }
        %>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
