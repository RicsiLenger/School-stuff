package com.pte.beadando.controller;

import com.pte.beadando.model.Product;
import com.pte.beadando.service.ProductService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/product")
public class ProductController {

    ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public ResponseEntity<Product> getProductByPlate(@RequestBody Product newProduct){
        Product product = productService.getProduct(newProduct.getPlate());
        return ResponseEntity.ok(product);
    }

    @PostMapping
    public ResponseEntity<Product> createProduct(@RequestBody Product newProduct){
        Product product = productService.createProduct(newProduct);
        return ResponseEntity.ok(product);
    }



}
