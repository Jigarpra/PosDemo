package com.sts.miniproject.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sts.miniproject.repo.ProductVariantsRepo;
import com.sts.miniproject.vo.ProductVariants;

@Component
public class ProductVariantsService {

	@Autowired
	private ProductVariantsRepo productVariantsRepo;
	

	public ProductVariants fetchVariants(String barCode){
		ProductVariants variant =  productVariantsRepo.findVariantsByBarcode(barCode);
		return variant;
	}
}
