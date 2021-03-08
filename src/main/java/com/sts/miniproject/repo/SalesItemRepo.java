package com.sts.miniproject.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sts.miniproject.vo.SalesItem;

public interface SalesItemRepo extends JpaRepository<SalesItem, Long>{

}
