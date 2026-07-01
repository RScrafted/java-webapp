package com.rsstore.servlet;

import javax.servlet.http.*;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        List<String> cart = (List<String>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        String product = req.getParameter("product");
        if (product != null) {
            cart.add(product);
        }

        session.setAttribute("cart", cart);

        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }
}