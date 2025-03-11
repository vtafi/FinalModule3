package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> getAll();
    void remove(int id);
    List<Product> findByName(String name);
    Product findById(int id);
    void update(Product product);
    void add(Product product);
    List<Product> findByPrice(double minPrice, double maxPrice);

}
