<!DOCTYPE html>
<html>
<head>
    <title>Carrito de Compra</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .product {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .product img {
            width: 100px;
            height: 100px;
            margin-right: 10px;
        }

        .product-details {
            flex-grow: 1;
        }

        .product-title {
            font-weight: bold;
        }

        .product-price {
            color: #888;
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Carrito de Compra</h1>

    <div class="product">
        <img src="Catalogo/870crucial.jpg" alt="Producto 1">
        <div class="product-details">
            <h3 class="product-title">Samsung 870 EVO</h3>
            <p class="product-price">$ 19.990</p>
        </div>
        <a class="button" href="#">Comprar</a>
    </div>

    <div class="buttons">
        <a class="button" href="catalogoSSD.jsp">Volver</a>
    </div>
</div>
</body>
</html>
