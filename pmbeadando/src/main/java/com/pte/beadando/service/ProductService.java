package com.pte.beadando.service;

import com.pte.beadando.model.Product;
import com.pte.beadando.repository.ProductRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
public class ProductService {
    ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product getProduct(String plate){
        Product product = productRepository.findByPlate(plate);
        return product;
    }
    @Transactional
    public Product createProduct(Product product){
        Product productCreated = productRepository.save(product);
        return productCreated;
    }

}
