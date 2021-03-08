package com.sts.miniproject.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sts.miniproject.vo.Products;

public interface ProductsRepo extends JpaRepository<Products, Long>{
	
}
