package com.sts.miniproject.vo;

import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

@Entity
@Data
public class Sales {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long salesId;
	
	private String prefix;
	
	private double total;
	@OneToMany(mappedBy = "sales",cascade = CascadeType.ALL)
	
	private List<SalesItem> salesItem;
	@Override
	public String toString() {
		return "Sales [salesId=" + salesId + ", prefix=" + prefix + ", salesItem=" + salesItem
				+ "]";
	}
}
