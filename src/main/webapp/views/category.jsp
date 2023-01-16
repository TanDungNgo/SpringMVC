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
    <title>Category List</title>
  </head>
  <body>
    <div class="container">
      <a href="products/insertProduct">Insert new Product</a>
      <div class="row justify-content-center">
        <div class="col-md-6 text-center mt-2 mb-3">
          <h2 class="heading-section">Category List</h2>
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
                    <th>Description</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <c:forEach var="category" items="${categories}">
                  <tbody>
                    <th scope="row">${category.getCategoryID()}</th>
                    <td>${category.getCategoryName()}</td>
                    <td>${category.getDescription()}</td>
                    <td>
                      <a
                        href="products/getProductsByCategoryID/${category.getCategoryID()}"
                        class="btn btn-info"
                        >Show Products</a
                      >
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
