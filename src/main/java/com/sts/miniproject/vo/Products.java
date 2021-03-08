package com.sts.miniproject.vo;

import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

@Entity
@Data
public class Products {
     
	@Id
	@GeneratedValue(strategy =  GenerationType.AUTO)
	private long productId;
	
	private String productName;
	
	
	@OneToMany(mappedBy = "products",cascade = CascadeType.ALL)
	@JsonIgnoreProperties("products")
	private List<ProductVariants> productVariants;
	
}
