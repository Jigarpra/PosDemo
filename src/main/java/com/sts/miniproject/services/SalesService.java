package com.sts.miniproject.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sts.miniproject.repo.SalesRepo;

@Component
public class SalesService {

	@Autowired
	private SalesRepo salesRepo;
	
}
