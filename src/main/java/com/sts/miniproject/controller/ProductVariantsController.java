package com.sts.miniproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sts.miniproject.services.ProductVariantsService;
import com.sts.miniproject.vo.ProductVariants;

@Controller
public class ProductVariantsController {

	@Autowired
	private ProductVariantsService variantServ;
	@RequestMapping("/fetchVariants/{barCode}")
	@ResponseBody
	public ProductVariants getAllVariant(@PathVariable("barCode") String barCode){
		 ProductVariants variantList = variantServ.fetchVariants(barCode);
		return variantList;
	}
}
