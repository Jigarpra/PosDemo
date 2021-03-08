package com.sts.miniproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.sts.miniproject.repo.SalesRepo;
import com.sts.miniproject.services.ProductService;
import com.sts.miniproject.vo.Sales;

import ch.qos.logback.core.net.SyslogOutputStream;



@Controller
public class SalesController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private SalesRepo salesRepo;
	
	@RequestMapping("/")
	public String home() {
		
		return"home";
	}
	
	
	@RequestMapping(value="/saveSales",method =RequestMethod.POST)
	public  RedirectView saving(@ModelAttribute Sales sales,HttpServletRequest request) {
		if(sales.getSalesItem()!=null) {
			sales.getSalesItem().forEach(x->{
				x.setSales(sales);
				System.out.print(x);
			});
		}
		//////
		salesRepo.save(sales);
		
		  RedirectView redirectview = new RedirectView();
		  redirectview.setUrl(request.getContextPath()+"/");
		 
			return redirectview;	
	}
	 
	
	@RequestMapping(value="/dataTable")
	@ResponseBody
	public DataTablesOutput<Sales> GetDataTab(@Valid DataTablesInput input ){
		
		Specification<Sales> specification = new Specification<Sales>() {

			@Override
			public Predicate toPredicate(Root<Sales> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
			List<Predicate> predicates = new ArrayList<Predicate>();
			query.orderBy(criteriaBuilder.desc( root.get("salesId")));
			return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
			}
			};
		DataTablesOutput<Sales> dt = salesRepo.findAll(input,specification);
		return dt;
	}
	
	 @RequestMapping("/getSales")
	 @ResponseBody
	 public List<Sales> getListOfSale(){
		 List<Sales> sl = salesRepo.findAll();
		 return sl;
	 }
	
}
