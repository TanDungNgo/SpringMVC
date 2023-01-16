<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    /> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Product List</title>
  </head>
  <body>
    <div class="container">
      <div class="mt-3 mb-4">
        <div class="d-flex justify-content-start">
          <div>
            <a href="../../categories" class="btn btn-secondary">
              <!-- <span class="glyphicon glyphicon-chevron-left"></span> -->
              <i class="fa fa-chevron-left" aria-hidden="true"></i>
            </a>
          </div>
          <h2 class="heading-section mx-5 my-0">Product List</h2>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="table-wrap">
            <table class="table">
              <thead class="bg-primary text-white">
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Price</th>
                  <th>Description</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <c:forEach var="product" items="${products}">
                <tbody>
                  <th scope="row">${product.getProductID()}</th>
                  <td>${product.getProductName()}</td>
                  <td>${product.getFormattedPrice()}</td>
                  <td>${product.getDescription()}</td>
                  <td>
                    <a
                      href="../../products/changeCategory/${product.getProductID()}"
                      class="btn btn-success"
                    >
                      <!-- <span class="glyphicon glyphicon-edit"></span> -->
                      <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                    </a>
                    <a
                      href="../../products/deleteProduct/${product.getProductID()}"
                      class="btn btn-danger"
                      onclick="return confirm('Are you sure you want to delete this Product?') ? true: false"
                    >
                      <!-- <span class="glyphicon glyphicon-trash"></span> -->
                      <i class="fa fa-trash" aria-hidden="true"></i>
                    </a>
                  </td>
                </tbody>
              </c:forEach>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
