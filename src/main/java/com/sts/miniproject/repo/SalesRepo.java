package com.sts.miniproject.repo;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;


import com.sts.miniproject.vo.Sales;

public interface SalesRepo extends JpaRepository<Sales, Long>,DataTablesRepository<Sales, Long>{

}
