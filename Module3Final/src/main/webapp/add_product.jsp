<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Product</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
            padding-top: 50px;
        }
        .container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        h2 {
            margin-bottom: 30px;
            text-align: center;
        }
        .form-group label {
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add New Product</h2>

    <form action="products?action=add" method="POST" onsubmit="return showSuccessMessage()">
        <div class="form-group">
            <label for="name">Product Name:</label>
            <input type="text" id="name" name="name" class="form-control" required minlength="3" placeholder="Enter product name">
        </div>

        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" class="form-control" min="10000000" required placeholder="Enter price">
        </div>

        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" class="form-control" min="1" required step="1" placeholder="Enter quantity">
        </div>

        <div class="form-group">
            <label for="color">Color:</label>
            <select id="color" name="color" class="form-control" required>
                <option value="">Select Color</option>
                <option value="Đỏ">Đỏ</option>
                <option value="Xanh">Xanh</option>
                <option value="Đen">Đen</option>
                <option value="Trắng">Trắng</option>
                <option value="Vàng">Vàng</option>
            </select>
        </div>

        <div class="form-group">
            <label for="category">Category:</label>
            <select id="category" name="category" class="form-control" required>
                <option value="">Select Category</option>
                <option value="Phone">Phone</option>
                <option value="Tivi">Tivi</option>
                <option value="Máy Giặt">Máy Giặt</option>
                <option value="Tủ lạnh">Tủ lạnh</option>
            </select>
        </div>

        <button type="submit" class="btn btn-success btn-block">Create</button>
        <button type="button" class="btn btn-secondary btn-block" onclick="window.location.href='products'">Back</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    function showSuccessMessage() {
        alert("Product added successfully!");
        return true;
    }
</script>

</body>
</html>
