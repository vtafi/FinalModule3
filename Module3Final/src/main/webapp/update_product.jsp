<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Product</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Update Product</h2>

    <form action="products?action=update" method="POST">
        <input type="hidden" name="id" value="${product.stt}" />

        <div class="form-group">
            <label for="name">Product Name</label>
            <input type="text" id="name" name="name" class="form-control" value="${product.name}" required>
        </div>

        <div class="form-group">
            <label for="price">Price</label>
            <input type="number" id="price" name="price" class="form-control" value="${product.price}" min="10000000" required>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity</label>
            <input type="number" id="quantity" name="quantity" class="form-control" value="${product.quantity}" min="1" required>
        </div>

        <div class="form-group">
            <label for="color">Color</label>
            <select id="color" name="color" class="form-control" required>
                <option value="Đỏ" ${product.color == 'Đỏ' ? 'selected' : ''}>Đỏ</option>
                <option value="Xanh" ${product.color == 'Xanh' ? 'selected' : ''}>Xanh</option>
                <option value="Đen" ${product.color == 'Đen' ? 'selected' : ''}>Đen</option>
                <option value="Trắng" ${product.color == 'Trắng' ? 'selected' : ''}>Trắng</option>
                <option value="Vàng" ${product.color == 'Vàng' ? 'selected' : ''}>Vàng</option>
            </select>
        </div>

        <div class="form-group">
            <label for="category">Category</label>
            <select id="category" name="category" class="form-control" required>
                <option value="Phone" ${product.categoryName == 'Phone' ? 'selected' : ''}>Phone</option>
                <option value="Tivi" ${product.categoryName == 'Tivi' ? 'selected' : ''}>Tivi</option>
                <option value="Máy Giặt" ${product.categoryName == 'Máy Giặt' ? 'selected' : ''}>Máy Giặt</option>
                <option value="Tủ lạnh" ${product.categoryName == 'Tủ lạnh' ? 'selected' : ''}>Tủ lạnh</option>
            </select>
        </div>

        <button type="submit" class="btn btn-success btn-block">Update Product</button>

        <button type="button" class="btn btn-secondary btn-block" onclick="window.location.href='products'">Back</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
