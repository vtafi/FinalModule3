package controller;

import model.Product;
import service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/products","/"})
public class ProductControllerServlet extends HttpServlet {
    private final ProductServiceImpl productService = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "delete":
                deleteProduct(req, resp);
                break;
            case "edit" :
                showUpdateForm(req, resp);
                break;
            case "add" :
                showAddForm(req ,resp);
                break;
            default:
                listProduct(req,resp);
                break;

        }
    }

    private void listProduct(HttpServletRequest request,HttpServletResponse response ) throws ServletException , IOException{
        request.setAttribute("products",productService.getAll());
        request.getRequestDispatcher("list_product.jsp").forward(request,response);
    }
    private void showAddForm(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        request.getRequestDispatcher("add_product.jsp").forward(request,response);
    }
    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("update_product.jsp").forward(request, response);
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        productService.remove(id);
        response.sendRedirect("products");
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                updateProduct(req, resp);
                break;
            case "add":
                addProduct(req,resp);
                break;
        }
    }
    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String category = request.getParameter("category");
        Product product = new Product(name, price, quantity, color, category);
        productService.add(product);
        response.sendRedirect("products");
    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String category = request.getParameter("category");
        Product product = new Product(id, name, price, quantity, color, category);
        productService.update(product);
        response.sendRedirect("products");
    }


}
