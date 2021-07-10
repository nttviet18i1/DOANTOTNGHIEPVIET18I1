package com.vietstore.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.vietstore.entity.Order;
@Transactional
@Repository
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	SessionFactory factory;
	@Override
	public Order findById(Integer id) {
		Session session= factory.getCurrentSession();
		Order entity = session.find(Order.class,id);
		return entity;
	}

	@Override
	public List<Order> findAll() {
		String hql="FROM Order";
		Session session= factory.getCurrentSession();
		TypedQuery<Order>query= session.createQuery(hql,Order.class);
		List<Order>list=query.getResultList();
		
		return list;
	}

	@Override
	public Order create(Order entity) {
		Session session= factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Order entity) {
		Session session= factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Order delete(Integer id) {
		Session session= factory.getCurrentSession();
		Order entity = session.find(Order.class,id);
		session.delete(entity);
		return entity;
	}
	
	

}
