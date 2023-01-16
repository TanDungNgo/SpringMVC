package com.springMVC.demo.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @Column(name = "productID")
    private int productID;
    @Column(name = "categoryID")
    private int categoryID;

    @Column(name = "productName")
    @NotNull
    @NotBlank(message = "Product's name cannot be null")
    @Size(min = 3, max = 300)
    private String productName;

    @Column(name = "price")
    @NotNull
    @Min(0)
    private int price;
    @Column(name = "description")
    @NotNull
    @NotBlank(message = "Product's description cannot be null")
    @Size(min = 5, max = 1000)
    private String description;

    public Product() {
    }

    public Product(int productID, int categoryID, String productName, int price, String description) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.price = price;
        this.description = description;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getPrice() {
        return price;
    }
    public String getFormattedPrice() {
        return String.format("$ %.2f", (price * 100.00) / 100.00);
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
