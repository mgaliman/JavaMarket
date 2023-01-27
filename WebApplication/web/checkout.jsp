<%-- 
    Document   : checkout
    Created on : Jan 26, 2023, 1:54:13 PM
    Author     : mgaliman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <link rel="stylesheet" href="css/main.css">   
    </head>
    <body>
        <div align="center">
            <h1>Check Out</h1>
            <br/>
            <form action="checkout" method="post">
                <table>
                    <tr>
                        <td>Product/Service:</td>
                        <td><input type="text" name="product" value="Next iPhone" /></td>
                    </tr>
                    <tr>
                        <td>Quantity:</td>
                        <td><input type="text" name="quantity" value="1" /></td>
                    </tr>
                    <tr>
                        <td>Sub Total:</td>
                        <td><input type="text" name="subtotal" value="100" /></td>
                    </tr>
                    <tr>
                        <td>Shipping:</td>
                        <td><input type="text" name="shipping" value="10" /></td>
                    </tr>    
                    <tr>
                        <td>Tax:</td>
                        <td><input type="text" name="tax" value="10" /></td>
                    </tr>    
                    <tr>
                        <td>Total Amount:</td>
                        <td><input type="text" name="total" value="120" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Checkout" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>