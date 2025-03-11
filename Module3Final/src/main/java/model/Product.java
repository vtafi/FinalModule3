package model;

public class Product {
    private int stt;
    private String name;
    private double price;
    private int quantity;
    private String color;
    private String categoryName;

    public Product(int stt, String name, double price, int quantity, String color, String categoryName) {
        this.stt = stt;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.categoryName = categoryName;
    }

    public Product(String name, double price, int quantity, String color, String categoryName) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.categoryName = categoryName;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
