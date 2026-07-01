<%@ page import="java.util.*, com.rsstore.model.Product" %>

<html>
<body>

<h2>Products</h2>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    for (Product p : products) {
%>

    <p>
        <%= p.getName() %> - £<%= p.getPrice() %>
        <a href="cart?product=<%= p.getName() %>">Add to Cart</a>
    </p>

<% } %>

</body>
</html>