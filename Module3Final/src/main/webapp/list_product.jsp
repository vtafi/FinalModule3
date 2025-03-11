<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Quản lý Sản phẩm</h2>

    <form action="products" method="GET" class="form-inline mb-4">
        <div class="form-group mr-2">
            <label for="name" class="mr-2">Product Name:</label>
            <input type="text" id="name" name="name" class="form-control" placeholder="Enter product name" value="${param.name}">
        </div>
        <div class="form-group mr-2">
            <label for="price" class="mr-2">Price:</label>
            <input type="number" id="price" name="price" class="form-control" placeholder="Enter price" value="${param.price}">
        </div>
        <button type="submit" class="btn btn-success">Search</button>
    </form>

    <a href="products?action=add" class="btn btn-primary mb-3">Thêm sản phẩm</a>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>STT</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Color</th>
            <th>Category</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${products}">
            <tr>
                <td>${p.stt}</td>
                <td>${p.name}</td>
                <!-- Format giá tiền tệ -->
                <td><fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫"/></td>
                <td>${p.quantity}</td>
                <td>${p.color}</td>
                <td>${p.categoryName}</td>
                <td>
                    <a href="products?action=edit&id=${p.stt}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="products?action=delete&id=${p.stt}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
