package com.vietstore.dao;

import java.util.List;

import com.vietstore.entity.Order;
import com.vietstore.entity.OrderDetail;
import com.vietstore.entity.Product;
import com.vietstore.entity.User;


public interface OrderDAO {
	Order findById(Integer id);

	List<Order> findAll();

	Order create(Order entity);

	void update(Order entity);

	Order delete(Integer id);

	void create(Order order, List<OrderDetail> details);

	List<Order> findByUser(User user);

	List<Product> findItemsByUser(User user);

	


	

}
