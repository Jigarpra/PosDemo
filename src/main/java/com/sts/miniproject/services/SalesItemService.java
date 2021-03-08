package com.sts.miniproject.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sts.miniproject.repo.SalesItemRepo;

@Component
public class SalesItemService {

	@Autowired
	private SalesItemRepo salesItemRepo;
}
