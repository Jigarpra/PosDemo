package com.sts.miniproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sts.miniproject.repo.ProductsRepo;
import com.sts.miniproject.vo.Products;

@Controller
public class ProductsController {

	
	@Autowired
	private ProductsRepo productRepo;
	
	
	@RequestMapping("/fetchProducts")
	@ResponseBody
	public List<Products> getAllProducts(){
		List<Products> listOfProduct = productRepo.findAll();
		return listOfProduct;
	}
}
