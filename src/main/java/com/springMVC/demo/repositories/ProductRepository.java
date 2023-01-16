package com.springMVC.demo.repositories;

import com.springMVC.demo.models.Product;
import org.springframework.data.repository.CrudRepository;

public interface ProductRepository extends CrudRepository<Product, Integer> {
    Iterable<Product> findByCategoryID(int categoryID);
}
