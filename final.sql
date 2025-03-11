CREATE DATABASE ProductDB;
USE ProductDB;

drop database productdb;



CREATE TABLE Product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL CHECK(price > 0),
    quantity INT NOT NULL CHECK(quantity > 0),
    color ENUM('Đỏ', 'Xanh', 'Đen', 'Trắng', 'Vàng') NOT NULL,
    category_id varchar(255) not null
   
);



INSERT INTO Product (name, price, quantity, color, category_id)
VALUES
('iPhone 11', 7990000, 12, 'Đen', "Phone"),
('iPhone 11 Pro', 11000000, 12, 'Đen', 'Phone'),
('iPhone X', 7490000, 12, 'Đen', 'Phone'),
('Smart Tivi 55 inch', 7990000, 5, 'Đen', 'Tivi'),
('Tủ lạnh 2 cánh Toshiba', 7990000, 8, 'Trắng','Tủ lạnh'),
('Máy giặt của ngang SamSung', 3200000, 10, 'Xanh','Máy giặt');

select * from product;


