package com.sts.miniproject.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Entity
@Data
public class ProductVariants {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long productVariantId;
	private String barCode;
	private double price;
	@ManyToOne
	@JsonIgnoreProperties("productVariants")
	private Products products;
}
