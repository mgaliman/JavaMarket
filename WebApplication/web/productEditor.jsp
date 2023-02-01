<%-- 
    Document   : productEditor
    Created on : Jan 26, 2023, 1:46:45 PM
    Author     : mgaliman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Editor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
        <link rel="stylesheet" href="css/main.css">   
        <!--Belotta font!-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bellota:wght@300;400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/categoryEditor.css">
    </head>
    <body>
        <!-- Navigation bar -->
        <%@include file='navbar.jsp'%>

        <form onsubmit="addOrEditProduct(event)" >
            <div class="mx-auto py-5" style="width: 70%;">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <image src="./assets/imgPlaceholder.jpg" alt="userImage" id="imgPlaceholder" style="width: 100%;"/>
                        </div>
                        <div class="col-sm-6">
                            <div class="card shadow-2-strong" style="background-color: #f5f7fa;">
                                <div class="card-body mx-auto mt-3" style="width: 90%;">
                                    <div>
                                        <p>Image:</p>
                                        <input type="file" id="imgPicker" accept="image/*" onchange="loadFile(event)"></input>
                                    </div>
                                    <div class="mt-3">
                                        <input type="text" id="inTitle" required maxLength="50" pattern="[^()/><\][\\\x22,;|]+" 
                                               placeholder="Title" class="form-control form-control-lg"/>
                                    </div>
                                    <div class="mt-3">
                                        <input type="text" id="inDescription" required maxLength="500" pattern="[^()/><\][\\\x22,;|]+" 
                                               placeholder="Description" class="form-control form-control-lg"/>
                                    </div>
                                    <div class="mt-3">
                                        <input type="number" id="inPrice" required min="0" inputmode="numeric" pattern="[^()/><\][\\\x22,;|]+" 
                                               placeholder="Price" class="form-control form-control-lg"/>
                                    </div>
                                    <div class="mt-3">
                                        <p>Category: </p>
                                        <select name="categories" id="categories">
                                            <c:forEach var="category" items="${categories}">
                                                <option value=${category.id}>${category.title}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <button type="submit" class="mx-auto mt-3 mb-3 btn btn-primary" style="width: 90%">Submit</button>
                                </div>           
                            </div>                        
                        </div>
                    </div>           
                </div>
            </div>
        </form>

        <div class="mx-auto py-5" style="width: 70%;">
            <div class="card shadow-2-strong" style="background-color: #f5f7fa;">
                <div class="card-body">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8"><h2>Product <b>Manager</b></h2></div>
                            <div class="col-sm-4">
                                <i onClick="openModal()" class="material-icons-outlined">
                                    add_circle_outline
                                </i>
                            </div>
                        </div>
                    </div>
                    <table class="table table-borderless mb-0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody class="tableBody">
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <td>${product.id}</td>
                                    <td>${product.title}</td>
                                    <td>${product.description}</td>
                                    <td>${product.price} €</td>
                                    <td>
                                        <a href="#" class="edit" onclick="getProduct(${product.id})"><i class="material-icons">&#xE254;</i></a>
                                        <a href="#" class="delete" onClick="deleteProduct(${product.id}, this)"><i class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>    
                            </c:forEach>   
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="javascript/productEditor.js" defer></script>
    </body>
</html>
