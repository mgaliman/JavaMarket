<%-- 
    Document   : cart
    Created on : Jan 26, 2023, 1:55:29 PM
    Author     : mgaliman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
        <link rel="stylesheet" href="css/main.css">       
        <link rel="stylesheet" href="css/cart.css">
    </head>
    <!-- Navigation bar -->
    <%@include file='navbar.jsp'%>
    <body>
        <div >
            <div class="container py-3">
                <div class="row d-flex justify-content-center my-4">
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-header py-3 d-flex">
                                <h5 class="mb-0">Cart - ${products.size()} items</h5>
                                <button class="btn btn-outline-danger clear-all-btn" onclick="clearCart()">Clear All</button>
                            </div>
                            <div class="card-body">
                                <!-- Single item -->
                                <c:forEach var="product" items="${products}">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                            <!-- Image -->
                                            <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                                                <img class="img-fluid" src="${product.getKey().picturePath}">
                                            </div>
                                            <!-- Image -->
                                        </div>

                                        <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                            <!-- Data -->
                                            <p><strong>${product.getKey().title}</strong></p>
                                            <button type="button" class="btn btn-primary btn-sm me-1 mb-2" data-mdb-toggle="tooltip"
                                                    title="Remove item" id="${product.getKey().id}" onclick="removeProductFromCart(${product.getKey().id})">
                                                <span class="material-icons-outlined">
                                                    delete
                                                </span>
                                            </button>
                                            <!-- Data -->
                                        </div>

                                        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                            <!-- Quantity -->
                                            <div class="d-flex mb-4" style="max-width: 300px">
                                                <button class="btn btn-primary px-3 me-2"
                                                        onclick="reduceQuantity(${product.getKey().id}, this)">
                                                    <span class="material-icons-outlined">
                                                        remove
                                                    </span>

                                                </button>

                                                <div class="form-outline">
                                                    <input id="quantity" min="0" name="quantity" value=${product.getValue()} type="number"
                                                           class="form-control form-control-sm" onkeydown="return false"/>
                                                    <label class="form-label" for="form1">Quantity</label>
                                                </div>

                                                <button class="btn btn-primary px-3 ms-2"
                                                        onclick="increaseQuantity(${product.getKey().id}, this)">
                                                    <span class="material-icons-outlined">
                                                        add
                                                    </span>
                                                </button>
                                            </div>
                                            <!-- Quantity -->

                                            <!-- Price -->
                                            <p class="text-start text-md-center">
                                                &euro; ${product.getKey().price * product.getValue()}                                                
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- Single item -->
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <p><strong>Expected shipping delivery</strong></p>
                                <div id="delivery-date"></div>
                                <div id="two-weeks-from-today"></div>
                            </div>
                        </div>                        
                    </div>
                    <div class="col-md-4">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Summary</h5>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                        Products
                                        <span>&euro; ${totalPrice}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                        Shipping
                                        <span>Gratis</span>
                                    </li>
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>Total amount</strong>
                                            <strong>
                                                <p class="mb-0">(including VAT)</p>
                                            </strong>
                                        </div>
                                        <span><strong>&euro; ${totalPrice}</strong></span>
                                    </li>
                                </ul>
                                <div class="d-flex">
                                    <a class="btn btn-success mr-1" href="deliveryInfo.jsp" id="cashOnDelivery">
                                        Go to checkout
                                    </a>

                                    <a class="btn btn-secondary clear-all-btn" href="home">
                                        Back to shopping
                                    </a
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="javascript/cart.js" defer></script>
    </body>
</html>