<%@ page import="java.util.*" %>

<html>
<body>

<h2>Your Cart</h2>

<%
    List<String> cart = (List<String>) session.getAttribute("cart");

    if (cart != null) {
        for (String item : cart) {
%>
            <p><%= item %></p>
<%
        }
    } else {
%>
    <p>Cart is empty</p>
<%
    }
%>

</body>
</html>