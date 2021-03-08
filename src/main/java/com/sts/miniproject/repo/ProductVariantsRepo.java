package com.sts.miniproject.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sts.miniproject.vo.ProductVariants;

public interface ProductVariantsRepo extends JpaRepository<ProductVariants, Long> {
	
	@Query(value="select * from product_variants where product_variants.bar_Code = :barCode",nativeQuery = true)
	public ProductVariants findVariantsByBarcode(@Param("barCode") String barCode);

}
