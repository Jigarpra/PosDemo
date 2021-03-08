package com.sts.miniproject.vo;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Entity
@Data
public class SalesItem {

	@Id 
	@GeneratedValue()
	private long salesitemId;
	
	private long price;
	
	private double quantity;
	@ManyToOne
	private ProductVariants productvariants;
	@ManyToOne
    @JsonIgnoreProperties("salesItem") 
	private Sales sales;
	@Override
	public String toString() {
		return "SalesItem [salesitemId=" + salesitemId + ", price=" + price + ", quantity=" + quantity
				+ ", productvariants=" + productvariants + "]";
	}
}
