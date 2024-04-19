<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Sipariş Onayı</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Özel CSS -->
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
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        h2 {
            font-weight: 600;
            text-align: center;
            color: #ff4136;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            text-align: center;
            line-height: 1.5;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 600;
            color: white;
            display: block;
            margin: 20px auto 0;
            text-align: center;
            transition: background-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Sipariş Hatası</h2>
        <p>Siparişiniz başarısız!</p>
        <p>Tekrar Deneyiniz.</p>
        <a href="index.jsp" class="btn btn-primary">Anasayfaya Dön</a>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
