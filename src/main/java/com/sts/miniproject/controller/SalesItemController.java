package com.sts.miniproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sts.miniproject.repo.SalesItemRepo;
import com.sts.miniproject.vo.SalesItem;

@Controller
public class SalesItemController {

	@Autowired
    private SalesItemRepo salesItemRepo;
	
	@RequestMapping("/SalesItem")
	@ResponseBody
	public List<SalesItem> getSalesItems(){
		List<SalesItem> sl = salesItemRepo.findAll();
		return sl;
	}
	
}
