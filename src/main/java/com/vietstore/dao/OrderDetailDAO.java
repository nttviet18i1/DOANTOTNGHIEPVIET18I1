package com.vietstore.dao;

import java.util.List;

import com.vietstore.entity.OrderDetail;


public interface OrderDetailDAO {
	OrderDetail findById(Integer id);

	List<OrderDetail> findAll();

	OrderDetail create(OrderDetail entity);

	void update(OrderDetail entity);

	OrderDetail delete(Integer id);
	

}
