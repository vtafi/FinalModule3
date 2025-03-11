package respository;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository {

    private static final String GET_ALL =
            "SELECT * FROM Product";
    private static final String INSERT_PRODUCT =
            "INSERT INTO Product (name, price, quantity, color, category_id) VALUES (?, ?, ?, ?, ?)";
    private static final String UPDATE_PRODUCT =
            "UPDATE Product SET name = ?, price = ?, quantity = ?, color = ?, category_id = ? WHERE id = ?";

    private static final String GET_PRODUCT_BY_ID = "SELECT * FROM Product WHERE id = ?";

    private static final String DELETE_PRODUCT = "DELETE FROM Product WHERE id = ?";

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(GET_ALL);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                productList.add(new Product(
                        rs.getInt("id"), rs.getString("name"), rs.getDouble("price"),
                        rs.getInt("quantity"), rs.getString("color"),
                         rs.getString("category_id")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }
    public void addProduct(Product product) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_PRODUCT)) {

            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setInt(3, product.getQuantity());
            stmt.setString(4, product.getColor());
            stmt.setString(5, product.getCategoryName());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product product) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_PRODUCT)) {

            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setInt(3, product.getQuantity());
            stmt.setString(4, product.getColor());
            stmt.setString(5, product.getCategoryName());
            stmt.setInt(6, product.getStt());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Product getProductById(int id) {
        Product product = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(GET_PRODUCT_BY_ID)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    product = new Product(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getInt("quantity"),
                            rs.getString("color"),
                            rs.getString("category_id")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }


    public void deleteProduct(int id) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(DELETE_PRODUCT)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
