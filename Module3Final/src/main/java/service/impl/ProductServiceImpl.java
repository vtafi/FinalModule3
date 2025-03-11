package service.impl;

import model.Product;
import respository.ProductRepository;
import service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {

    private static ProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> getAll() {
        return productRepository.getAllProducts() ;
    }

    @Override
    public void remove(int id) {
        productRepository.deleteProduct(id);

    }

    @Override
    public List<Product> findByName(String name) {
        return null;
    }

    @Override
    public Product findById(int id) {
        return productRepository.getProductById(id);
    }

    @Override
    public void update(Product product) {
        productRepository.updateProduct(product);
    }

    @Override
    public void add(Product product) {
        productRepository.addProduct(product);

    }

    @Override
    public List<Product> findByPrice(double minPrice, double maxPrice) {
        return null;
    }
}
