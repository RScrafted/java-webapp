<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>RS Shoe Apparel</title>

    <style>
        body{
            margin:0;
            font-family:Arial, Helvetica, sans-serif;
            background:#f4f6f9;
        }

        .navbar{
            background:#1f2937;
            color:white;
            padding:18px 40px;
            font-size:24px;
            font-weight:bold;
        }

        .hero{
            text-align:center;
            padding:80px 20px;
            background:linear-gradient(135deg,#2563eb,#1d4ed8);
            color:white;
        }

        .hero h1{
            font-size:48px;
            margin-bottom:10px;
        }

        .hero p{
            font-size:20px;
            opacity:.9;
        }

        .btn{
            display:inline-block;
            margin-top:30px;
            padding:15px 30px;
            background:#f59e0b;
            color:white;
            text-decoration:none;
            border-radius:8px;
            font-weight:bold;
            transition:.3s;
        }

        .btn:hover{
            background:#d97706;
        }

        .products{
            display:flex;
            justify-content:center;
            gap:30px;
            margin:60px auto;
            max-width:1000px;
            flex-wrap:wrap;
        }

        .card{
            background:white;
            width:250px;
            padding:25px;
            border-radius:12px;
            box-shadow:0 4px 15px rgba(0,0,0,.1);
            text-align:center;
        }

        .emoji{
            font-size:55px;
        }

        .price{
            color:#2563eb;
            font-weight:bold;
            font-size:22px;
        }

        footer{
            margin-top:60px;
            background:#1f2937;
            color:white;
            text-align:center;
            padding:20px;
        }
    </style>

</head>

<body>

<div class="navbar">
    👟 RS Shoe Apparel
</div>

<div class="hero">
    <h1>Step Into Style</h1>
    <p>Premium footwear and apparel at unbeatable prices.</p>

    <a class="btn" href="products">
        Browse Products
    </a>
</div>

<div class="products">

    <div class="card">
        <div class="emoji">👟</div>
        <h3>Running Shoes</h3>
        <p>Lightweight comfort for every run.</p>
        <div class="price">From £59.99</div>
    </div>

    <div class="card">
        <div class="emoji">🥾</div>
        <h3>Boot Collection</h3>
        <p>Durable outdoor and lifestyle boots.</p>
        <div class="price">From £99.99</div>
    </div>

    <div class="card">
        <div class="emoji">🧥</div>
        <h3>Sports Apparel</h3>
        <p>Comfortable clothing for active lifestyles.</p>
        <div class="price">New Arrivals</div>
    </div>

</div>

<footer>
    Developed by Rachit &copy; 2026 | Demo E-Commerce Application
</footer>

</body>
</html>