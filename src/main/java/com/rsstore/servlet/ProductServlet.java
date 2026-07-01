package com.rsstore.servlet;

import com.rsstore.model.Product;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Product> products = new ArrayList<>();

        products.add(new Product(1, "RS Runner Shoes", 59.99));
        products.add(new Product(2, "RS Classic Sneakers", 79.99));
        products.add(new Product(3, "RS Street Boots", 99.99));

        req.setAttribute("products", products);

        req.getRequestDispatcher("products.jsp").forward(req, resp);
    }
}