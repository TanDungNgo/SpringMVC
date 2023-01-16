<!DOCTYPE html>
<html lang="en">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
  prefix="form" uri="http://www.springframework.org/tags/form"%>
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
    <title>Insert product</title>
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
          <h2 class="heading-section mx-5 my-0">Insert new Product</h2>
        </div>
      </div>
      <div class="row">
        <div class="mx-5 px-5 py-2">
            <form:form method="POST"
            action="/products/insertProduct"  
            modelAttribute="product" class="row g-3">          
            <div class="col-12">
                <form:label class="form-label" path="productName">Product's name: </form:label>
                <form:input type="text"
                    value="${product.getProductName()}"
                    placeholder="Enter product's name"
                    path="productName"
                    class="form-control"
                />
                <form:errors path="productName" class="text-danger"/>
            </div> 
            <div class="col-12">
                <form:label class="form-label" path="description">Description: </form:label>
                <form:textarea path="description" 
                value="${product.getDescription()}" placeholder="Enter description" 
                class="form-control"/>
                <form:errors path="description" class="text-danger"/>
            </div>
            <div class="col-md-6">
                <form:label class="form-label" path="price">Product's price: </form:label>
                <div class="input-group mb-3">
                    <span class="input-group-text">$</span>
                    <span class="input-group-text">0.00</span>
                    <form:input type="number"
                        value="${product.getPrice()}"
                        placeholder="Enter product's price"
                        path="price"
                        class="form-control"
                    />
                </div>
                <form:errors path="price" class="text-danger" /> 
            </div>
            <div class="col-md-6">
                <form:label class="form-label" path="categoryID">Category: </form:label>
                <form:select path="categoryID" class="form-select">
                    <c:forEach var="category" items="${categories}">
                        <form:option value="${category.getCategoryID()}">
                            ${category.getCategoryName()}
                        </form:option>
                    </c:forEach>
                </form:select>
            </div>
            <input type="submit" value="Insert" class="btn btn-primary"/>        
            </form:form>
        </div>
      </div>
    </div>
  </body>
</html>
